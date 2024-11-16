#!/usr/bin/bash
source /opt/ros/noetic/setup.bash

# Build & Source catkin_ws
cd barracuda-imu/catkin_ws
catkin_make
source devel/setup.bash

# Create udev rules file for NGIMU
echo "SUBSYSTEM==\"tty\", ATTR{idVendor}==\"$VENDOR_ID\", ATTR{idProduct}==\"$PRODUCT_ID\", SYMLINK+=\"ngimu\"" > /etc/udev/rules.d/99-ngimu.rules
sudo udevadm control --reload-rules 
sudo service udev restart 
sudo udevadm trigger

# Start interactive shell session in /opt/barracuda-imu directory
cd ..
exec /bin/bash