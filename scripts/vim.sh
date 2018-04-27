#!/bin/sh

cd "`dirname $0`/../vim"

./configure --enable-pythoninterp --enable-python3interp
make -j5
sudo make install

cd -
