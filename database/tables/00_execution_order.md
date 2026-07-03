# Execution order

Run the table scripts in numeric order:

1. Location
2. Department
3. Customer
4. Supplier
5. Product
6. Employee
7. SalesOrder
8. SalesOrderLine
9. Invoice
10. InventoryBalance

After that run:

1. constraints/01_foreign_keys.sql
2. indexes/01_core_indexes.sql
3. reference/01_seed_core_master_data.sql
