# TWRP Device configuration for Motorola Edge 20

The Motorola Edge 20 (codenamed _"berlin"_) are high-end smartphones from Motorola.

## Device specifications

| Feature                 | Specification                                                              |
| :---------------------- | :--------------------------------                                          |
| CPU                     | Octa-core Kryo 670 1 x 2.4 GHz + 3 x 2.2 GHz & 4 x 1.9 GHz                 |
| Chipset                 | Qualcomm SM7325 Snapdragon 778G 5G                                         |
| GPU                     | Adreno 642L                                                                |
| Memory                  | 8 GB LPDDR4X                                                               |
| Shipped Software        | Android 11                                                                 |
| Storage                 | 128 GB / 256 GB                                                            |
| Battery                 | 4000 mAh                                                                   |
| Dimensions              | 163 mm (6.42 in) (h) 76 mm (2.99 in) (w) 97 mm (0.28 in) (d)               |
| Display                 | 170.18 mm (6.7 in) 1080x2400 (385 PPI) OLED                                |
| Rear Camera             | 108 MP, f/1.9, (wide), 1/1.52", 0.7µm, PDAF                                |
|                         | 8 MP, f/2.4, 79mm (telephoto), 1.0µm, 3x optical zoom, PDAF, OIS           |
|                         | 16 MP, f/2.2, 17mm, 119˚ (ultrawide), 1/3.06", 1.0µm, AF                   |
| Front Camera            | 32 MP, f/2.3, (wide), 0.7µm                                                |
| Release Date            | July 2021                                                                  |

## Device picture

![Device Picture](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-edge-20-2.jpg)

## Kernel

Prebuilt kernel from stock ROM user-12-S1RGS32.53-18-22-11 b6e7c-release-keys

## Compile

First repo init the twrp-12.1 tree (and necessary qcom dependencies):

```
mkdir ~/android/twrp-12.1
cd ~/android/twrp-12.1
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
mkdir -p .repo/local_manifests
```

Then add to a local manifest (if you don't have .repo/local_manifest then make that directory and make a blank file and name it something like twrp.xml):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="osm0sis/twrp_abtemplate" path="bootable/recovery/installer" remote="github" revision="master"/>
  <project name="android_device_motorola_berlin" path="device/motorola/berlin" remote="TeamWin" revision="android-12.1"/>
</manifest>
```

Now you can sync your source:

```
repo sync
```

To automatically make the TWRP installer zip, you need to import this commit in the build/make path: https://gerrit.twrp.me/c/android_build/+/5445

Finally execute these:

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch twrp_dubai-eng
make adbd bootimage
```