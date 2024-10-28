#!/usr/bin/bash
source /opt/ros/noetic/setup.bash

# Build catkin_ws
cd barracuda-imu/catkin_ws
catkin_make
source devel/setup.bash

# Start interactive shell session in /opt/barracuda-imu directory
cd ..
exec /bin/bash