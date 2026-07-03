# Database scripts

The scripts in this folder create the first SQL Server foundation for the project.

Run order:

1. `01_create_database.sql`
2. `02_create_schemas.sql`
3. `03_create_core_tables.sql`
4. `04_create_staging_tables.sql`
5. `05_create_audit_logging_tables.sql`
6. `06_create_indexes.sql`
7. `07_seed_reference_data.sql`

The structure is split into schemas because this is closer to how I usually see operational data platforms organized:

- `staging` for raw incoming records
- `core` for cleaned business entities
- `reporting` for later views and aggregates
- `audit` for batch tracking
- `logging` for operational logs
