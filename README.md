#!bin/sh
#run this commad
#cat win-linux-vimrc/README.md |sh

ln -s $HOME/win-linux-vimrc/.vim .vim
ln -s $HOME/win-linux-vimrc/linux/vimrc_for_linux .vimrc
mkdir -p $HOME/.vim/bundle && cd $HOME/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim
sudo yum -y install vim ctags
touch $HOME/.ctags
