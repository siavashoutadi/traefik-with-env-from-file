#!/bin/sh
set -e

# Iterate over all environment variables
for var in $(env | cut -d= -f1); do
  # Check if the variable name ends with _FILE
  case "$var" in
    *_FILE)
      # Get the name of the target variable (e.g., ACME_EMAIL)
      target_var=$(echo "$var" | sed 's/_FILE//')
      # Get the path from the _FILE variable
      file_path=$(eval echo \$$var)

      if [ -f "$file_path" ]; then
        # Read file, strip newlines, and export
        export "$target_var"="$(cat "$file_path" | tr -d '\n\r')"
        echo "Exported $target_var from $file_path"
      fi
      ;;
  esac
done

# Execute the original entrypoint or command
exec "$@"
