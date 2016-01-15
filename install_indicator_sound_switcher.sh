#!/bin/bash

set -e

echo
echo Installing indicator-sound-switcher
echo

apt-add-repository -y ppa:yktooo/ppa
apt-get update
apt-get -y install indicator-sound-switcher
