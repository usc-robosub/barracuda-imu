#!/usr/bin/bash
source /opt/ros/noetic/setup.bash
cd barracuda-imu/catkin_ws
catkin_make
cd ..
exec /bin/bash