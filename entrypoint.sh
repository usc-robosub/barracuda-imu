#!/usr/bin/bash
source /opt/ros/noetic/setup.bash

# Build & Source catkin_ws
cd barracuda-imu/catkin_ws
catkin_make
source devel/setup.bash

# Create udev rules file for NGIMU (need to update the IDVendor and IDProduct values)
echo "SUBSYSTEM==\"tty\", ATTR{idVendor}==\"$ID_VENDOR\", ATTR{idProduct}==\"$ID_PRODUCT\", SYMLINK+=\"ngimu\"" > /etc/udev/rules.d/99-ngimu.rules
udevd &

# Start interactive shell session in /opt/barracuda-imu directory
cd ..
exec /bin/bash