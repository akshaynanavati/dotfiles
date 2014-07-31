dotfiles
========

My configuration files for Mac OSX.

Usage
---

-Run `source install.sh` to configure both the dotfiles and mac osx settings.

-Run `./_make_symlinks.sh` only to get the dotfiles.

-Run `./_osx_defaults.sh` only to get the osx configuratoin options.

Note, if you want to use the bash_rofile provided in this repo, you must add
`source ~/.bash_profile_git` to your own bash config file.

Vimrc Notes
---

I use the solarized colorscheme with iterm2. You can download iterm2 here:
http://iterm2.com/. If you do wish to use the solarized colorscheme with iterm2
as I do, go to `iterm -> Preferences -> Profiles -> Colors -> Load Presets -> Import`
and import `solarized_dark.itermcolors` from this repo to set up your colorscheme
correctly. If you do not wish to use solarized but you do wish to use my vimrc,
simply edit the vimrc, search for colorscheme, and change `colorscheme solarized` to
whichever colorscheme you prefer.
