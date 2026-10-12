$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

Write-Host ''
Write-Host '=============================================='
Write-Host '  KSHETRASETU - LOCAL LAUNCHER'
Write-Host '=============================================='
Write-Host ''

# Find Python using the Windows Python launcher first, then python.exe.
$python = Get-Command py.exe -ErrorAction SilentlyContinue
if (-not $python) { $python = Get-Command python.exe -ErrorAction SilentlyContinue }
if (-not $python) {
    Write-Host 'ERROR: Python 3 was not found on this computer.' -ForegroundColor Red
    Write-Host ''
    Write-Host 'Install Python 3 from https://www.python.org/downloads/windows/'
    Write-Host 'During installation, enable: Add python.exe to PATH'
    exit 1
}

# Use a free localhost port. 8000 is preferred for familiarity.
$port = 8000
while ($true) {
    $listener = $null
    try {
        $listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Loopback, $port)
        $listener.Start()
        $listener.Stop()
        break
    } catch {
        if ($listener) { try { $listener.Stop() } catch {} }
        $port++
        if ($port -gt 8100) {
            Write-Host 'ERROR: No free local port was found between 8000 and 8100.' -ForegroundColor Red
            exit 1
        }
    }
}

Write-Host "Starting KshetraSetu on http://127.0.0.1:$port/"

# Start Python in its own console window. Using Start-Process directly avoids
# the nested CMD quoting bug that broke the previous launcher.
$arguments = @('-m', 'http.server', "$port", '--bind', '127.0.0.1')
$server = Start-Process -FilePath $python.Source -ArgumentList $arguments -WorkingDirectory $PSScriptRoot -PassThru

# Wait until the HTTP server is actually reachable before opening the browser.
$ready = $false
for ($i = 0; $i -lt 30; $i++) {
    Start-Sleep -Milliseconds 250
    try {
        $response = Invoke-WebRequest -Uri "http://127.0.0.1:$port/" -UseBasicParsing -TimeoutSec 2
        if ($response.StatusCode -ge 200 -and $response.StatusCode -lt 500) {
            $ready = $true
            break
        }
    } catch {}
}

if (-not $ready) {
    Write-Host ''
    Write-Host 'ERROR: The local web server did not become reachable.' -ForegroundColor Red
    if ($server -and -not $server.HasExited) {
        Write-Host "Python server process started with PID $($server.Id), but did not answer HTTP."
    }
    Write-Host 'Try opening the server console window to see the Python error.'
    exit 1
}

$url = "http://127.0.0.1:$port/"
Write-Host "KshetraSetu is ready: $url" -ForegroundColor Green
Start-Process $url
Write-Host ''
Write-Host 'The browser should now open automatically.'
Write-Host 'Keep the Python server process running while using KshetraSetu.'
Write-Host ''
Write-Host "If the browser does not open, copy this address into Chrome: $url"
Write-Host ''
