#!/bin/bash

# New Mac system setup 

## initial setup script

UNAME=`uname`
cd $HOME

rm .profile .screenrc 
ln -s dotfiles/profile .profile
ln -s dotfiles/rcfiles/screenrc .screenrc
ln -s dotfiles/rcfiles/agignore .agignore
ln -s ~/Documents/Sync/pass-store .password-store

rm .vimrc 
ln -s dotfiles/vim-files/vimrc .vimrc
ln -s dotfiles/vim-files .vim


# install Xcode from Apple Store
# run xcode and install command-line tools 

# color scheme for terminal
# still requires to go in and fiddle a bit
# turn off bell, set as default
open $HOME/dotfiles/extras/Tomorrow-Night.terminal


# download brew and install
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# system stuff
brew install git pwgen wget pandoc s3cmd pass mtr the_silver_searcher


# Python Setup use Anaconda
# https://store.continuum.io/cshop/anaconda/

# R			   : http://cran.r-project.org/bin/macosx/
# R Studio     : http://www.rstudio.com/


