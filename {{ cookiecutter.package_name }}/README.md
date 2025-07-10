# {{ cookiecutter.project_name }}

{{ cookiecutter.description }}

## Project structure

```
{% if cookiecutter.open_source_license != "No license file" %}│   LICENSE                               # {{ cookiecutter.open_source_license }} license{% endif %}
│   pyproject.toml                        # Package metadata and configuration
│   README.md                             # Brief documentation
├───data
│   ├───interim                           # Intermediate data that has been transformed
│   ├───processed                         # The final, canonical datasets
│   └───raw                               # The original, immutable data dump
├───docs                                  # MkDocs documentation
├───models                                # Output models and model results
├───reports
│   ├───figures                           # Output figures
│   └───tables                            # Output tables
└───src
    └───{{ cookiecutter.package_name }}   # Python package for this project
            __init__.py                   # Makes package installable
            config.py                     # Configuration parameters
            dataset.py                    # Clean and output data
            plots.py                      # Generate plots
```


## Python environment

The python environment is managed by [uv](https://docs.astral.sh/uv/getting-started/installation/).

Once uv is installed, create the environment by running:

```bash
uv sync
```

Then activate the environment with:

```bash
source .venv/bin/activate
```

If you are using vscode, set your python interpretor to `.venv/bin/python`.

{% if cookiecutter.include_mkdocs %}
## Code documentation

The code is documented with mkdocs.

To view the documentation run

```bash
mkdocs serve -f ./docs/mkdocs.yml -o
```

If mkdocs is unavailable you can install it globally with:

```bash
uv tool install mkdocs --with mkdocs-material --with mkdocstrings[python]
```

{% endif %}