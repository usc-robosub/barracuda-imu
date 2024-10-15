# barracuda-imu

## Do the following IF `docker-compose.yml` DOES NOT EXIST:

### Build docker image from dockerfile
1. Make sure you have Docker Desktop installed and running on your host machine.
2. Open a terminal shell in the base directory of this repository.
```bash
docker build -t imu-node .
```
3. You should now have a docker image named `imu-node`.
4. WARNING: Each time you run this command, a new image is created. Building from `docker-compose.yml` is preferred.

### Run docker image `imu-node` in interactive mode
1. Open a terminal shell in the base directory of this repository.
```bash
docker run -it imu-node
```

## Do the following IF `docker-compose.yml` DOES EXIST: