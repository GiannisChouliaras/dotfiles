function create_env
    # Ensure at least one argument is provided
    if test (count $argv) -lt 1
        echo "Usage: create_env <env_name> [requirements_file]"
        return 1
    end

    set env_name $argv[1]
    set requirements_file ''

    # Check if the second argument is provided
    if test (count $argv) -ge 2
        set requirements_file $argv[2]
    end

    # Create the virtual environment
    python3 -m venv $env_name

    # Activate the virtual environment
    . $env_name/bin/activate.fish

    # Install requirements if the file is provided
    if test -n "$requirements_file"
        if test -f "$requirements_file"
            pip install -r $requirements_file
        else
            echo "Requirements file '$requirements_file' not found."
            return 1
        end
    end
end
