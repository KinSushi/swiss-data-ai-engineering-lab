# Processed and binary data format examples

This folder documents generated analytics formats without committing heavy binary files.

| Format | File extension | Why it matters |
|---|---|---|
| Parquet | `.parquet` | Columnar analytics, Spark, Databricks, data lakes |
| ORC | `.orc` | Hadoop/Hive-oriented columnar storage |
| Arrow | `.arrow` | In-memory columnar exchange between engines |
| Feather | `.feather` | Fast local exchange for pandas/R/Arrow |
| Delta Lake | `_delta_log/` + Parquet | Lakehouse tables, ACID, time travel |
| Iceberg | metadata + data files | Open table format for large analytical datasets |
| HDF5 | `.h5`, `.hdf5` | Scientific and tensor-like hierarchical storage |

These formats should be generated locally during experiments and kept out of Git unless a tiny sample is explicitly required.
