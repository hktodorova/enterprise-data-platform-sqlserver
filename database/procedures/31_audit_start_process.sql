CREATE OR ALTER PROCEDURE audit.usp_StartProcess
    @ProcessName NVARCHAR(120),
    @SourceSystem NVARCHAR(40) = NULL,
    @ProcessRunId BIGINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO audit.ProcessLog(ProcessName, SourceSystem, StartedAt, ProcessStatus)
    VALUES (@ProcessName, @SourceSystem, SYSUTCDATETIME(), 'Running');

    SET @ProcessRunId = SCOPE_IDENTITY();
END;
GO
