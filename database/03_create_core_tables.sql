USE EnterpriseDataPlatform;
GO

IF OBJECT_ID(N'core.SourceSystem', N'U') IS NULL
BEGIN
    CREATE TABLE core.SourceSystem
    (
        SourceSystemId     int IDENTITY(1,1) NOT NULL,
        SourceSystemCode   nvarchar(30) NOT NULL,
        SourceSystemName   nvarchar(100) NOT NULL,
        IsActive           bit NOT NULL CONSTRAINT DF_SourceSystem_IsActive DEFAULT (1),
        CreatedAtUtc       datetime2(3) NOT NULL CONSTRAINT DF_SourceSystem_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc      datetime2(3) NULL,

        CONSTRAINT PK_SourceSystem PRIMARY KEY CLUSTERED (SourceSystemId),
        CONSTRAINT UQ_SourceSystem_Code UNIQUE (SourceSystemCode)
    );
END;
GO

IF OBJECT_ID(N'core.Company', N'U') IS NULL
BEGIN
    CREATE TABLE core.Company
    (
        CompanyId          int IDENTITY(1,1) NOT NULL,
        CompanyCode        nvarchar(20) NOT NULL,
        CompanyName        nvarchar(160) NOT NULL,
        CountryCode        char(2) NOT NULL,
        IsActive           bit NOT NULL CONSTRAINT DF_Company_IsActive DEFAULT (1),
        SourceSystemId     int NOT NULL,
        CreatedAtUtc       datetime2(3) NOT NULL CONSTRAINT DF_Company_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc      datetime2(3) NULL,

        CONSTRAINT PK_Company PRIMARY KEY CLUSTERED (CompanyId),
        CONSTRAINT UQ_Company_Code UNIQUE (CompanyCode),
        CONSTRAINT FK_Company_SourceSystem FOREIGN KEY (SourceSystemId)
            REFERENCES core.SourceSystem (SourceSystemId)
    );
END;
GO

IF OBJECT_ID(N'core.Customer', N'U') IS NULL
BEGIN
    CREATE TABLE core.Customer
    (
        CustomerId         bigint IDENTITY(1,1) NOT NULL,
        CustomerNumber     nvarchar(40) NOT NULL,
        CompanyId          int NOT NULL,
        CustomerName       nvarchar(200) NOT NULL,
        CustomerStatus     nvarchar(30) NOT NULL,
        CountryCode        char(2) NULL,
        SourceSystemId     int NOT NULL,
        SourceRecordId     nvarchar(80) NULL,
        CreatedAtUtc       datetime2(3) NOT NULL CONSTRAINT DF_Customer_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc      datetime2(3) NULL,

        CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (CustomerId),
        CONSTRAINT UQ_Customer_Number_Company UNIQUE (CustomerNumber, CompanyId),
        CONSTRAINT CK_Customer_Status CHECK (CustomerStatus IN (N'Active', N'Inactive', N'Blocked')),
        CONSTRAINT FK_Customer_Company FOREIGN KEY (CompanyId)
            REFERENCES core.Company (CompanyId),
        CONSTRAINT FK_Customer_SourceSystem FOREIGN KEY (SourceSystemId)
            REFERENCES core.SourceSystem (SourceSystemId)
    );
END;
GO

IF OBJECT_ID(N'core.Product', N'U') IS NULL
BEGIN
    CREATE TABLE core.Product
    (
        ProductId          bigint IDENTITY(1,1) NOT NULL,
        ProductNumber      nvarchar(50) NOT NULL,
        ProductName        nvarchar(200) NOT NULL,
        ProductGroup       nvarchar(80) NULL,
        UnitOfMeasure      nvarchar(20) NOT NULL,
        IsActive           bit NOT NULL CONSTRAINT DF_Product_IsActive DEFAULT (1),
        SourceSystemId     int NOT NULL,
        CreatedAtUtc       datetime2(3) NOT NULL CONSTRAINT DF_Product_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc      datetime2(3) NULL,

        CONSTRAINT PK_Product PRIMARY KEY CLUSTERED (ProductId),
        CONSTRAINT UQ_Product_Number UNIQUE (ProductNumber),
        CONSTRAINT FK_Product_SourceSystem FOREIGN KEY (SourceSystemId)
            REFERENCES core.SourceSystem (SourceSystemId)
    );
END;
GO

IF OBJECT_ID(N'core.SalesOrderHeader', N'U') IS NULL
BEGIN
    CREATE TABLE core.SalesOrderHeader
    (
        SalesOrderId       bigint IDENTITY(1,1) NOT NULL,
        SalesOrderNumber   nvarchar(50) NOT NULL,
        CompanyId          int NOT NULL,
        CustomerId         bigint NOT NULL,
        OrderDate          date NOT NULL,
        OrderStatus        nvarchar(30) NOT NULL,
        CurrencyCode       char(3) NOT NULL,
        SourceSystemId     int NOT NULL,
        CreatedAtUtc       datetime2(3) NOT NULL CONSTRAINT DF_SalesOrderHeader_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc      datetime2(3) NULL,

        CONSTRAINT PK_SalesOrderHeader PRIMARY KEY CLUSTERED (SalesOrderId),
        CONSTRAINT UQ_SalesOrderHeader_Number UNIQUE (SalesOrderNumber, CompanyId),
        CONSTRAINT CK_SalesOrderHeader_Status CHECK (OrderStatus IN (N'Open', N'Released', N'Shipped', N'Invoiced', N'Cancelled')),
        CONSTRAINT FK_SalesOrderHeader_Company FOREIGN KEY (CompanyId)
            REFERENCES core.Company (CompanyId),
        CONSTRAINT FK_SalesOrderHeader_Customer FOREIGN KEY (CustomerId)
            REFERENCES core.Customer (CustomerId),
        CONSTRAINT FK_SalesOrderHeader_SourceSystem FOREIGN KEY (SourceSystemId)
            REFERENCES core.SourceSystem (SourceSystemId)
    );
END;
GO

IF OBJECT_ID(N'core.SalesOrderLine', N'U') IS NULL
BEGIN
    CREATE TABLE core.SalesOrderLine
    (
        SalesOrderLineId   bigint IDENTITY(1,1) NOT NULL,
        SalesOrderId       bigint NOT NULL,
        LineNumber         int NOT NULL,
        ProductId          bigint NOT NULL,
        Quantity           decimal(18,4) NOT NULL,
        UnitPrice          decimal(18,4) NOT NULL,
        LineAmount         AS (CONVERT(decimal(18,4), Quantity * UnitPrice)) PERSISTED,
        CreatedAtUtc       datetime2(3) NOT NULL CONSTRAINT DF_SalesOrderLine_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),

        CONSTRAINT PK_SalesOrderLine PRIMARY KEY CLUSTERED (SalesOrderLineId),
        CONSTRAINT UQ_SalesOrderLine_Order_Line UNIQUE (SalesOrderId, LineNumber),
        CONSTRAINT CK_SalesOrderLine_Quantity CHECK (Quantity >= 0),
        CONSTRAINT CK_SalesOrderLine_UnitPrice CHECK (UnitPrice >= 0),
        CONSTRAINT FK_SalesOrderLine_Header FOREIGN KEY (SalesOrderId)
            REFERENCES core.SalesOrderHeader (SalesOrderId),
        CONSTRAINT FK_SalesOrderLine_Product FOREIGN KEY (ProductId)
            REFERENCES core.Product (ProductId)
    );
END;
GO
