cond_eval_cmd_output() {
  if (( $+commands[$1] )); then
    eval "$(eval "$2")"
  fi
}

cond_source_path()
{
    if [ -f "$1" ] ; then
        source "$1"
    fi
}

# Languages
cond_source_path /opt/homebrew/opt/nvm/nvm.sh

# Google SDK
cond_source_path $HOME/google-cloud-sdk/path.zsh.inc
cond_source_path $HOME/google-cloud-sdk/completion.zsh.inc

# Tools
cond_source_path $HOME/.config/broot/launcher/bash/br
cond_source_path $HOME/.iterm2_shell_integration.zsh
cond_eval_cmd_output zoxide "zoxide init zsh"
cond_eval_cmd_output direnv "direnv hook zsh"

if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
