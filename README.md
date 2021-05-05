# Device Tree for OnePlus 8/Pro aka Hotdog for TWRP
## Disclaimer - Unofficial TWRP!
These are personal test builds of mine. In no way do I hold responsibility if it/you messes up your device.
Proceed at your own risk.

### Note
Decryption does not currently work.

## Setup repo tool
Setup repo tool from here https://source.android.com/setup/develop#installing-repo

## Compile

Sync aosp_r29 manifest:

```
repo init --depth=1 -u https://android.googlesource.com/platform/manifest -b android-11.0.0_r29
```

Make a directory named local_manifest under .repo, and create a new manifest file, for example instantnoodle.xml
and then paste the following

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="github"
	fetch="https://github.com/" />

<project path="device/oneplus/instantnoodle"
	name="systemad/android_device_oneplus_instantnoodle"
	remote="github"
	revision="master" />
</manifest>
```
Also make a new manifest with content from here: https://del.dog/a11-twrp-extras-updated.txt

Sync the sources with

```
repo sync
```

To build, execute these commands in order

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch twrp_hotdog-eng
make -j16 adbd recoveryimage
```

To test it:

```
# To temporarily boot it
fastboot boot out/target/product/instantnoodle/recovery.img 

# Since 7T / Pro has a dedicated recovery partition, you can flash the recovery with
fastboot flash recovery recovery.img
```

##### Credits
- CaptainThrowback for original trees.
- mauronofrio for original trees
- TWRP team
