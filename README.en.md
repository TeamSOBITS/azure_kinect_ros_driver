<a name="readme-top"></a>

[JA](README.md) | [EN](README.en.md)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

# Azure Kinect ROS Driver

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#introduction">Introduction</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
    　<a href="#launch-and-usage">Launch and Usage</a>
      <ul>
        <li><a href="#operational-test">Operational Test</a></li>
        <li><a href="#visualization-on-rviz">Visualization on Rviz</a></li>
        <li><a href="#demo:-skeleton-recognition">Demo: Skeleton Recognition</a></li>
        <li><a href="#demo:-rtabMap">Demo: RtabMap</a></li>
      </ul>
    </li>
    <li>
    <li><a href="#milestone">Milestone</a></li>
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- INTRODUCTION -->
## Introduction

This repository is based on [Azure Kinect ROS Driver](https://github.com/microsoft/Azure_Kinect_ROS_Driver) created by Microsoft, and also supports `ROS Noetic`.
Moreover, this repository supports an updated and realistic `URDF` file which satisfies the characteristics of the actual camera.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This section describes how to set up this repository.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Prerequisites

First, please prepare the following environment before proceeding to the next installation stage.

| System  | Version |
| ------------- | ------------- |
| Ubuntu | 20.04 (Focal Fossa) |
| ROS | Noetic Ninjemys |

> [!NOTE]
> If you need to install `Ubuntu` or `ROS`, please check our [SOBIT Manual](https://github.com/TeamSOBITS/sobits_manual#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Installation

1. Go to the `src` folder of ROS.
   ```sh
   $ roscd
   # Or just use "cd ~/catkin_ws/" and change directory.
   $ cd src/
   ```
2. Clone this repository.
   ```sh
   $ git clone https://github.com/TeamSOBITS/azure_kinect_ros_driver
   ```
3. Navigate into the repository.
   ```sh
   $ cd azure_kinect_ros_driver/
   ```
4. Install the dependent packages.
   ```sh
   $ bash install.sh
   ```

> [!NOTE]
> Running [install.sh](install.sh) will automatically install the required [Azure Kinect SDK (K4A)](https://github.com/microsoft/Azure-Kinect-Sensor-SDK).

5. Compile the package.
   ```sh
   $ roscd
   # Or just use "cd ~/catkin_ws/" and change directory.
   $ catkin_make
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LAUNCH AND USAGE EXAMPLES -->
## Launch and Usage

When using the camera alone, execute [driver.launch](launch/driver.launch) according to the following procedure.

1. Update the following parameters of [driver.launch](launch/driver.launch) if necessary.
   ```xml
    <!-- Add Prefix to tf frame. It typically contains a trailing '_' unless empty. -->
    <arg name="tf_prefix"         default="azure_" />
    <!-- Add cover to camera -->
    <arg name="add_cover"         default="true" />
    <!-- Visualize Rviz -->
    <arg name="open_rviz"         default="true"/>
    ...
   ```

> [!NOTE]
> Replace with `true` or `false` depending on the function you want to use.

2. Execute the launch file named [driver.launch](launch/driver.launch).
   ```sh
   $ roslaunch azure_kinect_ros_driver driver.launch
   ```

> [!NOTE]
> If you need to change the camera parameters, please refer to [usage.md](docs/usage.md).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Operational Test

To check if Azure Kinect ROS Driver has been successfully installed, run `k4aviewer` of `k4a-tools` installed through [install.sh](install.sh).

1. Start `k4aviewer`.
    ```sh
    $ k4aviewer
    ```

2. Specify the camera in the `Open Device` field.

> [!NOTE]
> In some cases, the `Azure Kinect` camera may not be recognized. In that case, try pressing the button `Refresh Devices`. If the problem persists, please refer to the `What does the light mean?`(https://learn.microsoft.com/en-us/azure/kinect-dk/hardware-specification#what-does-the-light-mean) and check the USB connection.

3. If the connection is established, update the parameters of the camera if necessary.

4. Finally, press the `Connect` button to activate the camera.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Visualization on Rviz

As a preliminary step to running the actual device, Azure Kinect DK can be visualized on Rviz to display the camera configuration.

```sh
$ roslaunch azure_kinect_ros_driver display.launch
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Demo: Skeleton Recognition

You can run the Skeleton Recognition demo program provided by default by Azure Kinect ROS Driver.

1. Execute the launch file named [driver_with_bodytracking.launch](launch/driver_with_bodytracking.launch).
    ```sh
    $ roslaunch azure_kinect_ros_driver driver_with_bodytracking.launch
    ```

> [!NOTE]
> Modify the launch file [driver.launch](launch/driver.launch) with parameters as needed, as shown in the section [Launch and Usage](#launch-and-usage).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Demo: RtabMap

You can run the RtabMap demo program provided by default by Azure Kinect ROS Driver.

1. Execute the launch file named [slam_rtabmap.launch](launch/slam_rtabmap.launch).
    ```sh
    $ roslaunch azure_kinect_ros_driver slam_rtabmap.launch
    ```

> [!NOTE]
> Modify the launch file [driver.launch](launch/driver.launch) with parameters as needed, as shown in the section [Launch and Usage](#launch-and-usage).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MILESTONE -->
## Milestone

- [x] OSS
    - [x] Enhanced Documentation
    - [x] Update [install.sh](install.sh)

See the [open issues][license-url] for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
<!-- ## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->


<!-- LICENSE -->
<!-- ## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Azure Kinect DK](https://azure.microsoft.com/ja-jp/products/kinect-dk)
* [Azure Kinect SDK (K4A)](https://github.com/microsoft/Azure-Kinect-Sensor-SDK)
* [Azure Kinect ROS Driver](https://github.com/microsoft/Azure_Kinect_ROS_Driver)
* [Azure Kinect DK Official Documentation](https://learn.microsoft.com/ja-jp/azure/kinect-dk/)
* [ROS Noetic](http://wiki.ros.org/noetic)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/TeamSOBITS/azure_kinect_ros_driver.svg?style=for-the-badge
[contributors-url]: https://github.com/TeamSOBITS/azure_kinect_ros_driver/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/TeamSOBITS/azure_kinect_ros_driver.svg?style=for-the-badge
[forks-url]: https://github.com/TeamSOBITS/azure_kinect_ros_driver/network/members
[stars-shield]: https://img.shields.io/github/stars/TeamSOBITS/azure_kinect_ros_driver.svg?style=for-the-badge
[stars-url]: https://github.com/TeamSOBITS/azure_kinect_ros_driver/stargazers
[issues-shield]: https://img.shields.io/github/issues/TeamSOBITS/azure_kinect_ros_driver.svg?style=for-the-badge
[issues-url]: https://github.com/TeamSOBITS/azure_kinect_ros_driver/issues
[license-shield]: https://img.shields.io/github/license/TeamSOBITS/azure_kinect_ros_driver.svg?style=for-the-badge
[license-url]: LICENSE
