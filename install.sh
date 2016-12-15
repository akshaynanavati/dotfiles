#!/bin/bash

git submodule update --init
./_make_symlinks.sh
~/.scm_breeze/install.sh
./_osx_defaults.sh
source ~/.bash_profile
