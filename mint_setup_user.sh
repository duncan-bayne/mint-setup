#!/bin/bash
set -e

echo Linking custom X and WM config
if [ ! -f ~/.xinitrc      ]; then ln -s $(pwd)/conf/x/xinitrc ~/.xinitrc                      ; fi
if [ ! -f ~/.Xresources   ]; then ln -s $(pwd)/conf/x/Xresources ~/.Xresources                ; fi
if [ ! -f ~/.stumpwmrc    ]; then ln -s $(pwd)/conf/stumpwm/stumpwmrc ~/.stumpwmrc            ; fi
if [ ! -f ~/.tmux.conf    ]; then ln -s $(pwd)/conf/tmux/tmux.conf ~/.tmux.conf               ; fi
if [ ! -f ~/.xscreensaver ]; then ln -s $(pwd)/conf/xscreensaver/xscreensaver ~/.xscreensaver ; fi

if grep -q "037b7c29-5804-43e2-8054-d1ebfb0f3293" ~/.bashrc ;
then
    echo Bash confugration extras already added to ~/.bashrc.
else
    echo Adding custom Bash setup to ~/.bashrc
    if [ ! -d ~/bin ]; then mkdir ~/bin ; fi
    echo >> ~/.bashrc
    echo \# Personal Bash configuration extras, added by ubuntu_setup.sh >> ~/.bashrc
    echo \# 037b7c29-5804-43e2-8054-d1ebfb0f3293 >> ~/.bashrc
    echo . $(pwd)/conf/bash/bash_extras.sh >> ~/.bashrc
    echo >> ~/.bashrc
fi

if grep -q "48ff9575-b263-4dc8-9912-6e5669dd1448" ~/.bash_profile ;
then
    echo Bash confugration extras already added to ~/.bash_profile.
else
    echo Adding custom Bash setup to ~/.bash_profile
    if [ ! -d ~/bin ]; then mkdir ~/bin ; fi
    echo >> ~/.bashrc
    echo \# Personal Bash configuration extras, added by ubuntu_setup.sh >> ~/.bash_profile
    echo \# 48ff9575-b263-4dc8-9912-6e5669dd1448 >> ~/.bash_profile
    echo . $(pwd)/conf/bash/bash_extras.sh >> ~/.bash_profile
    echo >> ~/.bash_profile
fi

echo Setting up personal binary path
if [ ! -d ~/bin              ]; then mkdir ~/bin                                                              ; fi
if [ ! -f ~/bin/both         ]; then ln -s $(pwd)/conf/bin/both                            ~/bin/both         ; fi
if [ ! -f ~/bin/dp1          ]; then ln -s $(pwd)/conf/bin/dp1                             ~/bin/dp1          ; fi
if [ ! -f ~/bin/gsa          ]; then ln -s $(pwd)/conf/bin/gsa                             ~/bin/gsa          ; fi
if [ ! -f ~/bin/hdmi1        ]; then ln -s $(pwd)/conf/bin/hdmi1                           ~/bin/hdmi1	      ; fi
if [ ! -f ~/bin/lock_dvd     ]; then ln -s $(pwd)/conf/bin/lock_dvd                        ~/bin/lock_dvd     ; fi
if [ ! -f ~/bin/lvds1        ]; then ln -s $(pwd)/conf/bin/lvds1                           ~/bin/lvds1        ; fi
if [ ! -f ~/bin/swapcaps_mac ]; then ln -s $(pwd)/conf/bin/swapcaps_mac                    ~/bin/swapcaps_mac ; fi
if [ ! -f ~/bin/swapcaps     ]; then ln -s $(pwd)/conf/bin/swapcaps                        ~/bin/swapcaps     ; fi
if [ ! -f ~/bin/unlock_dvd   ]; then ln -s $(pwd)/conf/bin/unlock_dvd                      ~/bin/unlock_dvd   ; fi
if [ ! -f ~/bin/rdoc-all     ]; then ln -s $(pwd)/conf/bin/rdoc-all                        ~/bin/rdoc-all     ; fi

echo Getting WineTricks for future use
if [ -f ~/bin/winetricks.sh ]; then rm -f ~/bin/winetricks.sh ; fi
wget http://www.kegel.com/wine/winetricks
mv $(pwd)/winetricks ~/bin/winetricks.sh
chmod a+x ~/bin/winetricks.sh

./install_rvm.sh

echo Configuring Gnome to be less intrusive
gconftool-2 -s -t bool /apps/nautilus/preferences/show_desktop false
gconftool-2 -s -t bool /desktop/gnome/background/draw_background false

echo Installing QuickLisp
curl -O http://beta.quicklisp.org/quicklisp.lisp
if [ ! -d ~/quicklisp ]; then sbcl --load quicklisp.lisp --eval "(progn (quicklisp-quickstart:install)(quit))" ; fi

echo Configuring RSense
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
ruby /opt/rsense-0.3/etc/config.rb > ~/.rsense

echo Configuring Sublime
if [ ! -d ~/.config/sublime-text-3 ]; then ln -s $(pwd)/conf/sublime-text-3 ~/.config/sublime-text-3; fi

echo Configuring Terminator
if [ ! -d ~/.config/terminator ]; then ln -s $(pwd)/conf/terminator ~/.config/terminator; fi

echo Configuring Git
git config --global push.default simple

