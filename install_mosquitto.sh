#!/bin/sh

sudo apt update -y && sudo apt install mosquitto mosquitto-clients -y

sudo systemctl status mosquitto
