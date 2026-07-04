SELECT
    DB_NAME(database_id) AS database_name,
    state_desc,
    recovery_model_desc,
    compatibility_level
FROM sys.databases
ORDER BY database_name;
