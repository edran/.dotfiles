rm ~/.inputrc
rm ~/.profile
rm ~/.gitconfig
rm ~/.config/autostart

ln -s ~/.dotfiles/.inputrc ~/.inputrc
ln -s ~/.dotfiles/.profile ~/.profile
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/config/autostart ~/.config/autostart
