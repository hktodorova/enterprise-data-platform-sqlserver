USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Product', 'U') IS NULL
BEGIN
    CREATE TABLE core.Product
    (
        ProductID         BIGINT IDENTITY(1,1) NOT NULL,
        ProductNumber     NVARCHAR(40) NOT NULL,
        ProductName       NVARCHAR(200) NOT NULL,
        ProductCategory   NVARCHAR(80) NOT NULL,
        ProductStatus     NVARCHAR(20) NOT NULL CONSTRAINT DF_Product_Status DEFAULT ('Active'),
        UnitOfMeasure     NVARCHAR(20) NOT NULL,
        StandardCost      DECIMAL(18,4) NULL,
        ListPrice         DECIMAL(18,4) NULL,
        SourceSystem      NVARCHAR(50) NOT NULL,
        SourceRecordID    NVARCHAR(100) NULL,
        CreatedAt         DATETIME2(3) NOT NULL CONSTRAINT DF_Product_CreatedAt DEFAULT (SYSUTCDATETIME()),
        ModifiedAt        DATETIME2(3) NULL,
        IsDeleted         BIT NOT NULL CONSTRAINT DF_Product_IsDeleted DEFAULT (0),

        CONSTRAINT PK_Product PRIMARY KEY CLUSTERED (ProductID),
        CONSTRAINT UQ_Product_ProductNumber UNIQUE (ProductNumber),
        CONSTRAINT CK_Product_Status CHECK (ProductStatus IN ('Active', 'Inactive', 'Discontinued')),
        CONSTRAINT CK_Product_Cost CHECK (StandardCost IS NULL OR StandardCost >= 0),
        CONSTRAINT CK_Product_Price CHECK (ListPrice IS NULL OR ListPrice >= 0)
    );
END;
GO
