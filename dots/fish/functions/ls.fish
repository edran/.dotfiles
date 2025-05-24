function ls --description 'Use eza instead of ls'
  eza -a --icons --no-user --no-time $argv
end

function l --description 'Use eza instead of ls'
  eza -als type --icons --no-user --no-time $arg
end
