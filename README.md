# Device Tree for 8/Pro (instantnoodle) for TWRP

Make a directory named local_manifest under .repo, and create a new manifest file, for example instantnoodle.xml
and then paste the following

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="github"
	fetch="https://github.com/" />

<project path="device/oneplus/instantnoodle"
	name="infectedmushi/twrp_device_oneplus_instantnoodle"
	remote="github"
	revision="android-13" />
</manifest>
```
Sync the sources with

```
repo sync
```

To build, execute these commands in order

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch twrp_instantnoodle-eng
make -j16 adbd recoveryimage
```

To test it:

```
# To temporarily boot it
fastboot boot out/target/product/instantnoodle/recovery.img 

# Since 8 / Pro has a seperate recovery partition, you can flash the recovery with
fastboot flash recovery recovery.img
```

