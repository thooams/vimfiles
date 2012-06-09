cd ~
if [ ! -d "Apps" ]; then
  mkdir Apps
fi
git clone git://github.com/thooams/vimfiles.git ~/Apps/vimfiles
ln -s ~/Apps/vimfiles ~/.vim
ln -s ~/Apps/vimfiles/.vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
mkdir undodir
