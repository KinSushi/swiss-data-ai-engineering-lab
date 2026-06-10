from pathlib import Path

mlmodel_path = Path(__file__).resolve().parents[2] / "mlops" / "MLmodel"
print(mlmodel_path.read_text(encoding="utf-8").splitlines()[0])
