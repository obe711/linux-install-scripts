#!/bin/sh
sudo apt update
sudo apt-get install libprotobuf-dev
sudo apt-get install libprotoc-dev
sudo apt-get install protobuf-compiler
sudo apt-get install pkg-config
sudo apt-get install autotools-dev
sudo apt-get install autoconf
sudo apt-get install automake
sudo apt-get install libtool
sudo apt install build-essential
sudo apt-get install cmake
sudo apt-get install libc6-dbg gdb valgrind 

sudo rm -rf /home/nexus/dev
mkdir /home/nexus/dev
cd /home/nexus/dev

git clone git@github.com:protobuf-c/protobuf-c.git
cd protobuf-c
sudo ./autogen.sh && sudo ./configure && sudo make && sudo make install