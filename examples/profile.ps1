# An example powershell function for quickly calling cookiecutter with `cc`.

function Get-Multiple-Choice {
    param (
        [array]$options,
        [string]$prompt = "Choose an option:"
    )

    # Display the prompt and options
    Write-Host $prompt
    $counter = 1
    foreach ($option in $options) {
        Write-Host "$counter. $($option.name)"
        $counter++
    }

    # Loop until a valid option is chosen
    $selection = 0
    while ($selection -lt 1 -or $selection -gt $options.Length) {
        $selection = Read-Host "Enter the number of your choice"

        if ([string]::IsNullOrWhiteSpace($selection)) {
            $selection = 1
        }

        if ($selection -lt 1 -or $selection -gt $options.Length) {
            Write-Host "Invalid choice, please try again."
        }
    }

    Return $options[$selection - 1]
}

function New-CookiecutterProject {
    $availableTemplates = @(
        @{ 
            name   = "python-data"; 
            args = @("https://github.com/henrystern/cookiecutter-python-data")
        }, 
        @{ 
            name   = "python-data-BoC"; 
            args = @("https://github.com/henrystern/cookiecutter-python-data"; "-c"; "BoC")
        }
    )
    $chosenTemplate = Get-Multiple-Choice -options $availableTemplates -prompt "Which template? (default 1)"
    conda run -n cookiecutter --no-capture-output cookiecutter @($chosenTemplate.args)
}

Set-Alias cc New-CookiecutterProject