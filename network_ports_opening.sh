#!/bin/bash

#firewall
sudo systemctl stop ufw
sudo systemctl disable ufw

#ports
sudo ufw allow from 192.168.56.0/24 to any port 6443
sudo ufw allow from 192.168.56.0/24 to any port 2379:2380 proto tcp
sudo ufw allow from 192.168.56.0/24 to any port 10250 proto tcp

sudo ufw enable

