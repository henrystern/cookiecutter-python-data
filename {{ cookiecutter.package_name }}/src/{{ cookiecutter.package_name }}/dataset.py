"""Clean and output data."""

from {{ cookiecutter.package_name }}.config import PROCESSED_DATA_DIR, RAW_DATA_DIR, LOGS_DIR
from loguru import logger

if __name__ == "__main__":
    logger.add(LOGS_DIR / "dataset.py") # Log to file to monitor dataset updates.