# Ubuntu Core for Jetson TX1

This repository contains scripts to create a tarball with all what is
needed to flash Ubuntu Core 18 in a Jetson TX1 device.

## Build instructions

First, you will need to build the kernel and gadget snaps for the
device.  For that, clone the following repos and follow the
instructions in the respective README.md files:

<https://github.com/alfonsosanchezbeato/jetson-kernel-snap>  
<https://github.com/alfonsosanchezbeato/jetson-gadget-snap>

Once you have created the snaps, you can create an installation tarball
by running

`./build-core.sh tx1 <snap_account_id> <gadget_snap_file> <kernel_snap_file> [key_name]`

The snap account id can be found in your account details in
<https://dashboard.snapcraft.io>. You will need an Ubuntu One account
for this. You will also need a key registered with
[`snapcraft`](https://docs.snapcraft.io/snapcraft-overview/8940) to be
able to create a model for the device. The key name parameter is
necessary only if different from `default`.

After building, you will find a file named
`out-tx1/core-18-jetson-tx1.tar.xz` that contains instructions and all
needed files to flash UC18 into the device.

You can also download the latest tarball from the [releases tab](
https://github.com/alfonsosanchezbeato/jetson-ubuntu-core/releases).
