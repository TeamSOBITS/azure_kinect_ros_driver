#!/bin/bash
# Reference: https://github.com/microsoft/Azure-Kinect-Sensor-SDK/issues/1263#issuecomment-710698591

echo "╔══╣ Install: k4a-tools for Azure Kinect (STARTING) ╠══╗"


# Install dependencies
sudo apt-get update
sudo apt-get install -y \
    software-properties-common \
    curl \
    wget \
    dialog \
    libsoundio1

# Download Azure Kinect related packages
curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4a1.4/libk4a1.4_1.4.1_amd64.deb
curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4a1.4-dev/libk4a1.4-dev_1.4.1_amd64.deb
curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4abt1.1/libk4abt1.1_1.1.2_amd64.deb
curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4abt1.1-dev/libk4abt1.1-dev_1.1.2_amd64.deb
curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/k/k4a-tools/k4a-tools_1.4.1_amd64.deb

# Install k4a-related packages
sudo dpkg -i libk4a1.4_1.4.1_amd64.deb
sudo dpkg -i libk4a1.4-dev_1.4.1_amd64.deb
sudo dpkg -i libk4abt1.1_1.1.2_amd64.deb
sudo dpkg -i libk4abt1.1-dev_1.1.2_amd64.deb
sudo dpkg -i k4a-tools_1.4.1_amd64.deb

# Remove deb files
sudo rm *.deb

# Add rules file
wget https://raw.githubusercontent.com/microsoft/Azure-Kinect-Sensor-SDK/develop/scripts/99-k4a.rules
sudo mv 99-k4a.rules /etc/udev/rules.d/

# Install ROS packages for rtabmap demo
sudo apt-get install -y \
    ros-${ROS_DISTRO}-rtabmap-ros \
    ros-${ROS_DISTRO}-camera-info-manager


echo "╚══╣ Install: k4a-tools for Azure Kinect (FINISHED) ╠══╝"
