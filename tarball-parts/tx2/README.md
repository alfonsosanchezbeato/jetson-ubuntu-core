# Intructions for flashing Ubuntu Core 18 in Jetson TX2

Download and extract the 32.1 L4T release from nvidia:

```
wget https://developer.nvidia.com/embedded/dlc/l4t-jetson-driver-package-32-1-JAX-TX2 \
     -O JAX-TX2-Jetson_Linux_R32.1.0_aarch64.tbz2
tar xf JAX-TX2-Jetson_Linux_R32.1.0_aarch64.tbz2
```

Extract the UC tarball inside the L4T directory and apply the
necessary patches:

```
cd Linux_for_Tegra
tar xvf <path_to_tarball>/core-18-jetson-tx2.tar.xz
patch -p1 < p2771-0000.conf.common.patch
patch -p1 < flash_l4t_t186.xml.patch
```

Then, put the device in [recovery mode](https://docs.nvidia.com/jetson/archives/l4t-archived/l4t-321/index.html#page/Tegra%2520Linux%2520Driver%2520Package%2520Development%2520Guide%2Fflashing.html)
and flash it. The only difference with normal flashing is that you need
to use the `'-r'` flag to avoid creating a new system image:

`sudo ./flash.sh -r jetson-tx2 mmcblk0p1`
