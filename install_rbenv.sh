#!/bin/bash

set -e

echo Install Ruby dependencies
sudo apt-get -y install libreadline6-dev libyaml-dev sqlite3 libgdbm-dev bison libffi-dev

pushd ~
rm -rf ~/.rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

# initialize rbenv so we can use it without restarting the shell
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

echo Installing Ruby 1.9.3 with rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 1.9.3-p327
rbenv global 1.9.3-p327
gem install bundler
rbenv rehash

popd

