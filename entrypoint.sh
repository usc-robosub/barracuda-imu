#!/usr/bin/bash
source /opt/ros/noetic/setup.bash

# Build & Source catkin_ws
cd barracuda-imu/catkin_ws
catkin_make
source devel/setup.bash

# Create udev rules file for NGIMU
echo "SUBSYSTEM==\"tty\", ATTRS{idVendor}==\"$VENDOR_ID\", ATTRS{idProduct}==\"$PRODUCT_ID\", SYMLINK+=\"ngimu\"" > /etc/udev/rules.d/99-ngimu.rules
sudo udevadm control --reload-rules 
sudo service udev restart 
sudo udevadm trigger

# Source ros and catkin_ws in bashrc
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "source /opt/barracuda-imu/catkin_ws/devel/setup.bash" >> ~/.bashrc

roslaunch barracuda_imu barracuda_imu.launch --wait
