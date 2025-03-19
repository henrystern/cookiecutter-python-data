"""Scripts to run after creating the project. They run from the project directory."""

{% if not cookiecutter.include_mkdocs %}
# Remove docs/ if not using mkdocs
from pathlib import Path
import shutil
docs_dir = Path("./docs")
if docs_dir.exists():
    shutil.rmtree(docs_dir)
{% endif %}

{% if cookiecutter.open_source_license == "No license file" %}
# Remove LICENSE if no license selected
from pathlib import Path
Path("./LICENSE").unlink(True)
{% endif %}

{% if cookiecutter.git_init %}
# Initialize git repository and first commit
import subprocess
subprocess.call(["git", "init"])
subprocess.call(["git", "add", "*"])
subprocess.call(["git", "commit", "-m", "Setup project template"])
{% endif %}
