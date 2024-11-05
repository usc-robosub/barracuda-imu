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
'''
udevadm info -a -n /dev/ttyUSB0
'''

### Writing udev Rules
'''
sudo nano /etc/udev/rules.d/99-barracuda-imu.rules
SUBSYSTEM=="tty", ATTRS{idVendor}=="your_vendor_id", ATTR{idProduct}=="your_product_id", SYMLINK+="barracuda-imu"
'''

### Reload udev Rules and Test
'''
sudo udevadm control --reload-rules
sudo udevadm trigger
'''

### Verify Device is Connected
'''
ls -l /dev/barracuda-imu
'''

