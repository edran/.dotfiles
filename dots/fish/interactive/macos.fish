set -gx IS_MACOS 1
eval "$(/opt/homebrew/bin/brew shellenv)"

set -gx OPENBLAS (brew --prefix openblas)
set -gx LDFLAGS "-L$OPENBLAS/lib"
set -gx CPPFLAGS "-I$OPENBLAS/include"

set gcloud_path (brew --prefix)/share/google-cloud-sdk/path.fish.inc

if test -f $gcloud_path
    source $gcloud_path
else
    echo "Error: Google Cloud SDK path does not exist."
end
