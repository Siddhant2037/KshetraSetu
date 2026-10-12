# KshetraSetu — SIH26010

## Simple project overview

**Base-preservation note:** this package keeps the original KshetraSetu UI, navigation and public-data approach. Feature updates are implemented inside the existing application rather than replacing it with a new prototype.

**KshetraSetu is a field-to-cadastral verification platform.**

It helps a survey officer compare an **existing land record** with **new UAV/RTK survey evidence**, identify spatial differences, validate geometry, send discrepancies for field verification, and maintain an auditable digital parcel history.

### The whole idea in 5 steps

**SURVEY → DETECT → VALIDATE → VERIFY → RECORD**

1. **Survey** — collect RTK/GNSS points, GCPs, field notes, photos and UAV observations.
2. **Detect** — compare recorded and observed parcel boundaries and highlight changes.
3. **Validate** — check polygon closure, overlaps, gaps, self-intersections and other GIS topology issues.
4. **Verify** — an authorized officer reviews AI candidates and field evidence.
5. **Record** — produce a traceable verified parcel record with evidence and audit history.

## What makes the demo easy to understand

### Parcel Digital Twin

Select Parcel 103 and view its evolution:

**Recorded → Observed → Difference → Verified**

Example demo values:

- Original record: **1.82 ha**
- Resurvey: **1.67 ha**
- Field verified: **1.69 ha**
- Maximum boundary displacement: **1.14 m**
- RTK mean error: **0.084 m**
- AI candidate confidence: **91.7%**

These are synthetic demonstration values.

## Main modules

- **Command Center** — project KPIs and parcel map
- **Survey Projects** — project register and progress
- **Survey Methodology** — end-to-end resurvey workflow
- **Survey Control** — RTK/CORS/GCP control network
- **Field Survey** — point capture, boundary capture, photos and notes
- **UAV Workspace** — flight information and processing pipeline
- **AI Boundary Analysis** — candidate boundary and confidence review
- **GIS Validation** — topology checks and officer-confirmed fixes
- **Change Analysis** — old vs new parcel comparison
- **Evidence & Audit** — evidence register and timeline

## Architecture in one sentence

**A lightweight browser application with static HTML/CSS/JavaScript, demo geospatial workflows, browser-local persistence and JSON export.**

See [`ARCHITECTURE.md`](ARCHITECTURE.md) for the detailed architecture.

## Real-input workflow added in this version

The existing screens now support a source-bound workflow:
- **Field Survey:** browser location or Web Serial GNSS/NMEA input, real point capture, boundary closure, field-photo metadata, notes, offline queue and audit logging.
- **Survey Control:** import a real GCP/control CSV and retain its point values as user-supplied evidence.
- **UAV Workspace:** import actual UAV imagery/files and GeoJSON; processing is never marked complete merely because the button was clicked.
- **AI / GIS:** run closure, area and self-intersection checks on supplied GeoJSON. AI confidence is not fabricated.
- **Change Analysis:** compare recorded/source and observed/resurvey GeoJSON and report source-derived area difference.
- **Evidence & Audit:** show actual captured observations, notes, photos, controls, pending records and officer actions.
- **Digital Parcel Twin:** remains the existing parcel lifecycle view and is accessible from the sidebar.

**Important:** public map data and user-supplied survey files are not automatically legal cadastral records. Authorized government verification is still required.

## Run locally

### Windows

Double-click `run.bat`.

### Any machine with Python

```bash
python -m http.server 8080
```

Then open:

`http://localhost:8080`

### Demo login

- Officer ID: `SURVEY-001`
- Password: `demo123`

## Deploy

The project is a static site, so it can be deployed without a frontend build step.

### Option 1 — Docker

```bash
docker build -t kshetrasetu .
docker run --rm -p 8080:80 kshetrasetu
```

Open `http://localhost:8080`.

### Option 2 — Vercel

Import the project/repository into Vercel. The included `vercel.json` serves the static application.

### Option 3 — Netlify

Import the project/repository into Netlify. The included `netlify.toml` configures the publish directory.

### Option 4 — Render

Import the repository into Render using the included `render.yaml`.

### Option 5 — Any static web server

Upload these files to a static host:

`index.html`, `styles.css`, `app.js`, `project.json`

No `npm install` or build command is needed.

## Deployment architecture

```text
User Browser
     |
     v
Static Host / CDN / Nginx
     |
     +--> index.html
     +--> styles.css
     +--> app.js
     +--> project.json
              |
              v
        Browser localStorage
              |
              v
        JSON survey export
```

## Production path

For a real government deployment, keep the existing UI workflow but replace the demo/local state with authorized services for authentication, cadastral data, GIS services, survey evidence storage, UAV processing, audit logging and government-system integration.

**Integration Ready — Requires Authorized Government APIs/Data Access**

The prototype does not claim live integration with DILRMP, SVAMITVA, Bhu-Naksha, ULPIN, NAKSHA, Survey of India or state land-record systems.

AI assists spatial interpretation; authorized personnel remain responsible for final verification. AI does not decide ownership, legal possession, disputes or legal encroachment.


## Real public data

This prototype now uses real public geospatial sources where access is publicly available:

- **OpenStreetMap** live map tiles for the Command Center and Public Data page.
- **Nominatim / OpenStreetMap** live public place search.
- **Maharashtra Bhumi Abhilekh** official public land-record services, including e-Nakasha/Bhu-Naksha, e-Mojani and Digital 7/12, linked from the prototype.
- **data.gov.in — Maharashtra State Administrative Jurisdiction** as the official public reference for Maharashtra district/taluka/village master data.
- **ISRO Bhuvan** public geospatial viewer linked as an additional reference source.

### Important data boundary

The prototype does **not** fabricate an official cadastral parcel dataset. Official cadastral/land-record geometry should only be connected through an authorized government API, licensed download, or approved data-sharing mechanism. The parcel comparison, RTK observations, AI candidate boundaries and survey evidence currently remain clearly labelled prototype/demo workflow data.

## Real-data mode (updated 30 Sep 2026)
The six survey screens no longer present synthetic measurements as authenticated evidence.
- Survey Control: official Survey of India CORS reference plus real GNSS/NMEA connection and real GCP CSV import.
- Live Field Survey: browser device location or connected GNSS receiver; captured observations are stored locally.
- UAV Workspace: real orthomosaic/image and GeoJSON import, with official ISRO Bhuvan and Survey of India references.
- AI Boundary Analysis: operates only on an imported real GeoJSON geometry and does not invent an AI confidence score.
- GIS Validation: validates supplied geometry and computes an area approximation; advanced topology results remain explicitly pending a GIS engine.
- Cadastral Change Analysis: compares two supplied source geometries and does not invent displacement values.
Official cadastral records must come from authorized Maharashtra land-record services such as e-Nakasha/Bhu-Naksha, 7/12/ULPIN and e-Mojani.

## Windows launcher troubleshooting

The recommended launcher is `START_KSHETRASETU.bat`.

1. Extract the entire ZIP folder.
2. Open the extracted `KshetraSetu_COMPLETE` folder.
3. Double-click `START_KSHETRASETU.bat`.
4. Keep the black server window open.
5. Open `http://127.0.0.1:8000/` if the browser does not open automatically.

Python 3 is required for the local launcher. During Python installation on Windows, enable **Add python.exe to PATH**.

If Python is already installed but the launcher reports it is missing, open Command Prompt and run `py --version` or `python --version`. Then run the launcher again.
