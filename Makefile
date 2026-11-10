ifneq (,$(wildcard .env))
include .env
export
endif

.PHONY: help up down migrate load-data forecast api lint format test

help:
	@echo "Targets: up down migrate load-data forecast api lint format test"

up:
	docker compose up -d db redis

down:
	docker compose down

migrate:
	cd backend && uv run alembic upgrade head

load-data:
	@echo "Added on Day 4 (pipeline)"

forecast:
	@echo "Added on Day 6 (forecasting)"

api:
	cd backend && uv run uvicorn app.main:app --reload

lint:
	cd backend && uv run ruff check . && uv run ruff format --check . && uv run mypy app
	@if [ -f pipeline/pyproject.toml ]; then cd pipeline && uv run ruff check . && uv run ruff format --check .; fi

format:
	cd backend && uv run ruff format . && uv run ruff check --fix .

test:
	cd backend && uv run pytest
