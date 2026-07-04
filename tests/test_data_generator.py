from pathlib import Path
from python.data_generator.generate_customers import generate_customers


def test_generate_customers_creates_expected_file(tmp_path: Path):
    output = tmp_path / "customers.csv"
    generate_customers(str(output), rows=10)
    lines = output.read_text(encoding="utf-8").splitlines()
    assert len(lines) == 11
    assert lines[0].startswith("CustomerNumber")
