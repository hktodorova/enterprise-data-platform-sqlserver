# Architecture Decisions

This document captures the main design decisions behind the project.

## Decision 1: Use SQL Server

SQL Server was selected because the project focuses on database engineering topics such as:

- T-SQL development
- relational modelling
- indexing
- monitoring
- backup and recovery
- operational troubleshooting

It also aligns well with enterprise environments where Microsoft data platforms are commonly used.

## Decision 2: Use Docker for local development

Docker makes the project easier to run locally without installing a full SQL Server instance directly on the machine.

Benefits:

- repeatable setup
- isolated environment
- easy cleanup
- closer to real deployment workflows

## Decision 3: Separate staging and core schemas

Raw input data is stored in `staging` before it is promoted into `core`.

This helps with:

- troubleshooting bad source records
- preserving input structure
- validating data before loading into business tables
- separating raw and trusted data

## Decision 4: Keep reporting separate

Reporting views should not directly depend on raw staging data. They should expose curated data from the core model.

This keeps reports more stable and avoids mixing raw source issues with business-facing outputs.

## Decision 5: Include audit and logging tables

ETL and database operations need traceability.

Audit and logging tables help answer questions such as:

- When was data loaded?
- Which batch failed?
- How many records were processed?
- What error occurred?

## Decision 6: Keep the first version small

The goal of the first version is not to cover every possible enterprise feature. The goal is to create a working, understandable and extensible foundation.

Future versions can add:

- Azure SQL deployment notes
- Query Store
- Extended Events
- Power BI or Grafana dashboards
- orchestration with Airflow
- dbt transformations
