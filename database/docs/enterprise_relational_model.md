# Enterprise relational model

This commit adds the first version of the core relational model.

The model is intentionally simple enough to run locally, but it follows patterns I have used in enterprise systems:

- separate `core` schema for curated business entities
- stable surrogate keys for internal joins
- business keys such as customer number, product number and document number
- basic data quality constraints
- audit columns on every operational table
- separate scripts for tables, foreign keys, indexes and reference data

## Main entities

- Location
- Department
- Customer
- Supplier
- Product
- Employee
- SalesOrder
- SalesOrderLine
- Invoice
- InventoryBalance

## Notes

Foreign keys are kept in a separate script so the table scripts can be executed and reviewed independently.
This also makes later migration and troubleshooting easier.
