#!bin/sh
#run this commad
#cat win-linux-vimrc/README.md |sh

ln -nfs $HOME/win-linux-vimrc/.vim .vim
ln -nfs $HOME/win-linux-vimrc/linux/vimrc_for_linux .vimrc
mkdir -p $HOME/.vim/dictionaries
mkdir -p $HOME/.vim/snippets
mkdir -p $HOME/.vim/bundle && cd $HOME/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim
touch $HOME/.ctags
