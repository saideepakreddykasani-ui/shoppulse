# 0001. Tech stack

- **Status:** accepted
- **Date:** Day 1

## Context

ShopPulse is a portfolio project. It needs a backend API, a data pipeline, and a dashboard. It should use tools that are common in data and software roles in Ireland and can be finished in 10 days.

## Decision

- **Language:** Python 3.12 for the backend and the pipeline.
- **Database:** PostgreSQL 16, run locally with Docker Compose.
- **API:** FastAPI.
- **Pipeline orchestration:** Prefect, chosen over Airflow because it is lighter to set up locally.
- **Frontend:** React with TypeScript and Vite.

## Consequences

- One language (Python) covers the API, the pipeline, and the forecasting code.
- PostgreSQL is a single database for the API and the pipeline output.
- Prefect adds a dependency, but it is simpler to run locally than Airflow.
- The frontend is a separate build, so the project has two toolchains (Python and Node).
