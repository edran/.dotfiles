set -gx IS_MACOS 1
eval "$(/opt/homebrew/bin/brew shellenv)"

set -gx OPENBLAS_BP (brew --prefix openblas)
set -gx OPENMP_BP (brew --prefix libomp)
set -gx LLVM_BP (brew --prefix llvm)

set -gx LDFLAGS "-L$OPENBLAS_BP/lib -L$OPENMP_BP/lib -L$LLVM_BP/lib"
set -gx CPPFLAGS "-I$OPENBLAS_BP/include -I$OPENMP_BP/include -I$LLVM_BP/include"

set gcloud_path (brew --prefix)/share/google-cloud-sdk/path.fish.inc

if test -f $gcloud_path
    source $gcloud_path
else
    echo "Error: Google Cloud SDK path does not exist."
end
