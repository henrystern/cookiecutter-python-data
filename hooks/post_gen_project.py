"""Initialize git repository after creating template."""
import subprocess

{% if not cookiecutter.include_mkdocs %}
from pathlib import Path
import shutil

docs_dir = Path("./docs")
if docs_dir.exists():
    shutil.rmtree(docs_dir)
{% endif %}

{% if cookiecutter.git_init %}
subprocess.call(["git", "init"])
subprocess.call(["git", "add", "*"])
subprocess.call(["git", "commit", "-m", "Setup project template"])
{% endif %}