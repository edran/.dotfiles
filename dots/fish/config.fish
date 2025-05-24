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
fish_add_path -g "$HOME/.config/emacs/bin"
fish_add_path -g "$HOME/.local/bin"

if status --is-interactive
  for file in (status dirname)/interactive/*.fish
    if test (uname) != "Darwin"
      # We don't want to source macos.fish if we are not on a mac.
      if string match -q "*/macos.fish" $file
        continue
      end
    end

    source $file
  end

  if command -v zoxide >/dev/null 2>&1
     zoxide init fish | source
  end

  abbr --add t 'zellij'
  abbr --add ta 'zellij attach -c main'

  if command -v direnv >/dev/null 2>&1
    direnv hook fish | source
  end

  if test -f "$HOME/.private.fish"
    source "$HOME/.private.fish"
  end

  starship init fish | source
end
