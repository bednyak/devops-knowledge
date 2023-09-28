# Docker

## Save image to registry
1. Login to https://hub.docker.com/u/andrewbednyak
2. Build your image
```
docker build -t [image_name] [dockerfile_location] ---> example: docker build -t andrewbednyak/front . 
```
OR
```
docker build -t [image_name]:[tag] [dockerfile_location] ---> example docker build -t andrewbednyak/front:local .
```
3. Login into the docker hub via terminal
```
docker login docker.io
```
4. Push your image to registry
```
docker push [image_name]:[tag] ---> example: docker push andrewbednyak/front:local
```
5. To push image under new tag

   - Bind image ID to new tag
   ```
   docker tag [image_id] [image_name]:[new_tag] ---> example: docker tag f0c94deefb6a andrewbednyak/front:test
   ```
   - Push image under new tag
   ```
   docker push [image_name]:[new_tag]
   ```