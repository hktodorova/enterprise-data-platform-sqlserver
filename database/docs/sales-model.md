# Sales model

This part of the model adds a small sales process on top of the master data tables.

The model intentionally keeps the structure simple:

- `core.SalesOrder` stores the document header.
- `core.SalesOrderLine` stores individual product lines.
- `core.Invoice` stores billing information and may reference a sales order.

A few design choices are deliberate:

- monetary totals use `DECIMAL`, not floating point types;
- document numbers are unique business keys;
- generated totals are implemented as computed persisted columns;
- indexes support common access paths: customer history, order status, invoice history and product sales analysis.

The model is not meant to replace an ERP system. It provides a realistic operational dataset for ETL, reporting, monitoring and performance tuning examples later in the project.
