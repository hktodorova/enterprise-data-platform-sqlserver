USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Customer', 'U') IS NULL
BEGIN
    CREATE TABLE core.Customer
    (
        CustomerID        BIGINT IDENTITY(1,1) NOT NULL,
        CustomerNumber    NVARCHAR(30) NOT NULL,
        CustomerName      NVARCHAR(200) NOT NULL,
        CustomerType      NVARCHAR(30) NOT NULL,
        CustomerStatus    NVARCHAR(20) NOT NULL CONSTRAINT DF_Customer_Status DEFAULT ('Active'),
        CountryCode       CHAR(2) NOT NULL,
        City              NVARCHAR(100) NULL,
        PostalCode        NVARCHAR(20) NULL,
        SourceSystem      NVARCHAR(50) NOT NULL,
        SourceRecordID    NVARCHAR(100) NULL,
        CreatedAt         DATETIME2(3) NOT NULL CONSTRAINT DF_Customer_CreatedAt DEFAULT (SYSUTCDATETIME()),
        ModifiedAt        DATETIME2(3) NULL,
        IsDeleted         BIT NOT NULL CONSTRAINT DF_Customer_IsDeleted DEFAULT (0),
        RowHash           VARBINARY(32) NULL,

        CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (CustomerID),
        CONSTRAINT UQ_Customer_CustomerNumber UNIQUE (CustomerNumber),
        CONSTRAINT CK_Customer_Status CHECK (CustomerStatus IN ('Active', 'Inactive', 'Blocked')),
        CONSTRAINT CK_Customer_Type CHECK (CustomerType IN ('Business', 'Private', 'Internal'))
    );
END;
GO
