# KshetraSetu — Run & Deployment Guide

## Windows one-click launch

1. Extract the ZIP completely.
2. Double-click `START_KSHETRASETU.bat`.
3. It starts a local HTTP server on port 8000 and opens the browser.
4. Open `http://localhost:8000/` if the browser does not open automatically.

Requirements: Python 3 installed and available as `py` or `python`.

Alternative: run `start.ps1` from PowerShell.

## Manual launch

From this folder:

`python -m http.server 8000`

Then open `http://localhost:8000/`.

## Docker

Build:

`docker build -t kshetrasetu .`

Run:

`docker run --rm -p 8080:80 kshetrasetu`

Open `http://localhost:8080/`.

## Static hosting

The application is a static HTML/CSS/JavaScript site. The included `vercel.json`, `netlify.toml`, and `render.yaml` provide deployment configuration for those platforms.

## Important data status

The application does not turn synthetic numbers into authenticated survey evidence. Survey Control, Live Field Survey, UAV Survey Workspace, AI Boundary Analysis, GIS Validation, and Cadastral Change Analysis use official public references, live device/GNSS input, or user-supplied survey files as applicable.

Authorized government cadastral APIs/data and authenticated correction services require the appropriate access credentials and permissions.
