#!/bin/bash

if ! xcode-select -p
then
    echo 'You must install Xcode and Command line tools before continuing'
    exit 1
fi

./_make_symlinks.sh
./_install_gitconfig.sh
./_osx_defaults.sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

brew install the_silver_searcher
brew install vim
brew install fd

source ~/.bash_profile

echo 'Do not forget to open vim and run :PlugInstall to get vim plugins'
