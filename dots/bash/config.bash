shopt -s autocd                     # no explanation needed

# Globbing
shopt -s dotglob                    # glob hidden files too
shopt -s nocaseglob                 # make glob case-insensitive

# Completion
shopt -s cdspell                    # spellcheck cd
shopt -s dirspell                   # correct dirnames
shopt -s no_empty_cmd_completion    # don't complete on empty prompt line

# History
shopt -s histappend                 # append history instead of overwriting it
