#!/bin/bash

set -e

echo Install Ruby dependencies
sudo apt-get -y install libreadline6-dev libyaml-dev sqlite3 libgdbm-dev bison libffi-dev

echo Install RVM
\curl -sSL https://get.rvm.io | bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm install ruby-2.3.0
rvm docs generate-ri
