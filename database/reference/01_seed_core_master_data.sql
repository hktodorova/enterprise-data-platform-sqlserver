USE EnterpriseDataPlatform;
GO

IF NOT EXISTS (SELECT 1 FROM core.Location WHERE LocationCode = 'ZH-001')
BEGIN
    INSERT INTO core.Location (LocationCode, LocationName, CountryCode, City, SourceSystem)
    VALUES
        ('ZH-001', 'Zurich Operations', 'CH', 'Zurich', 'manual-seed'),
        ('BS-001', 'Basel Office', 'CH', 'Basel', 'manual-seed'),
        ('DE-001', 'Germany Hub', 'DE', 'Munich', 'manual-seed');
END;
GO

IF NOT EXISTS (SELECT 1 FROM core.Department WHERE DepartmentCode = 'IT-DATA')
BEGIN
    INSERT INTO core.Department (DepartmentCode, DepartmentName, CostCenter, SourceSystem)
    VALUES
        ('IT-DATA', 'Data Platform', 'CC-4100', 'manual-seed'),
        ('FIN-OPS', 'Finance Operations', 'CC-2200', 'manual-seed'),
        ('SUPPLY', 'Supply Chain', 'CC-3300', 'manual-seed');
END;
GO

IF NOT EXISTS (SELECT 1 FROM core.Customer WHERE CustomerNumber = 'CUST-10001')
BEGIN
    INSERT INTO core.Customer (CustomerNumber, CustomerName, CustomerType, CountryCode, City, Email, SourceSystem)
    VALUES
        ('CUST-10001', 'Alpine Retail AG', 'Business', 'CH', 'Zurich', 'finance@alpine-retail.example', 'manual-seed'),
        ('CUST-10002', 'Nordstern Services GmbH', 'Business', 'DE', 'Hamburg', 'billing@nordstern.example', 'manual-seed');
END;
GO

IF NOT EXISTS (SELECT 1 FROM core.Product WHERE ProductNumber = 'PRD-10001')
BEGIN
    INSERT INTO core.Product (ProductNumber, ProductName, ProductCategory, UnitOfMeasure, StandardCost, ListPrice, SourceSystem)
    VALUES
        ('PRD-10001', 'Managed Data Service', 'Service', 'HOUR', 80.00, 145.00, 'manual-seed'),
        ('PRD-10002', 'Integration Support Package', 'Service', 'DAY', 650.00, 980.00, 'manual-seed');
END;
GO
