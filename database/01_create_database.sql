/*
    Enterprise Data Platform - SQL Server
    Database bootstrap script

    This script is intentionally small. It creates the database used by the
    local development environment. Objects are created in the next scripts.
*/

IF DB_ID(N'EnterpriseDataPlatform') IS NULL
BEGIN
    CREATE DATABASE EnterpriseDataPlatform;
END;
GO

ALTER DATABASE EnterpriseDataPlatform SET RECOVERY FULL;
GO

ALTER DATABASE EnterpriseDataPlatform SET READ_COMMITTED_SNAPSHOT ON;
GO
