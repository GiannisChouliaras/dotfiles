function nof
    # Check if an argument is provided
    if test (count $argv) -eq 0
        echo "Error: A file name must be set, e.g. on 'the wonderful thing about tiggers'."
        return 1
    end

    # Replace spaces in the input with hyphens
    set file_name (string replace ' ' '-' -- $argv)

    # Format the file name with the current date
    set formatted_file_name (date "+%Y-%m-%d")_"$file_name".md

    # Navigate to the target directory
    cd /home/ioannis-chouliaras/Documents/second_brain/ || return 1

    # Create the file in the inbox folder and open it in Neovim
    touch "inbox/$formatted_file_name"
    nvim "inbox/$formatted_file_name"
end
