# Intructions for flashing Ubuntu Core 18 in Jetson Nano

You simply need to copy into the SD card from your computer:

```
sudo sh -c 'cat jetson.img > /dev/<SD_card_device>'
sync
```

Then, insert the SD card into the device and boot. Done!
