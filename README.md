# Export PG Docker

Dumps the database from a Postgres Docker container

## Prerequisites

- Docker installed on your machine
- A running Postgres Docker container

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/goodpie/export-pg-db-docker.git
    cd export-pg-docker
    ```

2. Run the script to dump the database:
    ```sh 
    ./export-pg-db-docker.sh <container_name> <db_user> <db_name>
    ```


## License

This project is licensed under the MIT License.