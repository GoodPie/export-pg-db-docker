# Export PG Docker

Dumps the database from a Postgres Docker container

## Prerequisites

- Docker installed on your machine
- A running Postgres Docker container

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/goodpie/export-pg-db-docker.git
    cd export-pg-db-docker
    ```

2. Run the script to dump the database:
    ```sh 
    ./export-pg-db-docker.sh <container_name> <db_user> <db_name> [directory]
    ```

    - `<container_name>`: Name of the Docker container to pull the database from.
    - `<db_user>`: Username for the PostgreSQL database.
    - `<db_password>`: Password for the PostgreSQL database.

3. **Run the script:**

    ```sh
    ./import-pg-db-docker.sh <container_name> <db_user> <db_password> <db_name> [directory]
    ```

    - `<container_name>`: Name of the Docker container to be created.
    - `<db_user>`: Username for the PostgreSQL database.
    - `<db_password>`: Password for the PostgreSQL database.
    - `<db_name>`: Name of the PostgreSQL database.
    - `[directory]`: Optional directory to store or read the SQL dump file. If not provided, a temporary directory will be used.

4. **Select the SQL dump file:**

    The script will list all available `.sql` files in the current directory. Enter the number corresponding to the file you want to use for the database import.

## Example

```sh
./export-pg-db-docker.sh my_old_container my_user my_password
./import-pg-db-docker.sh my_container my_user my_password my_database
```

## License

This project is licensed under the MIT License.
