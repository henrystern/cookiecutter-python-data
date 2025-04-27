# Python Data Science Template

A cookiecutter template for python data science packages. Loosely based on [cookie-cutter-data-science](https://github.com/drivendataorg/cookiecutter-data-science/) with some of my own preferences.

## Dependencies

Requires python and cookiecutter.

```powershell
pip install cookiecutter
```

or

```powershell
conda create -n cookiecutter python=3.13 cookiecutter
```

## Usage

```powershell
cookiecutter https://github.com/henrystern/cookiecutter-python-data
```

If that seems like too much typing you can set a command alias.
In powershell you can add these lines to `$profile` and then create a new project with `cc`.
```powershell
function Create-Cookiecutter-Project {
    conda run -n cookiecutter --no-capture-output cookiecutter https://github.com/henrystern/cookiecutter-python-data
}

Set-Alias cc Create-Cookiecutter-Project
```

A more complicated example (for managing multiple templates) is shown in [profile.ps1](examples/profile.ps1)

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
