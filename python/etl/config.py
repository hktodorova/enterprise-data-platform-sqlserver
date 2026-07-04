from dataclasses import dataclass
import os

@dataclass(frozen=True)
class Settings:
    server: str = os.getenv("SQLSERVER_HOST", "localhost")
    database: str = os.getenv("SQLSERVER_DATABASE", "EnterpriseDataPlatform")
    username: str = os.getenv("SQLSERVER_USER", "sa")
    password: str = os.getenv("SQLSERVER_PASSWORD", "YourStrongPassword123!")
    driver: str = os.getenv("SQLSERVER_DRIVER", "ODBC Driver 18 for SQL Server")
    trust_certificate: str = os.getenv("SQLSERVER_TRUST_CERT", "yes")

    @property
    def connection_string(self) -> str:
        return (
            f"mssql+pyodbc://{self.username}:{self.password}@{self.server}:1433/{self.database}"
            f"?driver={self.driver.replace(' ', '+')}&TrustServerCertificate={self.trust_certificate}"
        )
