#!/bin/bash

# Check if all parameters are present
if [ $# -ne 3 ]; then
    echo "Usage: $0 <container_name> <db_user> <db_name>"
    exit 1
fi

container_name=$1
db_user=$2
db_name=$3

# Generate output file name based on date and container name
output_file="${container_name}_$(date +%Y%m%d_%H%M%S).sql"

# Output the file name
echo "The database will be exported to: $output_file"

# Execute the pg_dump command
echo "Running command: docker exec -t \"$container_name\" pg_dump -U \"$db_user\" \"$db_name\" > \"$output_file\""
# Prompt for the database password
read -sp "Enter the database password: " db_password
echo

# Export the password to the environment variable
export PGPASSWORD="$db_password"

if docker exec -e PGPASSWORD="$db_password" -t "$container_name" pg_dump -U "$db_user" "$db_name" > "$output_file"; then
    echo "Database export successful."
else
    echo "Error: Database export failed."
    exit 1
fi