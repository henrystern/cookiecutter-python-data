ENV_NAME := {{ cookiecutter.package_name }}
ENV_YML := ./environment.yml
ENV_YML_FREEZE := ./environment_frozen.yml
MKDOCS_CONFIG := ./docs/mkdocs.yml
SRC := ./src/{{ cookiecutter.package_name }}

DATA_DIR := ./data/
RAW := $(DATA_DIR)/raw
INTERIM := $(DATA_DIR)/interim
PROCESSED := $(DATA_DIR)/processed

# The archive target copies output directories to a folder with today's date
OUTPUT_DIRS := logs models reports $(INTERIM) $(PROCESSED)
CURRENT_DATE := $(shell date +'%Y-%m-%d')
ARCHIVE_DIR := ./archive/$(CURRENT_DATE)

.PHONY: all \
	env env-update \
	docs \
	format lint \
	clean clean-output clean-pycache archive

all: env

env: environment_frozen.yml
	@echo "Creating conda environment from $(ENV_YML_FREEZE)..."
	@mamba env create -f $(ENV_YML_FREEZE) -n $(ENV_NAME)

environment_frozen.yml: $(ENV_YML)
	@echo "Updating conda environment from $(ENV_YML)"
	@mamba env update -f $(ENV_YML) --prune -n $(ENV_NAME)
	@mamba env export -n $(ENV_NAME) > $(ENV_YML_FREEZE)
	@# Remove the prefix from the frozen environment as it is an absolute path.
	@sed -i "/^prefix:/d" $(ENV_YML_FREEZE)

env-update: environment_frozen.yml

docs:
	@echo "Serving documentation..."
	@mkdocs serve -f $(MKDOCS_CONFIG) -o

format:
	@echo "Formatting code with ruff..."
	@ruff format $(SRC)

lint:
	@echo "Linting code with ruff..."
	@ruff check $(SRC)

clean-output:
	@for dir in $(OUTPUT_DIRS); do \
		echo "Cleaning directory: $$dir..."; \
		find $$dir -type f ! -name ".gitkeep" -exec rm -f {} +; \
	done

clean-pycache:
	@echo "Cleaning pycache files..."
	@find $$src -name "*.pyc" -exec rm -f {} +;
	@find . -type d -name "__pycache__" -delete

clean: clean-output clean-pycache

archive:
	@# If archive already exists then add a suffix to the current date for this archive.
	@# Then loop over OUTPUT_DIRS and add their content to the archive dir.
	@new_archive_dir=$(ARCHIVE_DIR); \
	suffix=2; \
	while [ -d "$$new_archive_dir" ]; do \
		new_archive_dir="$(ARCHIVE_DIR)_$$suffix"; \
		suffix=$$((suffix + 1)); \
	done; \
	mkdir -p $$new_archive_dir; \
	echo "Archiving output folders to $$new_archive_dir..."; \
	for dir in $(OUTPUT_DIRS) $(RAW); do \
		echo "Copying $$dir..."; \
		mkdir -p $$new_archive_dir/$$dir/; \
		cp -r $$dir/* $$new_archive_dir/$$dir/; \
	done