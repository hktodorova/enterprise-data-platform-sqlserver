USE EnterpriseDataPlatform;
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_Customer_Company_Status' AND object_id = OBJECT_ID(N'core.Customer'))
    CREATE INDEX IX_Customer_Company_Status ON core.Customer (CompanyId, CustomerStatus);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_SalesOrderHeader_OrderDate' AND object_id = OBJECT_ID(N'core.SalesOrderHeader'))
    CREATE INDEX IX_SalesOrderHeader_OrderDate ON core.SalesOrderHeader (OrderDate) INCLUDE (CompanyId, CustomerId, OrderStatus);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_SalesOrderLine_Product' AND object_id = OBJECT_ID(N'core.SalesOrderLine'))
    CREATE INDEX IX_SalesOrderLine_Product ON core.SalesOrderLine (ProductId) INCLUDE (Quantity, UnitPrice);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_CustomerRaw_Batch_Processed' AND object_id = OBJECT_ID(N'staging.CustomerRaw'))
    CREATE INDEX IX_CustomerRaw_Batch_Processed ON staging.CustomerRaw (BatchId, IsProcessed);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_ProductRaw_Batch_Processed' AND object_id = OBJECT_ID(N'staging.ProductRaw'))
    CREATE INDEX IX_ProductRaw_Batch_Processed ON staging.ProductRaw (BatchId, IsProcessed);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_SalesOrderRaw_Batch_Processed' AND object_id = OBJECT_ID(N'staging.SalesOrderRaw'))
    CREATE INDEX IX_SalesOrderRaw_Batch_Processed ON staging.SalesOrderRaw (BatchId, IsProcessed);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_ApplicationLog_CreatedAtUtc' AND object_id = OBJECT_ID(N'logging.ApplicationLog'))
    CREATE INDEX IX_ApplicationLog_CreatedAtUtc ON logging.ApplicationLog (CreatedAtUtc DESC) INCLUDE (LogLevel, ComponentName);
GO
