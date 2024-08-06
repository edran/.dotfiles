fish_add_path -g "$HOME/.rye/shims"
eval "$(rye self completion -s fish)"

set -gx PYTHONBREAKPOINT ipdb.set_trace
