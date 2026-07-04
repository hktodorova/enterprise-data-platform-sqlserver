# ETL Process

The project includes a lightweight Python-based ETL pipeline that demonstrates how business data can be imported into SQL Server using a staging-first approach.

The current implementation focuses on creating a repeatable local workflow rather than a production-scale data integration platform. It provides a solid foundation that can be extended with incremental loading, orchestration and cloud services.

---

## ETL Architecture

```text
Sample Data Generator
        │
        ▼
CSV Files
        │
        ▼
Python ETL
        │
        ▼
staging schema
        │
        ▼
Data Validation
        │
        ▼
core schema
        │
        ▼
Reporting Views
```

---

## Current Implementation

The current version of the project includes:

- sample business data generation using Python
- CSV-based source files
- Docker-based execution environment
- SQL Server staging tables
- normalized core data model
- audit and logging tables
- automated Python tests

The ETL process is intentionally simple so it can be understood, modified and executed locally.

---

## Staging-first Design

Incoming files are first loaded into the **staging** schema.

Reasons for using staging:

- preserve the original source data
- isolate invalid records
- simplify troubleshooting
- support repeatable ETL executions
- avoid loading unvalidated data into the business model

After validation, data is transformed and loaded into the **core** schema.

---

## Python Responsibilities

Python is responsible for:

- generating sample business data
- reading CSV files
- validating input structure
- transforming source records
- preparing data for SQL Server
- logging execution details
- supporting automated tests

---

## Error Handling

The project distinguishes between technical failures and data quality problems.

Typical scenarios include:

- missing required columns
- invalid data types
- duplicate business keys
- failed SQL Server connection
- unexpected ETL exceptions

Future versions will extend logging with detailed batch statistics and error reporting.

---

## Future Improvements

The ETL pipeline has been intentionally designed to allow future enhancements, including:

- incremental loading
- configurable source definitions
- batch processing
- retry mechanisms
- orchestration with Apache Airflow
- dbt transformations
- Azure SQL support
- execution metrics and monitoring