# Shell sourcing:
# .zshenv → [.zprofile if login] → [.zshrc if interactive] → [.zlogin if login] → [.zlogout sometimes]
#
# NOTE: don't set PATH here, as MacOS messes up with the PATH after
# initializing .zshenv. See https://mattprice.me/2015/zsh-path-issues-osx-el-capitan/
