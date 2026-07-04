CREATE OR ALTER PROCEDURE staging.usp_LoadCustomersToCore
AS
BEGIN
    SET NOCOUNT ON;

    MERGE core.Customer AS target
    USING (
        SELECT DISTINCT CustomerNumber, CustomerName, CustomerStatus, CustomerSegment, SourceSystem, SourceKey
        FROM staging.Customer
        WHERE CustomerNumber IS NOT NULL
    ) AS src
    ON target.SourceSystem = src.SourceSystem AND target.SourceKey = src.SourceKey
    WHEN MATCHED THEN UPDATE SET
        CustomerNumber = src.CustomerNumber,
        CustomerName = src.CustomerName,
        CustomerStatus = COALESCE(src.CustomerStatus, 'Active'),
        CustomerSegment = src.CustomerSegment,
        ModifiedAt = SYSUTCDATETIME()
    WHEN NOT MATCHED THEN INSERT
        (CustomerNumber, CustomerName, CustomerStatus, CustomerSegment, SourceSystem, SourceKey)
        VALUES
        (src.CustomerNumber, src.CustomerName, COALESCE(src.CustomerStatus, 'Active'), src.CustomerSegment, src.SourceSystem, src.SourceKey);
END;
GO
