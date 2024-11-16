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


### Identify Device Attributes
```
udevadm info -a -n /dev/ttyUSB0
```

### Verify udev Rules correctly written
```
cat /etc/udev/rules.d/99-ngimu.rules
```
Should output:
```
SUBSYSTEM=="usb", ATTRS{idVendor}=="your_vendor_id", ATTR{idProduct}=="your_product_id", SYMLINK+="ngimu"
```

### Verify Device is Connected
```
ls -l /dev/ngimu
```

