alias q="exit"

g() { [[ $# = 0 ]] && git status --short . || git $*; }

alias -- -='cd -' # actually means "-"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias wget='wget -c'

autoload -U zmv
alias zcp='zmv -C'
alias zln='zmv -L'

alias mk=make
alias rcp='rsync -vaP --delete'
alias rmirror='rsync -rtvu --delete'
alias gurl='curl --compressed'

alias y='xclip -selection clipboard -in'
alias p='xclip -selection clipboard -out'

alias ppath="printf \"%s\n\" $path"
alias pfpath="printf \"%s\n\" $fpath"

alias j="z"

take() {
  mkdir "$1" && cd "$1";
}; compdef take=mkdir

alias zman="man zshall"

if [ -x "$(command -v exa)" ]; then
    alias ls="exa -s type"
    alias l="exa -Fs type"
    alias ll="exa -ls type"
fi

# _dev is prefixed to make it always session 0 in list
alias t="tmux attach || tmux new -s _dev"
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias td="tmux new -d -s"
alias tl="tmux list-sessions"

alias ca="conda activate"

alias json="python -m json.tool"

ipdb() {
  ipython --pdb -c "%run $*"
}

palette() { local colors; for n in {000..255}; do colors+=("%F{$n}$n%f"); done; print -cP $colors; }

itplot() {
    if [ -z "$MPLBACKEND" ]; then
        export MPLBACKEND="module://itermplot"
        export ITERMPLOT="rv"  # dark mode
        echo "itermplot enabled (dark mode)"
    else
        unset MPLBACKEND
        unset ITERMPLOT
        echo "itermplot disabled"
    fi
}
