#!/bin/sh
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP

# Allow all traffic as long its on these ports

sudo iptables -A OUTPUT -m owner --uid-owner 1001  --jump ACCEPT 
sudo iptables -A OUTPUT -m owner --uid-owner 1002  --jump ACCEPT 
sudo iptables -A OUTPUT -o tun0 -m owner --uid-owner 0 --verbose --jump ACCEPT #root user
sudo iptables -A OUTPUT -o tun0 -m owner --uid-owner 1000 --verbose --jump ACCEPT

# Allow connecting to vpn
grep -P --only-matching --no-filename "(?<=remote\s).*\s" *.ovpn | while read ip; do
    iptables -A OUTPUT -p tcp --match multiport --dport 80,443,4569,1194,5060,51820,7770,8443 -j ACCEPT -d $ip;
done

# Allowing lo as its harmless.

sudo iptables -A OUTPUT -o lo  --jump ACCEPT --verbose
sudo iptables -A INPUT -i lo --jump ACCEPT --verbose

