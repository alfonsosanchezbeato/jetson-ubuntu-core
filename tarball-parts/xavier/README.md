# Intructions for flashing Ubuntu Core 18 in Jetson AGX Xavier

Download and extract the 32.2.1 L4T release from nvidia:

```
wget https://developer.nvidia.com/embedded/dlc/r32-2-1_Release_v1.0/TX2-AGX/Tegra186_Linux_R32.2.1_aarch64.tbz2 \
     -O Tegra186_Linux_R32.2.1_aarch64.tbz2
tar xf Tegra186_Linux_R32.2.1_aarch64.tbz2
```

Extract the UC tarball inside the L4T directory and apply the
necessary patches:

```
cd Linux_for_Tegra
tar xvf <path_to_tarball>/core-18-jetson-xavier.tar.xz
patch -p1 < flash.sh.patch
patch -p1 < p2972-0000.conf.common.patch
patch -p1 < flash_t194_sdmmc.xml.patch
```

Then, put the device in [recovery mode](https://docs.nvidia.com/jetson/l4t/#page/Tegra%2520Linux%2520Driver%2520Package%2520Development%2520Guide%2Fflashing.html%23)
and flash it. The only difference with normal flashing is that you need
to use the `'-r'` flag to avoid creating a new system image:

`sudo ./flash.sh -r jetson-xavier mmcblk0p1`
