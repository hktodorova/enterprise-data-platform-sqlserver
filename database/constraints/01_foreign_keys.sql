USE EnterpriseDataPlatform;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Employee_Department')
    ALTER TABLE core.Employee ADD CONSTRAINT FK_Employee_Department
    FOREIGN KEY (DepartmentId) REFERENCES core.Department(DepartmentId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Employee_Location')
    ALTER TABLE core.Employee ADD CONSTRAINT FK_Employee_Location
    FOREIGN KEY (LocationId) REFERENCES core.Location(LocationId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_SalesOrder_Customer')
    ALTER TABLE core.SalesOrder ADD CONSTRAINT FK_SalesOrder_Customer
    FOREIGN KEY (CustomerId) REFERENCES core.Customer(CustomerId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_SalesOrderLine_SalesOrder')
    ALTER TABLE core.SalesOrderLine ADD CONSTRAINT FK_SalesOrderLine_SalesOrder
    FOREIGN KEY (SalesOrderId) REFERENCES core.SalesOrder(SalesOrderId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_SalesOrderLine_Product')
    ALTER TABLE core.SalesOrderLine ADD CONSTRAINT FK_SalesOrderLine_Product
    FOREIGN KEY (ProductId) REFERENCES core.Product(ProductId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Invoice_SalesOrder')
    ALTER TABLE core.Invoice ADD CONSTRAINT FK_Invoice_SalesOrder
    FOREIGN KEY (SalesOrderId) REFERENCES core.SalesOrder(SalesOrderId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Invoice_Customer')
    ALTER TABLE core.Invoice ADD CONSTRAINT FK_Invoice_Customer
    FOREIGN KEY (CustomerId) REFERENCES core.Customer(CustomerId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_InventoryBalance_Product')
    ALTER TABLE core.InventoryBalance ADD CONSTRAINT FK_InventoryBalance_Product
    FOREIGN KEY (ProductId) REFERENCES core.Product(ProductId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_InventoryBalance_Location')
    ALTER TABLE core.InventoryBalance ADD CONSTRAINT FK_InventoryBalance_Location
    FOREIGN KEY (LocationId) REFERENCES core.Location(LocationId);
GO
