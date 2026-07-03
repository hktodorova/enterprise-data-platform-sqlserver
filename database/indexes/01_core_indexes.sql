USE EnterpriseDataPlatform;
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Customer_Country_Status' AND object_id = OBJECT_ID('core.Customer'))
    CREATE INDEX IX_Customer_Country_Status ON core.Customer (CountryCode, IsActive) INCLUDE (CustomerNumber, CustomerName);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Product_Category_Active' AND object_id = OBJECT_ID('core.Product'))
    CREATE INDEX IX_Product_Category_Active ON core.Product (ProductCategory, IsActive) INCLUDE (ProductNumber, ProductName, ListPrice);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_SalesOrder_OrderDate_Status' AND object_id = OBJECT_ID('core.SalesOrder'))
    CREATE INDEX IX_SalesOrder_OrderDate_Status ON core.SalesOrder (OrderDate, OrderStatus) INCLUDE (CustomerId, CurrencyCode);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_SalesOrderLine_Product' AND object_id = OBJECT_ID('core.SalesOrderLine'))
    CREATE INDEX IX_SalesOrderLine_Product ON core.SalesOrderLine (ProductId) INCLUDE (Quantity, UnitPrice, LineAmount);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Invoice_Date_Status' AND object_id = OBJECT_ID('core.Invoice'))
    CREATE INDEX IX_Invoice_Date_Status ON core.Invoice (InvoiceDate, InvoiceStatus) INCLUDE (CustomerId, GrossAmount);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_InventoryBalance_Date_Location' AND object_id = OBJECT_ID('core.InventoryBalance'))
    CREATE INDEX IX_InventoryBalance_Date_Location ON core.InventoryBalance (BalanceDate, LocationId) INCLUDE (ProductId, QuantityOnHand, QuantityReserved);
GO
