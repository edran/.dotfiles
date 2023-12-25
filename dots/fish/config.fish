if status --is-login
  source (status dirname)/login.fish
end

if status --is-interactive
  for file in (status dirname)/interactive/*.fish
    source $file
  end
end