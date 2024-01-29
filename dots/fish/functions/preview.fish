function preview --description 'Recursively preview files in DIR'
  fzf --preview "bat --color=always {}" $argv
end
