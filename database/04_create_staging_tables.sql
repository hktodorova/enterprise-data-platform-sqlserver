USE EnterpriseDataPlatform;
GO

IF OBJECT_ID(N'staging.CustomerRaw', N'U') IS NULL
BEGIN
    CREATE TABLE staging.CustomerRaw
    (
        CustomerRawId      bigint IDENTITY(1,1) NOT NULL,
        BatchId            uniqueidentifier NOT NULL,
        SourceSystemCode   nvarchar(30) NOT NULL,
        CompanyCode        nvarchar(20) NOT NULL,
        CustomerNumber     nvarchar(40) NOT NULL,
        CustomerName       nvarchar(200) NULL,
        CustomerStatus     nvarchar(30) NULL,
        CountryCode        char(2) NULL,
        SourceRecordId     nvarchar(80) NULL,
        LoadedAtUtc        datetime2(3) NOT NULL CONSTRAINT DF_CustomerRaw_LoadedAtUtc DEFAULT (SYSUTCDATETIME()),
        IsProcessed        bit NOT NULL CONSTRAINT DF_CustomerRaw_IsProcessed DEFAULT (0),
        ProcessingError    nvarchar(1000) NULL,

        CONSTRAINT PK_CustomerRaw PRIMARY KEY CLUSTERED (CustomerRawId)
    );
END;
GO

IF OBJECT_ID(N'staging.ProductRaw', N'U') IS NULL
BEGIN
    CREATE TABLE staging.ProductRaw
    (
        ProductRawId       bigint IDENTITY(1,1) NOT NULL,
        BatchId            uniqueidentifier NOT NULL,
        SourceSystemCode   nvarchar(30) NOT NULL,
        ProductNumber      nvarchar(50) NOT NULL,
        ProductName        nvarchar(200) NULL,
        ProductGroup       nvarchar(80) NULL,
        UnitOfMeasure      nvarchar(20) NULL,
        LoadedAtUtc        datetime2(3) NOT NULL CONSTRAINT DF_ProductRaw_LoadedAtUtc DEFAULT (SYSUTCDATETIME()),
        IsProcessed        bit NOT NULL CONSTRAINT DF_ProductRaw_IsProcessed DEFAULT (0),
        ProcessingError    nvarchar(1000) NULL,

        CONSTRAINT PK_ProductRaw PRIMARY KEY CLUSTERED (ProductRawId)
    );
END;
GO

IF OBJECT_ID(N'staging.SalesOrderRaw', N'U') IS NULL
BEGIN
    CREATE TABLE staging.SalesOrderRaw
    (
        SalesOrderRawId    bigint IDENTITY(1,1) NOT NULL,
        BatchId            uniqueidentifier NOT NULL,
        SourceSystemCode   nvarchar(30) NOT NULL,
        CompanyCode        nvarchar(20) NOT NULL,
        SalesOrderNumber   nvarchar(50) NOT NULL,
        LineNumber         int NOT NULL,
        CustomerNumber     nvarchar(40) NOT NULL,
        ProductNumber      nvarchar(50) NOT NULL,
        OrderDate          date NULL,
        OrderStatus        nvarchar(30) NULL,
        CurrencyCode       char(3) NULL,
        Quantity           decimal(18,4) NULL,
        UnitPrice          decimal(18,4) NULL,
        LoadedAtUtc        datetime2(3) NOT NULL CONSTRAINT DF_SalesOrderRaw_LoadedAtUtc DEFAULT (SYSUTCDATETIME()),
        IsProcessed        bit NOT NULL CONSTRAINT DF_SalesOrderRaw_IsProcessed DEFAULT (0),
        ProcessingError    nvarchar(1000) NULL,

        CONSTRAINT PK_SalesOrderRaw PRIMARY KEY CLUSTERED (SalesOrderRawId)
    );
END;
GO
