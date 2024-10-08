#!/bin/sh

sudo apt update -y && sudo apt install mosquitto mosquitto-clients -y

sudo apt-get install libmosquitto-dev

sudo systemctl status mosquitto

mkdir /home/nexus/mosquitto-config

echo "

listener 1886

max_connections -1

allow_anonymous true

" >> /home/nexus/mosquitto-config/nexus.conf

# mosquitto -c /home/nexus/mosquitto-config/nexus.conf -d
