SELECT
    r.session_id,
    r.blocking_session_id,
    r.status,
    r.wait_type,
    r.wait_time,
    r.command,
    DB_NAME(r.database_id) AS database_name
FROM sys.dm_exec_requests r
WHERE r.blocking_session_id <> 0;
