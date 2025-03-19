# {{ cookiecutter.project_name }}

{{ cookiecutter.description }}

## Project structure

```
│   environment.yml                       # Conda environment used for project{% if cookiecutter.open_source_license != "No license file" %}
│   LICENSE                               # {{ cookiecutter.open_source_license }} license{% endif %}
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

To replicate the environment you will need a [miniforge conda distribution](https://github.com/conda-forge/miniforge).

Once conda is installed and initialized, create the environment by running

```powershell
conda env create -f environment.yml
```

Then activate the environment with

```powershell
conda activate {{ cookiecutter.package_name }}
```

{% if cookiecutter.include_mkdocs %}
## Code documentation

The code is documented with mkdocs.

To view the documentation run

```powershell
mkdocs serve -f ./docs/mkdocs.yml -o
```
{% endif %}