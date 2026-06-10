install:
	pip install -r requirements.txt

run-quality:
	python src/python/quality_checks.py

validate-formats:
	python tools/validate_formats.py

public-safety:
	python tools/public_safety_check.py

test:
	pytest

all: install run-quality validate-formats public-safety test

compose-up:
	docker compose up --build

compose-down:
	docker compose down
