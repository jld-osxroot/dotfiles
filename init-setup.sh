#!/bin/bash

## initial setup script

UNAME=`uname`
cd $HOME

rm .profile .screenrc .remind .taskrc
ln -s dotfiles/profile .profile
ln -s dotfiles/rcfiles/screenrc .screenrc
ln -s dotfiles/rcfiles/remind .remind
ln -s dotfiles/rcfiles/taskrc .taskrc
ln -s ~/Documents/Sync/pass-store .password-store

rm .vimrc 
ln -s dotfiles/vim-files/vimrc .vimrc
ln -s dotfiles/vim-files .vim


## update & upgrade
sudo apt-get update
sudo apt-get -y upgrade

## double check we have these
sudo apt-get -y install aptitude subversion subversion-tools git sudo zip

echo "Setup Build and Misc Tools ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            sudo apt-get -y install build-essential automake autoconf2.13 autoconf-archive gnu-standards autoconf-doc libtool gettext
            sudo apt-get -y install linux-headers-`uname -r`
            sudo apt-get -y install curl wget ack-grep pwgen s3cmd dnsutils pandoc sysv-rc-conf htop ufw pass remind task
            break;;
        No )
            break;;
    esac
done


# data tools
echo "Setup Data Tools?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
			sudo apt-get -y install r-base-core r-base-dev r-cran-plyr r-cran-timeseries r-cran-ggplot2 gnuplot
			sudo apt-get -y install gfortran golang imagemagick graphicsmagick
			break;;
		No )
			break;;
	esac
done


# desktop install
echo "Setup Gnome Desktop "
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
			sudo apt-get -y install vim-gtk xclip gpick
			sudo apt-get -y install ttf-mscorefonts-installer
			cd /usr/share/fonts/truetype
			sudo unzip $HOME/dotfiles/extras/fonts.zip
			cd
			mkdir ~/tmp/
			cd ~/tmp/
			git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
			cd gnome-terminal-colors-solarized
			./install.sh
			break;;
		No )
			break;;
	esac
done


echo "Install Spotify (Debian)?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            sudo echo "deb http://repository.spotify.com stable non-free" >>/etc/apt/sources.list
            sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
            sudo apt-get update
            sudo apt-get -y install spotify-client
            break;;
        No )
            break;;
    esac
done


# web services
echo "LAMP Stack?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
			sudo apt-get -y install mysql-client mysql-server memcached apache2 
			sudo apt-get -y install php5 php5-cli php5-common php5-curl php5-dev php5-memcached php5-mysql php5-xcache php5-xdebug php5-mcrypt php5-json
			break;;
		No )
			break;;
	esac
done


echo "Setup TLP Power (Laptop)?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            # from: http://askubuntu.com/questions/285434/is-there-a-power-saving-application-similar-to-jupiter
            sudo add-apt-repository ppa:linrunner/tlp
            sudo apt-get update
            sudo apt-get -y install tp-smapi-dkms acpi-call-tools tlp tlp-rdw smartmontools ethtool
            break;;
		No )
			break;;
	esac
done

