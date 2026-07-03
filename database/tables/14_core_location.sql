USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Location', 'U') IS NULL
BEGIN
    CREATE TABLE core.Location
    (
        LocationID        BIGINT IDENTITY(1,1) NOT NULL,
        LocationCode      NVARCHAR(30) NOT NULL,
        LocationName      NVARCHAR(150) NOT NULL,
        LocationType      NVARCHAR(30) NOT NULL,
        CountryCode       CHAR(2) NOT NULL,
        City              NVARCHAR(100) NULL,
        SourceSystem      NVARCHAR(50) NOT NULL,
        CreatedAt         DATETIME2(3) NOT NULL CONSTRAINT DF_Location_CreatedAt DEFAULT (SYSUTCDATETIME()),
        ModifiedAt        DATETIME2(3) NULL,
        IsActive          BIT NOT NULL CONSTRAINT DF_Location_IsActive DEFAULT (1),

        CONSTRAINT PK_Location PRIMARY KEY CLUSTERED (LocationID),
        CONSTRAINT UQ_Location_LocationCode UNIQUE (LocationCode),
        CONSTRAINT CK_Location_Type CHECK (LocationType IN ('Warehouse', 'Office', 'Store', 'Plant'))
    );
END;
GO
