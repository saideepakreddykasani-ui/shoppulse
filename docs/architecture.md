# Architecture

## Users

- Store analysts who want sales trends and demand forecasts.
- Developers who want to call the API from other tools.

## Data flow

1. Olist order CSV files are placed in `pipeline/data/raw/` (not committed to Git).
2. The pipeline cleans the data and loads it into PostgreSQL.
3. The forecasting step writes predictions back to PostgreSQL.
4. The FastAPI backend reads from PostgreSQL and serves JSON.
5. The React dashboard calls the API and draws the charts.

## Components

| Component | Folder | Role |
|-----------|--------|------|
| Backend API | `backend/` | FastAPI, serves JSON |
| Pipeline | `pipeline/` | ETL and forecasting (Prefect, from Day 4) |
| Frontend | `frontend/` | React + TypeScript dashboard (from Day 8) |
| Database | `docker-compose` | PostgreSQL 16 |
| Infrastructure | `infra/` | Deployment configuration (later) |

## Text diagram

    Olist CSVs -> pipeline -> PostgreSQL <- FastAPI <- React dashboard
