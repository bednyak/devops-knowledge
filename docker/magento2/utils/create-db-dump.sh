#!/usr/bin/env bash
current_time=$(date +'%d-%m-%Y-%H-%M-%S')
filename="db-backup-${current_time}.sql"
path_to_sql_dump_in_docker_container="/home/${filename}"
backup_dir="/var/backups/"

# Check if the directory exists
if [ ! -d "$backup_dir" ]; then
    echo "Directory $backup_dir doesn't exist, creating it..."
    mkdir -p "$backup_dir"
    if [ $? -eq 0 ]; then
        echo "Directory $backup_dir created successfully."
    else
        echo "Failed to create directory $backup_dir."
        exit 1
    fi
else
    echo "Directory $backup_dir already exists."
fi

docker exec -it utils-mysql-db bash -c "touch $path_to_sql_dump_in_docker_container"
echo "Starting creating mysqldump: ${filename}"
docker exec -it utils-mysql-db bash -c "mysqldump -u bpp -p'98813|}tQ-*r' -h 10.1.126.2 -P 3306 magento > $path_to_sql_dump_in_docker_container"
docker cp utils-mysql-db:${path_to_sql_dump_in_docker_container} ${backup_dir}/${filename} && echo "Dump successfully created - storage location:" && echo ${backup_dir}/${filename}


