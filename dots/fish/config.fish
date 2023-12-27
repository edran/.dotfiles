if status --is-login
  source (status dirname)/login.fish
end

if status --is-interactive
  for file in (status dirname)/interactive/*.fish
    source $file
  end

  zoxide init fish | source

  if set -q ZELLIJ
  else
    zellij attach -c main
  end

  abbr --add zj 'zellij'
end
