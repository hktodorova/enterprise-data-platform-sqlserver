USE EnterpriseDataPlatform;
GO

IF NOT EXISTS (SELECT 1 FROM core.Location WHERE LocationCode = 'ZH-HQ')
BEGIN
    INSERT INTO core.Location (LocationCode, LocationName, LocationType, CountryCode, City, SourceSystem)
    VALUES
        ('ZH-HQ', 'Zurich Headquarters', 'Office', 'CH', 'Zurich', 'MANUAL'),
        ('ZH-WH1', 'Zurich Warehouse 1', 'Warehouse', 'CH', 'Zurich', 'MANUAL');
END;
GO

IF NOT EXISTS (SELECT 1 FROM core.Customer WHERE CustomerNumber = 'CUST-0001')
BEGIN
    INSERT INTO core.Customer (CustomerNumber, CustomerName, CustomerType, CountryCode, City, SourceSystem)
    VALUES
        ('CUST-0001', 'Contoso Retail AG', 'Business', 'CH', 'Zurich', 'MANUAL'),
        ('CUST-0002', 'Northwind Services GmbH', 'Business', 'CH', 'Winterthur', 'MANUAL');
END;
GO

IF NOT EXISTS (SELECT 1 FROM core.Supplier WHERE SupplierNumber = 'SUP-0001')
BEGIN
    INSERT INTO core.Supplier (SupplierNumber, SupplierName, CountryCode, City, SourceSystem)
    VALUES
        ('SUP-0001', 'Alpine Components AG', 'CH', 'Bern', 'MANUAL'),
        ('SUP-0002', 'Rhein Logistics GmbH', 'DE', 'Freiburg', 'MANUAL');
END;
GO

IF NOT EXISTS (SELECT 1 FROM core.Product WHERE ProductNumber = 'PROD-0001')
BEGIN
    INSERT INTO core.Product (ProductNumber, ProductName, ProductCategory, UnitOfMeasure, StandardCost, ListPrice, SourceSystem)
    VALUES
        ('PROD-0001', 'Standard Service Package', 'Service', 'EA', 80.00, 120.00, 'MANUAL'),
        ('PROD-0002', 'Operational Hardware Unit', 'Hardware', 'EA', 350.00, 520.00, 'MANUAL');
END;
GO
