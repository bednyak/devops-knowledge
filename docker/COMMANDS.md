# Docker

## Commands
- build docker image with setting arguments
```
docker build -t [image_name] [dockerfile_location] --build-arg [ARG_KEY]=[ARG_VALUE] ---> example: docker build -t andrewbednyak/front:local . --build-arg VUE_APP_DEFAULT_HOST_BOT=http://localhost:4455 --build-arg VUE_APP_DEFAULT_HOST_MESSAGE_SERVICE=http://localhost:2222
```
- run docker-compose services in the background mode
```
docker-compose up --build [container_name_or_id]
```
- stop all docker-compose services, delete all images and volumes
```
docker-compose down --rmi all --volumes --remove-orphans
```
- get docker container logs and follow it
```
docker logs -f [container_name_or_id]
```
- get docker container logs with specific amount of records from start and follow it
```
docker logs -f --tail [amount_of_rows] [container_name_or_id]
```
- get list of docker volumes
```
docker volume ls
```
- remove docker volume
```
docker volume rm [volume_name_or_id]
```
- remove all docker volumes
```
docker volume prune --filter all=1 // works for Mint
docker volume prune // works for Ubuntu
```
- enter the running docker container terminal
```
docker exec -it [container_name_or_id] /bin/bash
```
- combination of commands for stopping/removing containers and deleting images
```
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi $(docker images -q)
```
- get IP-address of docker container
```
docker inspect [container_name or ID] | grep "IPAddress"
```
- pull and run docker image as a new container
```
docker run [image_name]
```
- get list of only running containers
```
docker ps
```
- get list of all containers
```
docker ps -a
```
- stop docker container
```
docker stop [container_name or ID]
```
- remove stopped docker container
```
docker rm [container_name or ID]
```
- get list of all available images on host machine
```
docker images
```
OR
```
docker image ls
```
- remove docker image
```
docker rmi [image_name]
```
- only pull docker image but don't run it as a new container
```
docker pull [image_name]
```
- pull and run docker image as a new container, wait 5 sec and keep conainer running, after 5 sec container will stop  (only if process inside of container is finished)
```
docker run [image_name] sleep 5
```
- run command from inside docker ocntainer
```
docker exec [container_name or ID] [bash_command] --> example docker exec my-container cat /etc/hosts
```
- run docker container in attach mode
```
docker run [container_name or ID]
```
- run docker container in detach mode
```
docker run [container_name or ID]
```
- attach to the running docker container
```
docker attach [container_name or ID]
```
- run docker image with specific version
```
docker run [image_name]:[version] --> example: docker run redis:4.0
```
- run docker image in interactive mode
```
docker run -i [image_name]:[version] --> example: docker run -i redis:4.0
```
- run docker image in interactive+terminal active mode
```
docker run -it [image_name]:[version] --> example: docker run -it redis:4.0
```
- run docker image and open ports
```
docker run -p [host_machine_port]:[docker_host_internal_port] [image_name] --> example: docker run 80:5000 redis
```
- volume mapping
```
docker run -v [host_machine_filepath_to_resource]:[docker_host_internal_filepath_to_resource ] [image_name] --> example: docker run -v /opt/datadir:/var/lib/redis redis
```
- get all info about container (networks, environment variables, etc.)
```
docker inspect [container_name or ID]
```
- get docker container logs
```
docker logs [container_name or ID]
```
- run docker container with pre-set environment variables
```
docker run -e [envrionment_variable_key=environment_variable_variable] [container_name of ID] ---> example docker run APP_COLOR=blue color-app
```
- build image of your custom Dockerfile
```
docker build [path_to_dockerfile] -t [name_of_image] ---> example if Dockerfile located in root directory: docker build . -t abiedniak/my-custom-app
```
- push to docker registry
```
docker push [name_of_image] ---> docker push abiedniak/my-custom-app
```
- get docker image history
```
docker history [name_of_image] ---> docker history abiedniak/my-custom-app
```
- create new docker 'bridge' network
```
docker network create --driver [driver_type] --subnet [ip_mask] [network_name] ---> example: docker network create --driver bridge --subnet 182.18.0.0/16 custom-isolated-network
```
- create new volume
```
docker volume create [volume_name] ---> example: docker volume create data_volume
```
- mount volume to container
```
docker run -v [volume_name]:[container_internal_path_to_folder] [container_name or ID] ---> example: docker run -v data_volume:/var/lib/mysql mysql
```

- mount host machine path to container
```
docker run -v [host_machine_path_to_folder]:[container_internal_path_to_folder] [container_name or ID] ---> example: docker run -v /data/mysql:/var/lib/mysql mysql
```

- run docker image with setting name and port
```
docker run -d --name=[desired_container_name] -p [host_machine_port]:[container_internal_port] [image_name] ---> example: docker run -d --name=vote -p 5000:80 voting-app
```

- create replica of your docker service (use only in Docker Swarm Orchestrator)
```
docker service create --replica=[amount_of_replicas] [image_name] ---> example: docker service create --replica=100 nodejs
```