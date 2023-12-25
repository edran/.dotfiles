set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -gx CACHEDIR $HOME/.cache
set -gx CONFIGDIR $HOME/.config
set -gx LOCALDIR $HOME/.local

set -gx ORGDIR "$HOME/mcc"
set -gx LABDIR "$HOME/lab"
set -gx DOTSREPO "$HOME/.dotfiles"

# ASPELL config
set -gx ASPELL_CONF "home-dir $HOME/.config/aspell/"

fish_add_path -g "$HOME/bin"
fish_add_path -g "$HOME/.emacs.d/bin"
fish_add_path -g "$HOME/.local/bin"

