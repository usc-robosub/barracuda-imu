# barracuda-imu

ROS package for interfacing with Phidgets Spatial IMU on the USC Robosub Barracuda AUV.

## Overview

This package uses the [Phidgets Spatial IMU](https://www.phidgets.com/?prodid=1205) to provide orientation, angular velocity, and linear acceleration data via ROS. The system runs in a Docker container for easy deployment and dependency management.

### Hardware Requirements
- Phidgets Spatial IMU (1044 or MOT0110+ models supported)
- USB connection to host computer

### Software Dependencies
- ROS Noetic
- phidgets_spatial ROS package
- imu_filter_madgwick for sensor fusion

## Device Setup

### Identify Phidgets Device
```bash
lsusb | grep Phidgets
```

### Check Device Connection
```bash
# Check if device is detected
ls /dev/hidraw*
# Or check USB devices
udevadm info -a -n /dev/hidrawX
```

### Verify Device Attributes
The Phidgets device should appear with vendor ID `04d8` and product ID `0057` (or similar depending on model).

### Set Environment Variables
Update the `.env` file with your device's vendor and product IDs:
```
VENDOR_ID=04d8
PRODUCT_ID=0057
```

## Docker Operations

### To Build and Start Container 
```bash
docker compose up -d
```

### To Enter the Container in Shell Mode
```bash
docker exec -it barracuda-imu /bin/bash
```

### To Exit the Container in Shell Mode
```bash
exit
```

### To Shut Down the Container and all Orphans 
```bash
docker compose down --remove-orphans --rmi all
```

## Usage

The package automatically starts when the container is launched and publishes IMU data to the following ROS topics:
- `/barracuda/imu/data_raw` - Raw IMU data
- `/barracuda/imu/data` - Filtered IMU data with orientation
- `/barracuda/imu/mag` - Magnetometer data

### Configuration

The IMU parameters can be adjusted in the launch file `catkin_ws/src/barracuda_imu/launch/barracuda_imu.launch`. Key parameters include:
- `data_interval_ms`: Data publishing rate (default: 4ms)
- `heating_enabled`: Enable IMU heating for temperature stability
- `frame_id`: TF frame for the IMU data

## Troubleshooting

### IMU Not Detected
1. Check USB connection
2. Verify device appears in `lsusb` output
3. Ensure correct vendor/product IDs in `.env` file
4. Restart container after hardware changes

### No Data on ROS Topics
1. Check if the launch file started successfully: `rosnode list`
2. Verify topics are published: `rostopic list | grep imu`
3. Check for errors in container logs: `docker logs barracuda-imu`

### Permission Issues
The container runs with privileged access to interface with USB devices. Ensure the container has the necessary permissions.

## References
- [Phidgets Spatial Documentation](https://www.phidgets.com/docs/1044_User_Guide)
- [ROS phidgets_spatial Package](https://wiki.ros.org/phidgets_spatial)
- [IMU Filter Madgwick](https://wiki.ros.org/imu_filter_madgwick)
