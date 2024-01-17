### The project allows users to input a pcap file, providing them with three attempts. It incorporates handling for two specific cases:

      1. File Non-Existence:
            If the specified file does not exist, the system provides feedback to the user, indicating the absence of the file.
      2. Invalid Pcap File:
            In the event that the entered file is not a valid pcap file, the system alerts the user about the invalid format,
            ensuring that only valid pcap files are accepted for further processing.

### If the number of IP addresses is less than 5, it will display only the count of those addresses


#### 🗒️ 🗒️ 🗒️ 🗒️My output:
```txt
------- Network Traffic Analysis Report for two.pcap file --------

1. Total Packets: 1268
--------------------------------------------------
2. Protocols:
   - HTTP: 0 packets
   - HTTPS/TLS: 19 packets
--------------------------------------------------
3. Top 34 Source IP Addresses:
   - 192.168.1.4: 587 packets
   - 104.26.8.101: 289 packets
   - 172.217.18.232: 82 packets
   - 142.250.200.195: 52 packets
   - 192.168.1.1: 30 packets
--------------------------------------------------
4. Top 34 Destination IP Addresses:
   - 192.168.1.4: 679 packets
   - 104.26.8.101: 251 packets
   - 172.217.18.232: 45 packets
   - 142.250.200.195: 38 packets
   - 192.168.1.1: 34 packets

---------- End of Report -------------------------- 

```

