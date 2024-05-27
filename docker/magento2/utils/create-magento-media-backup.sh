#!/usr/bin/env bash
current_time=$(date +'%d-%m-%Y-%H-%M-%S')
filename="media-backup-${current_time}.tar.xz"

backup_dir="/var/backups"

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

#docker cp mg2:/var/www/magento2/pub/media /var/backups/media
docker cp mg2:/var/www/app/pub/media ${backup_dir}/media
tar -cJf ${backup_dir}/${filename} -C ${backup_dir} media
rm -r ${backup_dir}/media
