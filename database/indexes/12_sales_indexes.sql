USE EnterpriseDataPlatform;
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_SalesOrder_Customer_OrderDate')
    CREATE INDEX IX_SalesOrder_Customer_OrderDate ON core.SalesOrder(CustomerID, OrderDate DESC);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_SalesOrder_Status_OrderDate')
    CREATE INDEX IX_SalesOrder_Status_OrderDate ON core.SalesOrder(OrderStatus, OrderDate DESC) INCLUDE (NetAmount, TaxAmount);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_SalesOrderLine_Product')
    CREATE INDEX IX_SalesOrderLine_Product ON core.SalesOrderLine(ProductID) INCLUDE (Quantity, UnitPrice);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Invoice_Customer_InvoiceDate')
    CREATE INDEX IX_Invoice_Customer_InvoiceDate ON core.Invoice(CustomerID, InvoiceDate DESC);
GO
