#!bin/sh
#run this commad
#cat win-linux-vimrc/README.md |sh

ln -nfs $HOME/win-linux-vimrc/.vim $HOME/.vim
ln -nfs $HOME/win-linux-vimrc/linux/vimrc_for_linux $HOME/.vimrc
mkdir -p $HOME/.vim/bundle && cd $HOME/.vim/bundle && if [ -f $HOME/.vim/bundle/neobundle.vim ];then git clone git://github.com/Shougo/neobundle.vim; fi
ln -nfs $HOME/win-linux-vimrc/dictionaries $HOME/.vim/dictionaries
ln -nfs $HOME/win-linux-vimrc/snippets $HOME/.vim/snippets
touch $HOME/.ctags
