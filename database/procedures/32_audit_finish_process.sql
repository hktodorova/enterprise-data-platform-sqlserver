CREATE OR ALTER PROCEDURE audit.usp_FinishProcess
    @ProcessRunId BIGINT,
    @ProcessStatus NVARCHAR(20),
    @RowsRead INT = NULL,
    @RowsInserted INT = NULL,
    @RowsUpdated INT = NULL,
    @ErrorMessage NVARCHAR(4000) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE audit.ProcessLog
       SET FinishedAt = SYSUTCDATETIME(),
           ProcessStatus = @ProcessStatus,
           RowsRead = @RowsRead,
           RowsInserted = @RowsInserted,
           RowsUpdated = @RowsUpdated,
           ErrorMessage = @ErrorMessage
     WHERE ProcessRunId = @ProcessRunId;
END;
GO
