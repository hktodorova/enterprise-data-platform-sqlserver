USE EnterpriseDataPlatform;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'staging')
    EXEC(N'CREATE SCHEMA staging');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'core')
    EXEC(N'CREATE SCHEMA core');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'reporting')
    EXEC(N'CREATE SCHEMA reporting');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'audit')
    EXEC(N'CREATE SCHEMA audit');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'logging')
    EXEC(N'CREATE SCHEMA logging');
GO
