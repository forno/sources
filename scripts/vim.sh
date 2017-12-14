#!/bin/sh

cd ../vim
./configure --enable-pythoninterp --enable-python3interp
make -j5
sudo make install
cd -
