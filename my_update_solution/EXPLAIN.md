### The project allows users to input a pcap file, providing them with three attempts. It incorporates handling for two specific cases:

      1. File Non-Existence:
            If the specified file does not exist, the system provides feedback to the user, indicating the absence of the file.
      2. Invalid Pcap File:
            In the event that the entered file is not a valid pcap file, the system alerts the user about the invalid format, ensuring that only valid pcap files are accepted for further processing.

### If the number of IP addresses is less than 5, it will display only the count of those addresses


#### 🗒️ 🗒️ 🗒️ 🗒️My output:
```txt
------- Network Traffic Analysis Report for test2.pcap file ----------

1. Total Packets: 24
--------------------------------------------------------
2. Protocols:
   - HTTP: 0 packets
   - HTTPS/TLS: 0 packets
--------------------------------------------------------
3. Top 3 Source IP Addresses:
   - 92.123.48.97: 14 packets
   - 192.168.1.4: 9 packets
   - 34.202.253.140: 1 packets
--------------------------------------------------------
4. Top 3 Destination IP Addresses:
   - 192.168.1.4: 15 packets
   - 92.123.48.97: 8 packets
   - 34.202.253.140: 1 packets

---------- End of Report ---------------------------- 

```

