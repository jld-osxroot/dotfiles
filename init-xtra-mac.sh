
### New system setup jump start

# set colors in terminal
# open extras/Tomorrow-Night.terminal

# install Xcode from Apple Store
# run xcode and install command-line tools 

# download brew and install
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# system stuff
brew install ack ctags git pwgen wget pandoc s3cmd
brew install node

# setup vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim :BundleInstall

# install ms font pack
unzip extras/ms-font-pack.zip

# Python Setup use Anaconda
# https://store.continuum.io/cshop/anaconda/

# R			   : http://cran.r-project.org/bin/macosx/
# R Studio     : http://www.rstudio.com/


