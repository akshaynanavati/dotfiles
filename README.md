# dotfiles

My configuration files for Mac OSX (and linux).

## Usage

- Run `./install.sh` to configure both the dotfiles and mac osx settings.
- Run `./_make_symlinks.sh` only to get the dotfiles.
- Run `./_osx_defaults.sh` only to get the osx configuratoin options.
- Run `./_install_gitconfig.sh` to install the gitconfig. The prompt will ask for your name and email.
  Note that this needs to be run anytime the template is updated.

Note, if you want to use the bash configurations provided in this repo,
you must add `source ~/.bash_profile_git` to your own bash config file.
