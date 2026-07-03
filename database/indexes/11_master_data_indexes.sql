USE EnterpriseDataPlatform;
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Customer_Status_Country' AND object_id = OBJECT_ID('core.Customer'))
    CREATE NONCLUSTERED INDEX IX_Customer_Status_Country
    ON core.Customer (CustomerStatus, CountryCode)
    INCLUDE (CustomerNumber, CustomerName);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Supplier_Status_Country' AND object_id = OBJECT_ID('core.Supplier'))
    CREATE NONCLUSTERED INDEX IX_Supplier_Status_Country
    ON core.Supplier (SupplierStatus, CountryCode)
    INCLUDE (SupplierNumber, SupplierName);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Product_Category_Status' AND object_id = OBJECT_ID('core.Product'))
    CREATE NONCLUSTERED INDEX IX_Product_Category_Status
    ON core.Product (ProductCategory, ProductStatus)
    INCLUDE (ProductNumber, ProductName, UnitOfMeasure);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Location_Type_Country' AND object_id = OBJECT_ID('core.Location'))
    CREATE NONCLUSTERED INDEX IX_Location_Type_Country
    ON core.Location (LocationType, CountryCode)
    INCLUDE (LocationCode, LocationName);
GO
