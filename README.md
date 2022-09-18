# Azure Kinect ROS Driver

> **Warning**
> ROS Noeticの場合、ROS Melodicのコンテナ上でインストールし、トピック通信より、RGBD情報をROS Noeticのコンテナから受け取る。

## 参考DOCファイル（公式サイト）
https://github.com/microsoft/Azure_Kinect_ROS_Driver

## セットアップ手順（公式サイト）
https://learn.microsoft.com/en-us/windows-server/administration/linux-package-repository-for-microsoft-software

## 動作環境
- Ubuntu 18.04
- ROS Melodic
- ROS Noetic（未対応）

## インストール

```
cd ~/catkin_ws/src/
https://github.com/TeamSOBITS/azure_kinect_ros_driver
cd azure_kinect_ros_driver
bash install.sh
```

## install.shの中身

``` bash
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
```

## k4aviewer＆ROSパッケージの起動
``` bash
#k4aviewer
k4aviewer
```

``` bash
#ROSパッケージ
roslaunch azure_kinect_ros_driver driver.launch
```

## Tips
[Azure Kinect SDK (K4A)](https://github.com/microsoft/Azure-Kinect-Sensor-SDK)
