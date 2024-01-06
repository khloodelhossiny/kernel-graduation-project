#!/bin/bash

# Bash Script to Analyze Network Traffic

# Input: Path to the Wireshark pcap file
echo "Please enter the path to the Wireshark pcap file:"
read pcap_file

# Function to extract information from the pcap file
analyze_traffic() {
    # Use tshark or similar commands for packet analysis.
    # Hint: Consider commands to count total packets, filter by protocols (HTTP, HTTPS/TLS),
    # extract IP addresses, and generate summary statistics.

    # Output analysis summary
    echo "----- Network Traffic Analysis Report -----"
    # Provide summary information based on your analysis
    # Hints: Total packets, protocols, top source, and destination IP addresses.

    total_packet=$(tshark -r $pcap_file -n | wc -l)

  
    echo "1. Total Packets: $total_packet"
    echo "--------------------------------------------------------"
    
    echo "2. Protocols:"
    http_packet=$(tshark -r $pcap_file -Y "http" | wc -l)

    https_packet=$(tshark -r $pcap_file -Y "tls.handshake.type == 1" | wc -l)

    echo "   - HTTP: $http_packet packets"

    echo "   - HTTPS/TLS: $https_packet packets"
    echo "--------------------------------------------------------"
   
   
    echo "3. Top 5 Source IP Addresses:"
    # Provide the top source IP addresses
    tshark -r $pcap_file -T fields -e ip.src | sort | uniq -c | sort -nr | head -n 5
    echo "--------------------------------------------------------"

    echo "4. Top 5 Destination IP Addresses:"
    # Provide the top destination IP addresses
    
    tshark -r $pcap_file -T fields -e ip.dst | sort | uniq -c | sort -nr | head -n 5

    echo "---------- End of Report ----------"
}

# Run the analysis function
analyze_traffic
