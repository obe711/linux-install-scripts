#!/bin/sh

sudo apt update -y && sudo apt install mosquitto mosquitto-clients -y

sudo systemctl status mosquitto

mkdir /home/nexus/mosquitto-config

echo "

listener 1885

max_connections -1

allow_anonymous true

" >> /home/nexus/mosquitto-config/nexus.conf

mosquitto -c /home/nexus/mosquitto-config/nexus.conf -d
