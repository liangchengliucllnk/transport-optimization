# The Python interpreter to use
PYTHON := python3
PIP := $(PYTHON) -m pip

.PHONY: install lint test run clean

install:
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

lint:
	flake8 src tests

test:
	pytest --maxfail=1 --disable-warnings -q

run:
	$(PYTHON) src/main.py

clean:
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type f -name "*.py[co]" -delete
