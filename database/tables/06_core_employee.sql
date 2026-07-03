USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Employee', 'U') IS NULL
BEGIN
    CREATE TABLE core.Employee
    (
        EmployeeId        INT IDENTITY(1,1) NOT NULL,
        EmployeeNumber    NVARCHAR(30)      NOT NULL,
        FirstName         NVARCHAR(80)      NOT NULL,
        LastName          NVARCHAR(80)      NOT NULL,
        DepartmentId      INT               NULL,
        LocationId        INT               NULL,
        EmploymentStatus  NVARCHAR(30)      NOT NULL,
        HireDate          DATE              NULL,
        SourceSystem      NVARCHAR(40)      NOT NULL,
        CreatedAtUtc      DATETIME2(3)      NOT NULL CONSTRAINT DF_Employee_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc     DATETIME2(3)      NULL,
        CONSTRAINT PK_Employee PRIMARY KEY CLUSTERED (EmployeeId),
        CONSTRAINT UQ_Employee_EmployeeNumber UNIQUE (EmployeeNumber),
        CONSTRAINT CK_Employee_Status CHECK (EmploymentStatus IN ('Active','Inactive','Leave','External'))
    );
END;
GO
