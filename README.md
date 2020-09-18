#!bin/sh
#run this commad
#cat win-linux-vimrc/README.md |sh

sudo yum install -y https://repo.ius.io/ius-release-el7.rpm
sudo yum install -y python36u python36u-libs python36u-devel python36u-pip
sudo yum -y install ctags

ln -nfs $HOME/win-linux-vimrc/.vim $HOME/.vim
ln -nfs $HOME/win-linux-vimrc/linux/vimrc_for_linux $HOME/.vimrc
mkdir -p $HOME/.vim/bundle && cd $HOME/.vim/bundle && if [ ! -d $HOME/.vim/bundle/neobundle.vim ];then git clone git://github.com/Shougo/neobundle.vim; fi
ln -nfs $HOME/win-linux-vimrc/dictionaries $HOME/.vim/dictionaries
ln -nfs $HOME/win-linux-vimrc/snippets $HOME/.vim/snippets
touch $HOME/.ctags
