USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Supplier', 'U') IS NULL
BEGIN
    CREATE TABLE core.Supplier
    (
        SupplierID        BIGINT IDENTITY(1,1) NOT NULL,
        SupplierNumber    NVARCHAR(30) NOT NULL,
        SupplierName      NVARCHAR(200) NOT NULL,
        SupplierStatus    NVARCHAR(20) NOT NULL CONSTRAINT DF_Supplier_Status DEFAULT ('Active'),
        CountryCode       CHAR(2) NOT NULL,
        City              NVARCHAR(100) NULL,
        SourceSystem      NVARCHAR(50) NOT NULL,
        SourceRecordID    NVARCHAR(100) NULL,
        CreatedAt         DATETIME2(3) NOT NULL CONSTRAINT DF_Supplier_CreatedAt DEFAULT (SYSUTCDATETIME()),
        ModifiedAt        DATETIME2(3) NULL,
        IsDeleted         BIT NOT NULL CONSTRAINT DF_Supplier_IsDeleted DEFAULT (0),

        CONSTRAINT PK_Supplier PRIMARY KEY CLUSTERED (SupplierID),
        CONSTRAINT UQ_Supplier_SupplierNumber UNIQUE (SupplierNumber),
        CONSTRAINT CK_Supplier_Status CHECK (SupplierStatus IN ('Active', 'Inactive', 'Blocked'))
    );
END;
GO
