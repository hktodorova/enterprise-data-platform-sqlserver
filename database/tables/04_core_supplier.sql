USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Supplier', 'U') IS NULL
BEGIN
    CREATE TABLE core.Supplier
    (
        SupplierId        INT IDENTITY(1,1) NOT NULL,
        SupplierNumber    NVARCHAR(30)      NOT NULL,
        SupplierName      NVARCHAR(160)     NOT NULL,
        CountryCode       CHAR(2)           NOT NULL,
        City              NVARCHAR(80)      NULL,
        IsActive          BIT               NOT NULL CONSTRAINT DF_Supplier_IsActive DEFAULT (1),
        SourceSystem      NVARCHAR(40)      NOT NULL,
        CreatedAtUtc      DATETIME2(3)      NOT NULL CONSTRAINT DF_Supplier_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc     DATETIME2(3)      NULL,
        CONSTRAINT PK_Supplier PRIMARY KEY CLUSTERED (SupplierId),
        CONSTRAINT UQ_Supplier_SupplierNumber UNIQUE (SupplierNumber),
        CONSTRAINT CK_Supplier_CountryCode CHECK (CountryCode LIKE '[A-Z][A-Z]')
    );
END;
GO
