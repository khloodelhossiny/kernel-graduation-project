# 🛰️ Network Traffic Analysis (Wireshark + Bash)

🎯 Overview

- This project analyzes network traffic captured with Wireshark using a Bash script.
- It extracts stats like total packets, protocols used, and top source/destination IPs, then prints a summary report.

⚙️ Steps

- Capture packets with Wireshark and save as network_traffic.pcap.
- Create a Bash script named analyze_traffic.sh.
- Run it to analyze the .pcap file and generate a summary.



🧠 Script Example
```
#!/bin/bash
# Analyze network traffic using tshark

read -p "Enter pcap file path: " pcap_file
echo "----- Network Traffic Analysis Report -----"

total=$(tshark -r "$pcap_file" | wc -l)
http=$(tshark -r "$pcap_file" -Y http | wc -l)
https=$(tshark -r "$pcap_file" -Y tls | wc -l)

echo "1. Total Packets: $total"
echo "2. Protocols:"
echo "   - HTTP: $http packets"
echo "   - HTTPS/TLS: $https packets"
echo ""
echo "3. Top 5 Source IPs:"
tshark -r "$pcap_file" -T fields -e ip.src | sort | uniq -c | sort -nr | head -5
echo ""
echo "4. Top 5 Destination IPs:"
tshark -r "$pcap_file" -T fields -e ip.dst | sort | uniq -c | sort -nr | head -5
echo "----- End of Report -----"
```

🧾 Example Output
```
----- Network Traffic Analysis Report -----
1. Total Packets: 1000
2. Protocols:
   - HTTP: 600 packets
   - HTTPS/TLS: 400 packets

3. Top 5 Source IPs:
   300 192.168.1.1
   200 192.168.1.2
   ...

4. Top 5 Destination IPs:
   400 10.0.0.1
   300 10.0.0.2
   ...
----- End of Report -----
```
