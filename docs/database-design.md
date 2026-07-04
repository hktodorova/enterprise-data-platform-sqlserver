# Database Design

The database model is designed as a small enterprise-style operational data platform. It is intentionally compact, but it follows patterns that are common in larger SQL Server environments.

## Schema layout

The database is separated into logical schemas:

- `staging` – raw data loaded from external files or source extracts
- `core` – cleaned and relational business entities
- `reporting` – views prepared for analytics and reporting
- `audit` – load tracking and batch history
- `logging` – application and operational messages

This separation keeps raw data away from curated data and makes troubleshooting easier.

## Core model

The core model represents business entities such as companies, customers, products and sales orders.

Typical flow:

```text
Company
  └── Customer

Product
  └── SalesOrderLine

SalesOrderHeader
  └── SalesOrderLine
```

The model uses primary keys, foreign keys and indexes to keep data consistent and query performance predictable.

## Design principles

- Keep raw input data in staging before applying transformations.
- Store validated and cleaned entities in the core schema.
- Use surrogate keys for internal relationships.
- Keep source system identifiers where useful for traceability.
- Use indexes on common lookup and join columns.
- Keep reporting access separate from operational tables.

## Why this design

The structure is simple enough to run locally in Docker, but it reflects real database engineering concerns: data quality, traceability, maintainability and performance.
