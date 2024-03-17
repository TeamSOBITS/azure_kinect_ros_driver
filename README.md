<a name="readme-top"></a>

[JA](README.md) | [EN](README.en.md)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

# Azure Kinect ROS Driver TEST!!

<!-- 目次 -->
<details>
  <summary>目次</summary>
  <ol>
    <li>
      <a href="#概要">概要</a>
    </li>
    <li>
      <a href="#環境構築">環境構築</a>
      <ul>
        <li><a href="#環境条件">環境条件</a></li>
        <li><a href="#インストール方法">インストール方法</a></li>
      </ul>
    </li>
    <li>
    　<a href="#実行操作方法">実行・操作方法</a>
      <ul>
        <li><a href="#動作確認">動作確認</a></li>
        <li><a href="#Rviz上の可視化">Rviz上の可視化</a></li>
        <li><a href="#デモ骨格検出">デモ：骨格検出</a></li>
        <li><a href="#デモRtabMap">デモ：RtabMap</a></li>
      </ul>
    </li>
    <li>
    <li><a href="#マイルストーン">マイルストーン</a></li>
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <li><a href="#参考文献">参考文献</a></li>
  </ol>
</details>



<!-- レポジトリの概要 -->
## 概要

Microsoftが作成した[Azure Kinect ROS Driver](https://github.com/microsoft/Azure_Kinect_ROS_Driver)を基に，`ROS Noetic`にも対応させたレポジトリです．
さらに，実際のカメラの特性に忠実で，更新された`URDF`ファイルをサポートしています．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



<!-- セットアップ -->
## セットアップ

ここで，本レポジトリのセットアップ方法について説明します．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### 環境条件

まず，以下の環境を整えてから，次のインストール段階に進んでください．

| System  | Version |
| ------------- | ------------- |
| Ubuntu | 20.04 (Focal Fossa) |
| ROS | Noetic Ninjemys |

> [!NOTE]
> `Ubuntu`や`ROS`のインストール方法に関しては，[SOBITS Manual](https://github.com/TeamSOBITS/sobits_manual#%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)に参照してください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### インストール方法

1. ROSの`src`フォルダに移動します．
   ```sh
   $ roscd
   # もしくは，"cd ~/catkin_ws/"へ移動．
   $ cd src/
   ```
2. 本レポジトリをcloneします．
   ```sh
   $ git clone https://github.com/TeamSOBITS/azure_kinect_ros_driver
   ```
3. レポジトリの中へ移動します．
   ```sh
   $ cd azure_kinect_ros_driver/
   ```
4. 依存パッケージをインストールします．
   ```sh
   $ bash install.sh
   ```

> [!NOTE]
> [install.sh](install.sh)を実行することによって，必要とされる[Azure Kinect SDK (K4A)](https://github.com/microsoft/Azure-Kinect-Sensor-SDK)が自動的にインストールされます．

5. パッケージをコンパイルします．
   ```sh
   $ roscd
   # もしくは，"cd ~/catkin_ws/"へ移動．
   $ catkin_make
   ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


<!-- 実行・操作方法 -->
## 実行・操作方法

カメラ単体で使用する場合は，[driver.launch](launch/driver.launch)を次の手順で実行してください．


1. 必要に応じて[driver.launch](launch/driver.launch)のパラメータを更新してください．
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
> 使用したい機能に応じて，`true`か`false`かに書き換えてください．

2. [driver.launch](launch/driver.launch)というlaunchファイルを実行します．
   ```sh
   $ roslaunch azure_kinect_ros_driver driver.launch
   ```

> [!NOTE]
> カメラのパラメータを変更する場合は，[usage.md](docs/usage.md)を参照してください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### 動作確認

Azure Kinect ROS Driverが正常にインストールされたかどうかを確認するために，[install.sh](install.sh)でインストールされた`k4a-tools`の`k4aviewer`を実行してみます．

1. `k4aviewer`を起動します．
    ```sh
    $ k4aviewer
    ```

2. `Open Device`という項目の中に，カメラを指定します．

> [!NOTE]
> `Azure Kinect`が認識されない場合があります．その時は，`Refresh Devices`というボタンを押してみてください．問題が直せない場合は，[ライトの意味](https://learn.microsoft.com/ja-jp/azure/kinect-dk/hardware-specification#what-does-the-light-mean)を参照にして，USBの接続を確認してみてください．

3. カメラと接続ができた場合，必要に応じてカメラのパラメータを更新してください．

4. 最後に，`Connect`ボタンを押し，カメラを起動します．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### Rviz上の可視化
実機を動かす前段階として，Rviz上でAzure Kinect DKを可視化し，カメラの構成を表示することができます．

```sh
$ roslaunch azure_kinect_ros_driver display.launch
```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### デモ：骨格検出

Azure Kinect ROS Driverがデフォルトとして用意している骨格検出のデモプログラムを実行できます．

1. [driver_with_bodytracking.launch](launch/driver_with_bodytracking.launch)というlaunchファイルを実行します．
    ```sh
    $ roslaunch azure_kinect_ros_driver driver_with_bodytracking.launch
    ```

> [!NOTE]
> [実行・操作方法](#実行・操作方法)の項目に示されているように，[driver.launch](launch/driver.launch)というlaunchファイルを必要に応じてパラメータを修正してください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### デモ：RtabMap

Azure Kinect ROS Driverがデフォルトとして用意しているRtabMapのデモプログラムを実行できます．

1. [slam_rtabmap.launch](launch/slam_rtabmap.launch)というlaunchファイルを実行します．
    ```sh
    $ roslaunch azure_kinect_ros_driver slam_rtabmap.launch
    ```

> [!NOTE]
> [実行・操作方法](#実行・操作方法)の項目に示されているように，必要に応じてパラメータを修正してください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


<!-- マイルストーン -->
## マイルストーン

- [x] OSS
    - [x] ドキュメンテーションの充実
    - [x] [install.sh](install.sh)の更新

現時点のバッグや新規機能の依頼を確認するために[Issueページ][license-url] をご覧ください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


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

<p align="right">(<a href="#readme-top">上に戻る</a>)</p> -->


<!-- LICENSE -->
<!-- ## License

Distributed under the MIT License. See `LICENSE.txt` for more NOTErmation.

<p align="right">(<a href="#readme-top">上に戻る</a>)</p> -->


<!-- 参考文献 -->
## 参考文献

* [Azure Kinect DK](https://azure.microsoft.com/ja-jp/products/kinect-dk)
* [Azure Kinect SDK (K4A)](https://github.com/microsoft/Azure-Kinect-Sensor-SDK)
* [Azure Kinect ROS Driver](https://github.com/microsoft/Azure_Kinect_ROS_Driver)
* [Azure Kinect DK のドキュメント](https://learn.microsoft.com/ja-jp/azure/kinect-dk/)
* [ROS Noetic](http://wiki.ros.org/noetic)

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



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
