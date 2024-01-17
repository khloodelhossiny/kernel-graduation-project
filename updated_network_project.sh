#!/bin/bash

# Bash Script to Analyze Network Traffic

# Function to extract information from the pcap file
analyze_traffic() {

    # Output analysis summary
    echo ""
    echo -e "\e[33m------- Network Traffic Analysis Report for $pcap_file file --------\e[0m"
    echo ""

    total_packet=$(tshark -r $pcap_file -n | wc -l)  

    echo "1. Total Packets: $total_packet"
    echo "--------------------------------------------------------"
    
    echo "2. Protocols:"
    http_packet=$(tshark -r $pcap_file -Y "http" | wc -l)

    https_packet=$(tshark -r $pcap_file -Y "tls.handshake.type == 1" | wc -l)

    echo "   - HTTP: $http_packet packets"
    echo "   - HTTPS/TLS: $https_packet packets"
    echo "--------------------------------------------------------"
   
    num_ips=$(tshark -r $pcap_file -T fields -e ip.src | sort -u | wc -l)  # this case : if we have less than 5 IPs
 
    echo "3. Top $num_ips Source IP Addresses:"
    # Provide the top source IP addresses    
    tshark -r $pcap_file -T fields -e ip.src | sort | uniq -c | sort -nr | awk '{print "   - " $2 ": " $1 " packets"}' | head -n 5
   
    echo "--------------------------------------------------------"
    
    echo "4. Top $num_ips Destination IP Addresses:"
    # Provide the top destination IP addresses 
    tshark -r $pcap_file -T fields -e ip.dst | sort | uniq -c | sort -nr | awk '{print "   - " $2 ": " $1 " packets"}' | head -n 5

    echo ""
    echo -e "\e[33m---------- End of Report ---------------------------- \e[0m"
    
}

input_pcap(){
    echo "Please enter the path to the Wireshark pcap file:"
    counter=0
    while [ $counter -lt 3 ];do
        
        read pcap_file
        if [ ! -f "$pcap_file" ]; then
            echo "File doesn't exist. Please try again."
        else
            clear
            # Run the analysis function
            analyze_traffic
            break
        fi
        ((counter++))
    done
}

# Input: Path to the Wireshark pcap file
input_pcap

