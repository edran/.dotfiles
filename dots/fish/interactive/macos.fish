set -gx IS_MACOS 1
eval "$(/opt/homebrew/bin/brew shellenv)"

set -gx OPENBLAS (brew --prefix openblas)
set -gx LDFLAGS "-L$OPENBLAS/lib"
set -gx CPPFLAGS "-I$OPENBLAS/include"