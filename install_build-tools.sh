#!/bin/sh
sudo apt update
sudo apt-get install -y libprotobuf-dev
sudo apt-get install -y libprotoc-dev
sudo apt-get install -y protobuf-compiler
sudo apt-get install -y pkg-config
sudo apt-get install -y autotools-dev
sudo apt-get install -y autoconf
sudo apt-get install -y automake
sudo apt-get install -y libtool
sudo apt install -y build-essential
sudo apt-get install -y cmake
sudo apt-get install -y libc6-dbg gdb valgrind 

sudo rm -rf /home/nexus/dev
mkdir /home/nexus/dev
cd /home/nexus/dev

# git clone git@github.com:protobuf-c/protobuf-c.git
git clone git@github.com-protobuf-c:obe711/protobuf-c.git
cd protobuf-c
sudo ./autogen.sh && sudo ./configure && sudo make && sudo make install
