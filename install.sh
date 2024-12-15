#!/bin/bash

echo "Starting the installation..."

cd ~/colcon_ws/src

git clone https://github.com/TeamSOBITS/azure_kinect_sensor_sdk.git
if [ $? -ne 0 ]; then
  echo "Failed to clone the repository. Exiting..."
  exit 1
fi

cd azure_kinect_sensor_sdk

if [ ! -f install.sh ]; then
  echo "install.sh not found. Exiting..."
  exit 1
fi

chmod +x install.sh
./install.sh
if [ $? -ne 0 ]; then
  echo "install.sh execution failed. Exiting..."
  exit 1
fi

echo "export PATH=\$PATH:/home/\$USER/colcon_ws/install/K4A/bin" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/libk4a1.4" >> ~/.bashrc
source ~/.bashrc

echo "Installation completed."
