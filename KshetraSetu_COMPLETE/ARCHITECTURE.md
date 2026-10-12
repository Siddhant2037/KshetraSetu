# KshetraSetu — Simple Architecture

## One-line architecture

**Browser UI → Local application state → Demo geospatial workflows → LocalStorage / JSON export**

The current prototype is intentionally lightweight. It is a static frontend with a tiny optional local HTTP server; it does not require a database, cloud API, build tool, or framework.

## Main components

```text
+-----------------------------+
|        Browser / Tablet     |
|  index.html + styles.css    |
|          + app.js           |
+--------------+--------------+
               |
               v
+-----------------------------+
|      Application State       |
| parcel data / survey points  |
| workflow status / UI state   |
+--------------+--------------+
               |
        +------+------+
        |             |
        v             v
+---------------+  +----------------+
| localStorage  |  | JSON Export     |
| offline queue |  | survey record   |
+---------------+  +----------------+

Optional deployment layer:
Static hosting / Docker / Python HTTP server
```

## File responsibilities

| File | Purpose |
|---|---|
| `index.html` | Application shell and page entry point |
| `styles.css` | Government-style responsive UI styling |
| `app.js` | Navigation, demo data, parcel map, survey simulation, workflows and persistence |
| `project.json` | Prototype metadata and demo credentials |
| `run.bat` | One-click Windows local server |
| `README.md` | Simplified project overview and run/deploy instructions |
| `ARCHITECTURE.md` | Architecture explanation |
| `Dockerfile` | Container deployment |
| `nginx.conf` | Static production web server configuration |
| `vercel.json` | Vercel deployment configuration |
| `netlify.toml` | Netlify deployment configuration |
| `render.yaml` | Render deployment configuration |

## Runtime flow

1. `index.html` loads the UI.
2. `app.js` creates the demo application state.
3. The officer logs into Demo Mode.
4. Navigation opens the survey modules without a page reload.
5. RTK points, field notes and offline actions are stored in browser `localStorage`.
6. Survey data can be exported as a JSON file.
7. Deployment platforms serve the same static files.

## Important prototype boundary

This architecture demonstrates the product workflow, not a production land-record backend. It does **not** claim live integration with DILRMP, SVAMITVA, Bhu-Naksha, ULPIN, NAKSHA, Survey of India or state land-record systems.

A production version can replace the local state layer with authorized APIs and a secure backend while keeping the UI workflow largely intact.


## Public-data layer

The UI separates public reference data from prototype survey records. Leaflet renders live OpenStreetMap tiles in the browser. Nominatim provides public geocoding/search. Official Maharashtra Bhumi Abhilekh and data.gov.in services are exposed as source links. No claim is made that the prototype has authenticated access to official cadastral parcel geometry.

## Source-authenticated survey mode
The prototype deliberately separates three evidence classes: (1) official public government references, (2) live device/GNSS observations, and (3) user-supplied survey files. Synthetic coordinates, fake RTK accuracy, fake GCPs, fake AI confidence and fake UAV processing completion are not displayed as authenticated evidence in the six upgraded survey screens.
