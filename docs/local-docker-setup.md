# Local Docker setup

Start SQL Server locally:

```powershell
docker compose up -d sqlserver
```

Generate sample data:

```powershell
docker compose run --rm etl
```
