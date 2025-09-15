<a name="readme-top"></a>

[JA](README.md) | [EN](README.en.md)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

# Azure Kinect ROS Driver

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
    <li><a href="#実行操作方法">実行・操作方法</a>
      <ul>
      </ul>
    </li>
    <li><a href="#パラメータ">パラメータ</a>
    <li><a href="#マイルストーン">マイルストーン</a></li>
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <li><a href="#参考文献">参考文献</a></li>
  </ol>
</details>



<!-- レポジトリの概要 -->
## 概要

Microsoftが作成した[Azure Kinect ROS Driver](https://github.com/microsoft/Azure_Kinect_ROS_Driver)を基に，`ROS2 humble`にも対応させたレポジトリです．
さらに，実際のカメラの特性に忠実で，更新された`URDF`ファイルをサポートしています．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>



<!-- 環境構築 -->
## 環境構築

ここで，本レポジトリのセットアップ方法について説明します．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


### 環境条件

| System  | Version |
| ------------- | ------------- |
| Ubuntu | 22.04 (Jammy Jellyfish) |
| ROS | Humble Hawksbill |
| Python | 3.0~ |

### インストール方法
1. ROS2の`src`フォルダに移動します．
   ```sh
   cd　~/colcon_ws/src/
   ```
2. 本レポジトリをcloneします．
   ```sh
   git clone -b humble-devel https://github.com/TeamSOBITS/azure_kinect_ros_driver.git
   ```
3. レポジトリの中へ移動します．
   ```sh
   cd azure_kinect_ros_driver
   ```
4. 依存パッケージをインストールします．
    ```sh
    bash install.sh
    ```
5. パッケージをコンパイルします．
   ```sh
   cd ~/colcon_ws/
   colcon build --symlink-install
   ```

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


<!-- 実行・操作方法 -->
## 実行・操作方法

カメラ単体で使用する場合は，[driver.launch.py](launch/driver.launch.py)を次の手順で実行してください．


1. 必要に応じて[driver.launch.py](launch/driver.launch.py)のパラメータを更新してください．

> [!NOTE]
> 使用したい機能に応じて，`true`か`false`かに書き換えてください．

2. [driver.launch.py](launch/driver.launch.py)というlaunchファイルを実行します．
   ```sh
   $ ros2 launch azure_kinect_ros_driver driver.launch.py
   ```
3. その後rqtやrvizを起動し，topic名を合わせましょう．

> [!NOTE]
> カメラのパラメータを変更する場合は，[usage.md](docs/usage.md)を参照してください．

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>

## パラメータ
[driver.launch.py](launch/driver.launch.py)内で設定可能なパラメータは以下のとおりです.

| パラメータ名 | 説明 | デフォルト値 |
|-------------|------|--------------|
| `depth_enabled` | 深度カメラを有効にするか | `true` |
| `color_enabled` | カラーカメラを有効にするか | `true` |
| `point_cloud` | 深度データから点群を生成するか | `true` |
| `rgb_point_cloud` | 点群をカラー化するか | `true` |
| `point_cloud_in_depth_frame` | 点群を深度カメラ座標系で生成するか | `false` |
| `depth_mode` | 深度カメラのモード。選択肢: `NFOV_UNBINNED`, `NFOV_2X2BINNED`, `WFOV_UNBINNED`, `WFOV_2X2BINNED`, `PASSIVE_IR` | `WFOV_UNBINNED` |
| `depth_unit` | 深度の単位: `16UC1` (mm), `32FC1` (m, float) | `16UC1` |
| `color_format` | カラーカメラ出力形式: `bgra`, `jpeg` | `bgra` |
| `color_resolution` | カラーカメラ解像度。選択肢: `720P`, `1080P`, `1440P`, `1536P`, `2160P`, `3072P` | `720P` |
| `fps` | フレームレート。選択肢: `5`, `15`, `30` | `5` |
| `body_tracking_smoothing_factor` | ボディトラッキングのスムージング係数（0〜1） | `0.0` |
| `imu_rate_target` | IMU メッセージの出力レート。0 = フルレート (1.6kHz) | `0` |
| `wired_sync_mode` | 有線同期モード。`0=OFF`, `1=MASTER`, `2=SUBORDINATE` | `0` |

<p align="right">(<a href="#readme-top">上に戻る</a>)</p>


> [!NOTE]
> `Azure Kinect`が認識されない場合があります．問題が直せない場合は，[ライトの意味](https://learn.microsoft.com/ja-jp/azure/kinect-dk/hardware-specification#what-does-the-light-mean)を参照にして，USBの接続を確認してみてください．

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
