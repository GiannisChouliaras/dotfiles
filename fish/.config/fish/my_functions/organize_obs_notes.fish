function oof
    # Define directories
    set VAULT_DIR /home/ioannis-chouliaras/Documents/second_brain
    set SOURCE_DIR brain
    set DEST_DIR notes

    # Find and process markdown files
    find "$VAULT_DIR/$SOURCE_DIR" -type f -name "*.md" | while read -l file
        echo "Processing $file"

        # Extract the tag
        set tag (awk '/tags:/{getline; print; exit}' "$file" | string trim | string replace -r '^- *' '')

        echo "Found tag $tag"

        # If tag is found
        if test -n "$tag"
            # Create target directory and move the file
            set TARGET_DIR "$VAULT_DIR/$DEST_DIR/$tag"
            mkdir -p "$TARGET_DIR"
            mv "$file" "$TARGET_DIR/"
            echo "Moved $file to $TARGET_DIR"
        else
            echo "No tag found for $file"
        end
    end

    echo "Done 🪷"
end
