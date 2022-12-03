### Disable the built-in wifi module in a Raspberry Pi

Examaple use case, Pi and Kali Linux doing wifi "things".

In a terminal, open the following file:

```sudo nano /etc/modprobe.d/raspi-blacklist.conf```

Paste these two lines in it (the file is probably empty):

```blacklist brcmfmac```
```blacklist brcmutil```


Save and exit, ```CTRL+O, CTRL+X```

Reboot

The built-in wifi interface using ```brcmfmac``` for exaample on a Pi like wlan0 will be gone.

Any additional USB wifi card/dongle will now be the sole wifi card/dongle.

Can be confirmed using as an example, ```sudo airmon-ng```, driver ```rt2800usb``` or likewise visible, but no longer ```brcmfmac```.
