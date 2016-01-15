#!/bin/bash
set -e

echo Installing Sublime Text 3

add-apt-repository -y ppa:webupd8team/sublime-text-3
apt-get update
apt-get install sublime-text-installer
