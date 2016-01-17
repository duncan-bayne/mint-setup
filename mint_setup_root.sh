#!/bin/bash
set -e

rm -rf ~/mint_setup_tmp
mkdir ~/mint_setup_tmp

echo
echo Update and upgrade from all repositories
apt-get update -y
apt-get upgrade -y

echo
echo Upgrading the kernel
apt-get -y install linux-generic-lts-vivid


echo
echo Install miscellaneous stuff
apt-get -y install \
        acidrip \
        audacity \
        autoconf \
        automake \
        blueman \
        build-essential \
        ccrypt \
        checkinstall \
        chromium-browser \
        cinnamon-screensaver \
        clamav \
        clamav-freshclam \
        clamtk \
        curl \
        dia \
        dosbox \
        ec2-api-tools \
        eclipse \
        editorconfig \
        fortune \
        frotz \
        g++ \
        geeqie \
        gettext \
        gimp \
        git-core \
        gitg \
        gnome-rdp \
        gnutls-bin \
        gparted \
        gtk-recordmydesktop \
        hfsprogs \
        htop \
        inform \
        inotify-tools \
        irssi \
        k3b \
        lame \
        latex2html \
        libav-tools \
        libfaac-dev \
        libgif-dev \
        libgtk2.0-dev \
        libjpeg-dev \
        libncurses-dev \
        libnotify-bin \
        libopencore-amrnb-dev \
        libpng-dev \
        libpq-dev \
        libreadline6-dev \
        libsqlite3-dev \
        libssl-dev \
        libtheora-dev \
        libtiff-dev \
        libtool \
        libusb-dev \
        libvorbis-dev \
        libx11-dev \
        libxine1-ffmpeg \
        libxpm-dev \
        libxslt-dev \
        lynx \
        lyx \
        markdown \
        mercurial \
        nautilus \
        nemo \
        net-tools \
        notify-osd \
        openssh-server \
        pdftk \
        php5-cli \
        php5-curl \
        pinta \
        postgresql \
        pwgen \
        python-pip \
        racket \
        rdesktop \
        sbcl \
        skype \
        shtool \
        subversion \
        terminator \
        texinfo \
        tmux \
        tofrodos \
        tree \
        unison \
        unison-gtk \
        usb-creator-gtk \
        vice \
        vim \
        wine \
        wireshark \
        xbacklight \
        xclip \
        xsane \
        xscreensaver \
        xscreensaver-gl \
        xtightvncviewer \
        zsh

echo
echo Configure VICE
cp -R $(pwd)/conf/vice/* /usr/lib/vice -R

echo
echo Configuring swapcaps on resume
rm -f /etc/pm/sleep.d/swapcaps
ln -s $(pwd)/conf/bin/swapcaps /etc/pm/sleep.d/swapcaps
chmod a+x /etc/pm/sleep.d/swapcaps

./install_firefox.sh
./install_stumpwm.sh
./install_spotify.sh
./install_sublime.sh
./install_emacs.sh
./install_rsense.sh
./install_go.sh
./install_mac_kb.sh
./install_virtualbox.sh
./install_indicator_sound_switcher.sh
./install_clojure.sh

rm -rf ~/mint_setup_tmp
