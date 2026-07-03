USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Department', 'U') IS NULL
BEGIN
    CREATE TABLE core.Department
    (
        DepartmentId      INT IDENTITY(1,1) NOT NULL,
        DepartmentCode    NVARCHAR(30)      NOT NULL,
        DepartmentName    NVARCHAR(120)     NOT NULL,
        CostCenter        NVARCHAR(30)      NULL,
        IsActive          BIT               NOT NULL CONSTRAINT DF_Department_IsActive DEFAULT (1),
        SourceSystem      NVARCHAR(40)      NOT NULL,
        CreatedAtUtc      DATETIME2(3)      NOT NULL CONSTRAINT DF_Department_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc     DATETIME2(3)      NULL,
        CONSTRAINT PK_Department PRIMARY KEY CLUSTERED (DepartmentId),
        CONSTRAINT UQ_Department_DepartmentCode UNIQUE (DepartmentCode)
    );
END;
GO
