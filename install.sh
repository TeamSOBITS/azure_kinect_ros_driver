#!/bin/bash

echo "Starting the installation..."

cd ~/colcon_ws/src

git clone https://github.com/TeamSOBITS/azure_kinect_sensor_sdk.git

cd azure_kinect_sensor_sdk
bash install.sh

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
