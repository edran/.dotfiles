if status --is-login
  source (status dirname)/login.fish
end

if status --is-interactive
  for file in (status dirname)/interactive/*.fish
    source $file
  end

  zoxide init fish | source

  abbr --add zj 'zellij'
  abbr --add za 'zellij attach -c main'

  if set -q ZELLIJ
  else
    zellij attach -c main
  end
end
