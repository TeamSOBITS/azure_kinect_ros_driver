# #!/bin/bash
echo "╔══╣ Install: Azure Kinect ROS2 Driver (STARTING) ╠══╗"

set -e

# 1. Dependencies
sudo apt update
sudo apt install -y \
  software-properties-common \
  curl \
  wget \
  dialog \
  libsoundio2 \
  libgl1-mesa-dev \
  libusb-1.0-0-dev \
  build-essential \
  cmake \
  ninja-build \
  pkg-config \
  ros-humble-xacro \
  ros-humble-joint-state-publisher

# 2. Download Azure Kinect packages (from Microsoft Ubuntu 18.04 repo)
if dpkg -l | grep -q libk4a1.4; then
  echo "Azure Kinect SDK already installed. Skipping."
else
  echo "Installing Azure Kinect SDK..."

  mkdir -p ~/azure_kinect_install && cd ~/azure_kinect_install

  curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4a1.4/libk4a1.4_1.4.1_amd64.deb
  curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4a1.4-dev/libk4a1.4-dev_1.4.1_amd64.deb
  curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4abt1.1/libk4abt1.1_1.1.2_amd64.deb
  curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4abt1.1-dev/libk4abt1.1-dev_1.1.2_amd64.deb
  curl -O https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/k/k4a-tools/k4a-tools_1.4.1_amd64.deb

  # 3. Install Azure Kinect SDK
  echo 'libk4a1.4 libk4a1.4/accepted-eula-hash string 0f5d5c5de396e4fee4c0753a21fee0c1ed726cf0316204edda484f08cb266d76' | sudo debconf-set-selections
  echo 'libk4a1.4 libk4a1.4/accept-eula boolean true' | sudo debconf-set-selections
  sudo dpkg -i libk4a1.4_1.4.1_amd64.deb
  sudo dpkg -i libk4a1.4-dev_1.4.1_amd64.deb || true

  echo 'libk4abt1.1 libk4abt1.1/accepted-eula-hash string 03a13b63730639eeb6626d24fd45cf25131ee8e8e0df3f1b63f552269b176e38' | sudo debconf-set-selections
  echo 'libk4abt1.1 libk4abt1.1/accept-eula boolean true' | sudo debconf-set-selections
  sudo dpkg -i libk4abt1.1_1.1.2_amd64.deb
  sudo dpkg -i libk4abt1.1-dev_1.1.2_amd64.deb || true
  sudo dpkg -i k4a-tools_1.4.1_amd64.deb || true

  # Fix broken dependencies if any
  sudo apt-get -f install -y
    cd ..
    rm -rf ./azure_kinect_install
fi

# 4. Udev rules
wget https://raw.githubusercontent.com/microsoft/Azure-Kinect-Sensor-SDK/develop/scripts/99-k4a.rules
sudo mv 99-k4a.rules /etc/udev/rules.d/


echo "╚══╣ Install: Azure Kinect ROS2 Driver (FINISHED) ╠══╝"
