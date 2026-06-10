"""Parquet literacy demo.

This script is intentionally dependency-light. In a real project, use pandas or pyarrow:

    import pandas as pd
    df = pd.read_csv("data/raw/transactions.csv")
    df.to_parquet("artifacts/transactions.parquet")

Parquet files are generated artifacts and are ignored by Git in this repository.
"""

print("See data/processed_examples/parquet_notes.md")
