# Intructions for flashing Ubuntu Core 18 in Jetson TX1

Download and extract the 28.2.0 L4T release from nvidia:

```
wget https://developer.nvidia.com/embedded/dlc/l4t-jetson-tx1-driver-package-28-2-ga \
     -O Tegra210_Linux_R28.2.0_aarch64.tbz2
tar xf Tegra210_Linux_R28.2.0_aarch64.tbz2
```

Extract the UC tarball inside the L4T directory and apply the
necessary patches:

```
cd Linux_for_Tegra
tar xvf <path_to_tarball>/core-18-jetson-tx1.tar.xz
patch < p2371-2180-devkit.conf.patch
patch < gnu_linux_tegraboot_emmc_full.xml.patch
```

Then, put the device in [recovery mode](https://docs.nvidia.com/jetson/archives/l4t-archived/l4t-282/index.html#page/Tegra%2520Linux%2520Driver%2520Package%2520Development%2520Guide%2Fflashing.html)
and flash it. The only difference with normal flashing is that you need
to use the `'-r'` flag to avoid creating a new system image:

`sudo ./flash.sh -r jetson-tx1 mmcblk0p1`
