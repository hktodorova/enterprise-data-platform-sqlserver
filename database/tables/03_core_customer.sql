USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Customer', 'U') IS NULL
BEGIN
    CREATE TABLE core.Customer
    (
        CustomerId        INT IDENTITY(1,1) NOT NULL,
        CustomerNumber    NVARCHAR(30)      NOT NULL,
        CustomerName      NVARCHAR(160)     NOT NULL,
        CustomerType      NVARCHAR(30)      NOT NULL,
        CountryCode       CHAR(2)           NOT NULL,
        City              NVARCHAR(80)      NULL,
        Email             NVARCHAR(254)     NULL,
        IsActive          BIT               NOT NULL CONSTRAINT DF_Customer_IsActive DEFAULT (1),
        SourceSystem      NVARCHAR(40)      NOT NULL,
        CreatedAtUtc      DATETIME2(3)      NOT NULL CONSTRAINT DF_Customer_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc     DATETIME2(3)      NULL,
        CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (CustomerId),
        CONSTRAINT UQ_Customer_CustomerNumber UNIQUE (CustomerNumber),
        CONSTRAINT CK_Customer_Type CHECK (CustomerType IN ('Private','Business','Partner','Internal')),
        CONSTRAINT CK_Customer_CountryCode CHECK (CountryCode LIKE '[A-Z][A-Z]')
    );
END;
GO
