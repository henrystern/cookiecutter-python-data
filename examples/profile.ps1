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
    # Each template is defined as a list of commands to expand into the call to cookiecutter.
    $availableTemplates = @(
        @{ 
            name   = "python-data"; 
            template = "https://github.com/henrystern/cookiecutter-python-data"; 
            kwargs = @{} 
        }, 
        @{ 
            name   = "python-data-BoC"; 
            template = "https://github.com/henrystern/cookiecutter-python-data"; 
            kwargs = @{ checkout = "BoC" } 
        }
    )
    $chosenTemplate = Get-Multiple-Choice -options $availableTemplates -prompt "Which template? (default 1)"
    $template = $chosenTemplate.template
    $kwargs = $($chosenTemplate.kwargs)
    conda activate cookiecutter # Works better for passing args than conda run
    cookiecutter $template @kwargs
    conda deactivate cookiecutter
}

Set-Alias cc New-CookiecutterProject