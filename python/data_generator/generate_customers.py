from pathlib import Path
import csv
from faker import Faker

fake = Faker()


def generate_customers(output_file: str = "data/raw/customers.csv", rows: int = 1000) -> None:
    path = Path(output_file)
    path.parent.mkdir(parents=True, exist_ok=True)

    with path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["CustomerNumber", "CustomerName", "CustomerStatus", "CustomerSegment", "SourceSystem", "SourceKey"])
        for i in range(1, rows + 1):
            writer.writerow([
                f"CUST-{i:06d}",
                fake.company(),
                "Active",
                fake.random_element(["SMB", "Enterprise", "Public", "Retail"]),
                "generator",
                f"customer-{i}",
            ])


if __name__ == "__main__":
    generate_customers(rows=100000)
