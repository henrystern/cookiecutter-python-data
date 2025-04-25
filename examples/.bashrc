# An example bash function for quickly calling cookiecutter with `cc`.

new_cookiecutter_project() {
    local selected_template="https://github.com/henrystern/cookiecutter-python-data"
    select option in "python-data" "python-data-BoC"
    do
        case $option in
            "python-data")
                selected_template="https://github.com/henrystern/cookiecutter-python-data"
                break
                ;;
            "python-data-BoC")
                selected_template="https://github.com/henrystern/cookiecutter-python-data -c BoC"
                break
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
    done

    echo "Running cookiecutter with arguments: $chosen_args"
    conda run -n cookiecutter --no-capture-output cookiecutter $selected_template
}
alias cc="new_cookiecutter_project"