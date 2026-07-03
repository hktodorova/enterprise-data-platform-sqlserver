USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Product', 'U') IS NULL
BEGIN
    CREATE TABLE core.Product
    (
        ProductId         INT IDENTITY(1,1) NOT NULL,
        ProductNumber     NVARCHAR(40)      NOT NULL,
        ProductName       NVARCHAR(160)     NOT NULL,
        ProductCategory   NVARCHAR(80)      NOT NULL,
        UnitOfMeasure     NVARCHAR(20)      NOT NULL,
        StandardCost      DECIMAL(18,4)     NOT NULL CONSTRAINT DF_Product_StandardCost DEFAULT (0),
        ListPrice         DECIMAL(18,4)     NOT NULL CONSTRAINT DF_Product_ListPrice DEFAULT (0),
        IsActive          BIT               NOT NULL CONSTRAINT DF_Product_IsActive DEFAULT (1),
        SourceSystem      NVARCHAR(40)      NOT NULL,
        CreatedAtUtc      DATETIME2(3)      NOT NULL CONSTRAINT DF_Product_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc     DATETIME2(3)      NULL,
        CONSTRAINT PK_Product PRIMARY KEY CLUSTERED (ProductId),
        CONSTRAINT UQ_Product_ProductNumber UNIQUE (ProductNumber),
        CONSTRAINT CK_Product_StandardCost CHECK (StandardCost >= 0),
        CONSTRAINT CK_Product_ListPrice CHECK (ListPrice >= 0)
    );
END;
GO
