DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KEY_MAP_CONFIG="Default (OSX).sublime-keymap"
PACKAGES="Package Control.sublime-settings"
PREFERENCES="Preferences.sublime-settings"

SUBL_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

if [ ! -d "$SUBL_DIR" ]; then
  mkdir -p "$SUBL_DIR"
fi

ln -s "$DOTFILE_DIR/sublime/$KEY_MAP_CONFIG" "$SUBL_DIR/$KEY_MAP_CONFIG"
ln -s "$DOTFILE_DIR/sublime/$PACKAGES" "$SUBL_DIR/$PACKAGES"
ln -s "$DOTFILE_DIR/sublime/$PREFERENCES" "$SUBL_DIR/$PREFERENCES"
