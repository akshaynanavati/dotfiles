#!/bin/bash

if ! xcode-select -p
then
    echo 'You must install Xcode and Command line tools before continuing'
    exit 1
fi

./_make_symlinks.sh
./_install_gitconfig.sh
./_osx_defaults.sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

brew install vim
brew install fd
brew install cmake
brew install gcc@7

source ~/.bash_profile

echo 'Do not forget to open vim and run :PlugInstall to get vim plugins'
echo 'Add `source ~/.bash_profile_git` to your .bashrc or .bash_profile'
