# Changelog

## 1.0.0-demo
- Initial complete self-contained KshetraSetu prototype.
- Implemented the workflow through Change Detection from the supplied specification.
- Added localStorage-backed offline queue and exportable survey record.
- Added synthetic RTK/GCP/UAV data and explicit demo-data labels.


## 2026-09-30 — Real public data integration
- Added live OpenStreetMap basemap with Leaflet.
- Added live Nominatim public geocoding search.
- Added Public Data & Sources page.
- Added official Maharashtra Bhumi Abhilekh service references.
- Added data.gov.in Maharashtra State Administrative Jurisdiction reference.
- Added ISRO Bhuvan public geospatial reference.
- Kept synthetic parcel/survey evidence explicitly separated from public data.


## 2026-09-30 — Feature integration into existing version
- Preserved the existing KshetraSetu UI and public-data architecture.
- Added Digital Parcel Twin to the main navigation.
- Replaced synthetic field-photo metadata flow with real photo-file metadata capture.
- Added persistent field observations, boundaries, notes, photos and audit trail.
- Added real GCP/control CSV persistence.
- Added geometry self-intersection validation alongside closure and area checks.
- Added UAV input validation without falsely claiming photogrammetry completion.
- Kept AI confidence and legal cadastral conclusions source-dependent and non-fabricated.

## 2026-10-01 — Digital Parcel Twin refinement
- Reworked Parcel Digital Twin into a single-source evidence lineage view.
- Removed hard-coded synthetic parcel geometry from the Twin visualization.
- Twin now renders captured field boundary geometry only when real device observations exist.
- Added provenance/status indicators, evidence lineage, verification action, and Twin JSON export.
- Prototype register values are explicitly labelled as reference metadata rather than authenticated cadastral evidence.
