# Master data model

This part of the database contains the core master data used by later sales, inventory and reporting examples.

The first model includes:

- `core.Customer`
- `core.Supplier`
- `core.Product`
- `core.Location`

The tables use business keys such as `CustomerNumber`, `SupplierNumber`, `ProductNumber` and `LocationCode`. Surrogate keys are used for joins and future fact tables.

Common operational columns are included intentionally:

- `SourceSystem`
- `SourceRecordID`
- `CreatedAt`
- `ModifiedAt`
- `IsDeleted` or `IsActive`

This keeps the model close to typical enterprise integration scenarios where records come from multiple source systems.
