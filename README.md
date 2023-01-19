# Device Tree for OP8 (oneplus8) for TWRP

## Setup repo tool
Setup repo tool from here https://source.android.com/setup/develop#installing-repo

##Sync TWRP manifest:

```
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1

```
## Make a directory named local_manifest under .repo, and create a new manifest file, for example local_manifests.xml and then paste the following

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project path="device/oneplus/oneplus8" name="infectedmushi/twrp_device_oneplus_oneplus8" remote="github" revision="android-13" />
</manifest>
```

## Sync the sources with

```
repo sync -j$(nproc --all)
```

## To compile Recovery, execute this command:

```
. build/envsetup.sh; export ALLOW_MISSING_DEPENDENCIES=true; export LC_ALL=C; lunch twrp_oneplus8-eng; make -j$(nproc --all) adbd recoveryimage
```

## To test it:

```
# To temporarily boot it
fastboot boot out/target/product/oneplus8/recovery.img 

# Since OP8 has a separate recovery partition, you can flash the recovery with
fastboot flash recovery recovery.img
```

Kernel: https://github.com/oneplusoss/android_kernel_oneplus_sm8250
