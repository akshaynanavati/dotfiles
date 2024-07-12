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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ ! -d ~/.scm_breeze ]; then
    echo 'installing scm breeze...';
    git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze;
    ~/.scm_breeze/install.sh;
fi

if [! -d ~/.fzf ]; then
    echo 'installing fzf...'
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf;
    ~/.fzf/install;
fi

echo 'Do not forget to open vim and run :PlugInstall to get vim plugins'
