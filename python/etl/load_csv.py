from pathlib import Path
import pandas as pd
from sqlalchemy import create_engine
from .config import Settings
from .logger import get_logger

logger = get_logger(__name__)


def load_csv_to_table(csv_path: str, schema: str, table: str) -> int:
    path = Path(csv_path)
    if not path.exists():
        raise FileNotFoundError(f"CSV file not found: {path}")

    df = pd.read_csv(path)
    settings = Settings()
    engine = create_engine(settings.connection_string, fast_executemany=True)

    logger.info("Loading %s rows into %s.%s", len(df), schema, table)
    df.to_sql(table, engine, schema=schema, if_exists="append", index=False)
    return len(df)
