# Android device tree for Tablet Blackview MEGA 3

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
SoC     | Mediatek Helio G100 (MT6789) (6nm)
CPU     | Octa-core (2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55)
GPU     | Mali-G57 MC2
Memory  | 12 GB RAM
Shipped Android Version | Doke OS 4.1 (Android 15)
Storage | 256 GB
Battery | Li-Po 8800 mAh, non-removable
Display | 12.1-inch,1600х2560 FHD+ 2.4K Resolution; Dynamic 120Hz Refresh Rate
Camera  | Main:50 MP Sony IMX362;Front:8.0MP Samsung S5K4H7;Sub:13.0MP GalaxyCore GC08A8
Demensions | 278.5x180.5x7.4 mm
Weight  | 555 g

### Device picture

https://www.devicespecifications.com/en/model/103563ce

## Features

# Building
Works:
- [X] ADB
- [X] Decryption
- [X] Display
- [X] Fasbootd
- [X] Flashing
- [X] MTP
- [X] Sideload
- [X] USB OTG
- [X] SDCard
- [ ] Touch
- [X] Flashlight
- [ ] Vibrator

## Building
```bash
source build/envsetup.sh
lunch twrp_MEGA_3-eng
fox_14.1 and twrp_14.1
lunch twrp_MEGA_3-ap2a-eng
mka vendorbootimage
```

## To use it:

```
fastboot flash vendor_boot vendor_boot.img

```
### Thanks to

@Serguc
