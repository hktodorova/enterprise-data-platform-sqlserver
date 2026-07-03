# Database scripts

The database folder is organized by responsibility rather than by one large deployment script.

Current structure:

```text
tables/        core table definitions
constraints/   foreign keys and additional constraints
indexes/       non-clustered indexes
reference/     small reference and demo seed data
docs/          database model notes
```

Recommended execution order for this commit:

1. `tables/*.sql`
2. `constraints/*.sql`
3. `indexes/*.sql`
4. `reference/*.sql`

The scripts assume that the database and base schemas from the previous commit already exist.
