# PostgreSQL

- Create DB dump inside of container
    ```
    docker exec -it [psql_container_name]  bash -c "pg_dump -U [psql_container_db_username] -w [psql_container_db_name] > /root/psql_backup_$(date +"\%Y-\%m-\%d_\%H-\%M-\%S").sql"
    ``` 
  example:
    ```
    docker exec -it my-postgres-db bash -c "pg_dump -U postgres -w test-db > /root/psql_backup_$(date +"\%Y-\%m-\%d_\%H-\%M-\%S").sql"
    ```

- Copy DB dump file from container to host machine
    ```
    docker cp [psql_container_name]:[path_to_dbdump_on_psql_container] [destination_path_on_host_machine]
    ```
  example:
    ```
    docker cp my-postgres-db:/root/psql_backup_2024-04-23_18-07-47.sql ~/psql_backup_2024-04-23_18-07-47.sql
    ```

- Copy DB dump file from host machine to container
    ```
    docker cp [path_to_dbdump_on_host_machine] [psql_container_name]:[destination_path_on_psql_container]
    ```
  example:
    ```
    docker cp ~/psql_backup_2024-04-23_18-07-47.sql my-postgres-db:/root/psql_backup_2024-04-23_18-07-47.sql
    ```

- Import DB dump
    ```
    docker exec -it [psql_container_name] bash -c "psql -h localhost -d [psql_container_db_name] -U [psql_container_db_username] -f /root/psql_backup_2024-04-23_18-30-22.sql"
    ```
  example:
    ```
    docker exec -it my-postgres-db bash -c "psql -h localhost -d test-db -U postgres -f /root/psql_backup_2024-04-23_18-30-22.sql"
    ```

- Get the list of all users and their roles
    ```
    psql -U [psql_container_username]
    \du
    ```