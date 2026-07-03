USE EnterpriseDataPlatform;
GO

IF NOT EXISTS (SELECT 1 FROM core.SourceSystem WHERE SourceSystemCode = N'ERP')
BEGIN
    INSERT INTO core.SourceSystem (SourceSystemCode, SourceSystemName)
    VALUES
        (N'ERP', N'Enterprise Resource Planning'),
        (N'CRM', N'Customer Relationship Management'),
        (N'WMS', N'Warehouse Management System');
END;
GO

DECLARE @SourceSystemId int = (SELECT SourceSystemId FROM core.SourceSystem WHERE SourceSystemCode = N'ERP');

IF NOT EXISTS (SELECT 1 FROM core.Company WHERE CompanyCode = N'CH01')
BEGIN
    INSERT INTO core.Company (CompanyCode, CompanyName, CountryCode, SourceSystemId)
    VALUES
        (N'CH01', N'Swiss Operating Company', 'CH', @SourceSystemId),
        (N'DE01', N'German Operating Company', 'DE', @SourceSystemId);
END;
GO
