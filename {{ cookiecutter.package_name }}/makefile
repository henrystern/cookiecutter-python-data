ENV_NAME = {{ cookiecutter.package_name }}
ENV_YML = ./environment.yml
MKDOCS_CONFIG = ./docs/mkdocs.yml
PYTHON_SRC = ./src/{{ cookiecutter.package_name }}

.PHONY: docs # Since docs is a directory
docs:
	@echo "Serving documentation..."
	@mkdocs serve -f $(MKDOCS_CONFIG) -o

docs-build:
	@echo "Building documentation..."
	@mkdocs build -f $(MKDOCS_CONFIG)

env:
	@echo "Updating conda environment from $(ENV_YML)..."
	@conda env update -f $(ENV_YML) --prune -n $(ENV_NAME)

format:
	@echo "Formatting code with ruff..."
	@ruff format $(PYTHON_SRC)

lint:
	@echo "Linting code with ruff..."
	@ruff check $(PYTHON_SRC)