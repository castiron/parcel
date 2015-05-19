#!/bin/bash

# Setup structure
mkdir ~/nodejs
cd ~/nodejs

wget http://nodejs.org/dist/v0.12.3/node-v0.12.3.tar.gz
tar -xvf node-v0.12.3.tar.gz
cd node-v0.12.3
./configure
make
sudo checkinstall --install=no