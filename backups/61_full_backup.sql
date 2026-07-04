BACKUP DATABASE EnterpriseDataPlatform
TO DISK = '/var/opt/mssql/backup/EnterpriseDataPlatform_full.bak'
WITH INIT, COMPRESSION, CHECKSUM, STATS = 10;
