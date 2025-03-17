# Python Data Science Template

A cookiecutter template for python data science packages. Loosely based on [cookie-cutter-data-science](https://github.com/drivendataorg/cookiecutter-data-science/) with some of my own preferences.

## Dependencies

Requires python and cookiecutter.

```powershell
pip install cookiecutter
```

or

```powershell
conda install cookiecutter
```

## Usage

```powershell
cookiecutter https://github.com/henrystern/cookiecutter-python-data
```

## Intended project structure

```
│   environment.yml                       # Conda environment used for project
│   LICENSE                               # Open-source license
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
    └───{{ cookiecutter.package_name }}   # Python package
            __init__.py                   # Makes package installable
            config.py                     # Configuration parameters
            dataset.py                    # Clean and output data
            plots.py                      # Generate plots
```
