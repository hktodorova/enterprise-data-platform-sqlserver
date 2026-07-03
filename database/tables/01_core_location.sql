USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Location', 'U') IS NULL
BEGIN
    CREATE TABLE core.Location
    (
        LocationId        INT IDENTITY(1,1) NOT NULL,
        LocationCode      NVARCHAR(30)      NOT NULL,
        LocationName      NVARCHAR(120)     NOT NULL,
        CountryCode       CHAR(2)           NOT NULL,
        City              NVARCHAR(80)      NULL,
        IsActive          BIT               NOT NULL CONSTRAINT DF_Location_IsActive DEFAULT (1),
        SourceSystem      NVARCHAR(40)      NOT NULL,
        CreatedAtUtc      DATETIME2(3)      NOT NULL CONSTRAINT DF_Location_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc     DATETIME2(3)      NULL,
        CONSTRAINT PK_Location PRIMARY KEY CLUSTERED (LocationId),
        CONSTRAINT UQ_Location_LocationCode UNIQUE (LocationCode),
        CONSTRAINT CK_Location_CountryCode CHECK (CountryCode LIKE '[A-Z][A-Z]')
    );
END;
GO
