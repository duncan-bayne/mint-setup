#!/bin/bash
set -e

echo
echo Downloading and installing Emacs from source
echo

apt-get install -y libtiff-dev

rm -rf ~/mint_setup_tmp/emacs
mkdir ~/mint_setup_tmp/emacs
pushd ~/mint_setup_tmp/emacs
wget ftp://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
tar -xvf emacs-24.5.tar.gz
cd emacs-24.5
./configure
make
make install
popd
rm -rf ~/mint_setup_tmp/emacs
