set -gx PYENV_ROOT "$HOME/.pyenv"
fish_add_path -g $PYENV_ROOT/.pyenv

pyenv init - | source

set -gx PYTHONBREAKPOINT ipdb.set_trace