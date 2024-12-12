#!/bin/bash

# Check if all parameters are present
if [ $# -lt 4 ] || [ $# -gt 5 ]; then
    echo "Usage: $0 <container_name> <db_user> <db_password> <db_name> [directory]"
    exit 1
fi

container_name=$1
db_user=$2
db_password=$3
db_name=$4
directory=${5:-$(mktemp -d)}

# List available .sql files
echo "Available .sql files in $directory:"
sql_files=("$directory"/*.sql)
if [ ${#sql_files[@]} -eq 0 ]; then
    echo "No .sql files found in the directory $directory."
    exit 1
fi

for i in "${!sql_files[@]}"; do
    echo "$i) ${sql_files[$i]}"
done

# Prompt user to select a file
read -p "Enter the number of the .sql file to use: " file_index
if ! [[ "$file_index" =~ ^[0-9]+$ ]] || [ "$file_index" -ge "${#sql_files[@]}" ]; then
    echo "Invalid selection."
    exit 1
fi

dump_file="${sql_files[$file_index]}"

# Create a new Docker container
echo "Creating a new Docker container: $container_name"
docker run --name "$container_name" -e POSTGRES_USER="$db_user" -e POSTGRES_PASSWORD="$db_password" -e POSTGRES_DB="$db_name" -d -p 5432:5432 postgres 

# Wait for the container to be ready
echo "Waiting for the container to be ready..."
sleep 10

# Import the database dump
echo "Importing the database dump from $dump_file"
cat "$dump_file" | docker exec -i "$container_name" psql -U "$db_user" -d "$db_name"

if [ $? -eq 0 ]; then
    echo "Database import successful."
else
    echo "Error: Database import failed."
    exit 1
fi