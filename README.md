# barracuda-imu

## Do the following IF `docker-compose.yml` DOES NOT EXIST:

### Build docker image from dockerfile
1. Make sure you have Docker Desktop installed and running on your host machine.
2. Open a terminal shell in the base directory of this repository.
```bash
docker build -t barracuda-imu-node .
```
3. You should now have a docker image named `barracuda-imu-node`.
4. WARNING: Each time you run this command, a new image is created. Building from `docker-compose.yml` is preferred.

### Run docker image `barracuda-imu-node` in interactive mode
1. Open a terminal shell in the base directory of this repository.
```bash
docker run -it barracuda-imu-node
```

## Do the following IF `docker-compose.yml` DOES EXIST:
### To Build and Start Container 
```
docker compose up -d
```

### To Stop and Remove All Images and Orphans 
```
docker compose down --remove-orphans --rmi all
```
