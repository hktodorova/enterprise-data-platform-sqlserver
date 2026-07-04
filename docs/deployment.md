# Deployment Guide

This guide describes how to run the project locally.

## Prerequisites

- Git
- Docker Desktop
- Python 3.11 or newer
- Azure Data Studio or SQL Server Management Studio

## Clone the repository

```powershell
git clone https://github.com/hktodorova/enterprise-data-platform-sqlserver.git
cd enterprise-data-platform-sqlserver
```

## Start SQL Server

```powershell
docker compose up -d sqlserver
```

Check that the container is running:

```powershell
docker ps
```

Expected container:

```text
edp-sqlserver
```

## Connect to SQL Server

Use Azure Data Studio or SQL Server Management Studio.

Connection settings:

```text
Server: localhost,1433
Authentication: SQL Login
User: sa
Password: YourStrongPassword123!
Trust Server Certificate: enabled
```

## Run database scripts

Execute the SQL scripts in this order:

```text
database/01_create_database.sql
database/02_create_schemas.sql
database/03_create_core_tables.sql
database/04_create_staging_tables.sql
database/05_create_audit_logging_tables.sql
database/06_create_indexes.sql
database/07_seed_reference_data.sql
```

## Run Python tests

Create and activate a virtual environment:

```powershell
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
pytest
```

## Stop the environment

```powershell
docker compose down
```

## Notes

The project is designed for local development and demonstration. It is not intended to be deployed directly to production without further hardening.
