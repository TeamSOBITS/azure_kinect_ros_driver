#!/bin/bash
# Reference: https://github.com/microsoft/Azure-Kinect-Sensor-SDK/issues/1263#issuecomment-710698591

echo "╔══╣ Install: k4a-tools for Azure Kinect (STARTING) ╠══╗"


# Install dependencies
sudo apt-get update
sudo apt install -y \
    software-properties-common \
    curl \
    dialog

# Add Microsoft’s official GPG key (Use 18.04 for 20.04)
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod

# Set up the stable repository
curl -sSL https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft-prod.list

# Install the latest stable version of k4a
sudo apt-get update

sudo apt-get install -y \
    libk4a1.3-dev \
    libk4abt1.0-dev \
    k4a-tools=1.3.0

# Add rules file
wget https://raw.githubusercontent.com/microsoft/Azure-Kinect-Sensor-SDK/develop/scripts/99-k4a.rules
sudo mv 99-k4a.rules /etc/udev/rules.d/

# Install ROS packages for rtabmap demo
sudo apt-get install -y \
    ros-${ROS_DISTRO}-rtabmap-ros

echo "╚══╣ Install: k4a-tools for Azure Kinect (FINISHED) ╠══╝"
