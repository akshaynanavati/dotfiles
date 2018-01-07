#!/bin/bash

git submodule update --init
./_make_symlinks.sh
./_install_gitconfig.sh
~/.scm_breeze/install.sh
~/.fzf/install
./_osx_defaults.sh
brew install the_silver_searcher
source ~/.bash_profile
