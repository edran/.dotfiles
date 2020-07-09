alias q=exit

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

alias j="z"
alias v='f -e vim' # quick opening files with vim

take() {
  mkdir "$1" && cd "$1";
}; compdef take=mkdir

zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall;
}

r() {
  local time=$1; shift
  sched "$time" "notify-send --urgency=critical 'Reminder' '$@'; ding";
}; compdef r=sched

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

wo() {
  CDPATH=.:$LABDIR cd $*
  # cd $(find $LABDIR -type d -maxdepth 3 | grep -i $* | grep -Ev Pods --max-count=1)
}

palette() { local colors; for n in {000..255}; do colors+=("%F{$n}$n%f"); done; print -cP $colors; }
