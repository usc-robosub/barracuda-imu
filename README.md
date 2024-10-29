# barracuda-imu

### To Build and Start Container 
```
docker compose up -d
```

### To Enter the Container in Shell Mode
```
docker exec -it barracuda-imu /bin/bash
```

### To Exit the Container in Shell Mode
```
exit
```

### To Shut Down the Container and all Orphans 
```
docker compose down --remove-orphans --rmi all
```

