# Monitoring

Monitoring is an important part of any data platform. Loading data is only one aspect of the system; maintaining performance, availability and reliability is equally important.

This project includes a dedicated monitoring area with SQL Server scripts and operational documentation that demonstrate common database administration tasks.

---

## Monitoring Goals

The monitoring layer helps answer questions such as:

- Is the database healthy?
- Are ETL processes completing successfully?
- Are indexes performing efficiently?
- Are long-running queries affecting performance?
- Are backups running as expected?
- Are application errors being recorded?

---

## Current Monitoring Coverage

The current version of the project includes monitoring examples for:

- SQL Server health checks
- ETL execution status
- application logging
- index usage
- index fragmentation
- long-running queries
- blocking sessions
- backup verification

These checks provide a practical starting point for operational database monitoring.

---

## Typical Operational Checks

### Database Health

Basic health checks verify that SQL Server is online and available before ETL processing begins.

Typical examples include:

- database availability
- recovery model
- database size
- connection status

---

### ETL Monitoring

Each ETL execution should provide visibility into:

- execution time
- processed batches
- successful loads
- failed loads
- error messages

Audit and logging tables are designed to support this type of analysis.

---

### Blocking Sessions

Blocking can delay ETL execution and reporting queries.

Typical monitoring identifies:

- blocking session
- blocked session
- wait duration
- blocking query

---

### Index Health

Indexes are monitored to maintain query performance.

Typical maintenance decisions include:

- reorganize fragmented indexes
- rebuild heavily fragmented indexes
- identify unused indexes

---

### Backup Verification

Backup monitoring confirms that recent backups exist and can be used for recovery if required.

Typical checks include:

- latest successful backup
- backup age
- recovery model
- backup history

---

### Application Logging

Application logs provide operational visibility into ETL execution.

Typical information includes:

- execution timestamp
- severity
- process name
- error message
- execution status

---

## Future Improvements

Future versions of the project may include:

- Query Store analysis
- Extended Events
- SQL Agent job monitoring
- automated health reports
- Grafana dashboards
- Azure Monitor integration
- performance trend reporting

---

## Design Philosophy

The monitoring examples are intentionally lightweight but follow the same principles commonly used in enterprise SQL Server environments:

- observe before troubleshooting
- collect operational metrics
- log important events
- keep monitoring independent from business logic
- make health checks repeatable
