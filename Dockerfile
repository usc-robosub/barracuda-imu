# Base image for ROS Noetic on ARM64 architecture
FROM osrf/ros:noetic-ros-base-focal-arm64

# Set working directory
WORKDIR /catkin_ws

# Install required dependencies for the IMU sensor and other tools
RUN apt-get update && apt-get install -y \
    ros-noetic-imu-tools \
    build-essential \
    python3-catkin-tools \
    python3-rosdep \
    python3-vcstool \
    && rm -rf /var/lib/apt/lists/*

# Initialize ROS dependencies
RUN rosdep init && rosdep update

# Copy your device driver package (assuming you have it locally)
COPY ./your_device_driver /catkin_ws/src/your_device_driver

# Build your ROS workspace
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make"

# Source the workspace on container start
CMD ["/bin/bash", "-c", "source /opt/ros/noetic/setup.bash && source /catkin_ws/devel/setup.bash && roslaunch your_device_driver your_launch_file.launch"]
