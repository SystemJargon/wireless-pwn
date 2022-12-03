### Methods

[Air-NG method, commands to using air-ng, mdk clone, de-auth, air examples dump/mon/crack](https://github.com/SystemJargon/wireless-pwn/tree/main/air-ng-method)

[Hashcat and HcxDumpTool Method](https://github.com/SystemJargon/wireless-pwn/tree/main/hashcat-hcxdumptool-method)

----

### Other resources:

[AirCrack-ng on Github](https://github.com/aircrack-ng)


### MAC changer (if needed)

```
ifconfig wlan0 down
macchanger -r wlan0
ifconfig wlan0 up
```

See my [mac-changer repo](https://github.com/SystemJargon/mac-changer) for more info.

----

### sporadic-clone-ap

```mdk3 wlan0 b -f ssid_list.txt  -g -a -c 6```

```-c``` being channel, can not specify for mixed results.

