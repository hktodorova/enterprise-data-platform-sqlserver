USE EnterpriseDataPlatform;
GO

IF OBJECT_ID(N'audit.LoadBatch', N'U') IS NULL
BEGIN
    CREATE TABLE audit.LoadBatch
    (
        BatchId            uniqueidentifier NOT NULL,
        SourceSystemCode   nvarchar(30) NOT NULL,
        EntityName         nvarchar(80) NOT NULL,
        FileName           nvarchar(260) NULL,
        StartedAtUtc       datetime2(3) NOT NULL CONSTRAINT DF_LoadBatch_StartedAtUtc DEFAULT (SYSUTCDATETIME()),
        CompletedAtUtc     datetime2(3) NULL,
        BatchStatus        nvarchar(30) NOT NULL CONSTRAINT DF_LoadBatch_Status DEFAULT (N'Running'),
        RowsReceived       int NULL,
        RowsInserted       int NULL,
        RowsUpdated        int NULL,
        RowsRejected       int NULL,

        CONSTRAINT PK_LoadBatch PRIMARY KEY CLUSTERED (BatchId),
        CONSTRAINT CK_LoadBatch_Status CHECK (BatchStatus IN (N'Running', N'Succeeded', N'Failed', N'PartiallySucceeded'))
    );
END;
GO

IF OBJECT_ID(N'logging.ApplicationLog', N'U') IS NULL
BEGIN
    CREATE TABLE logging.ApplicationLog
    (
        ApplicationLogId   bigint IDENTITY(1,1) NOT NULL,
        LogLevel           nvarchar(20) NOT NULL,
        ComponentName      nvarchar(100) NOT NULL,
        MessageText        nvarchar(2000) NOT NULL,
        BatchId            uniqueidentifier NULL,
        ErrorDetails       nvarchar(max) NULL,
        CreatedAtUtc       datetime2(3) NOT NULL CONSTRAINT DF_ApplicationLog_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),

        CONSTRAINT PK_ApplicationLog PRIMARY KEY CLUSTERED (ApplicationLogId),
        CONSTRAINT CK_ApplicationLog_Level CHECK (LogLevel IN (N'DEBUG', N'INFO', N'WARNING', N'ERROR', N'CRITICAL'))
    );
END;
GO
