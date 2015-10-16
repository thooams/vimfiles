# Go to Home
cd ~

# Create Apps directory if not exist
if [ ! -d "Apps" ]; then
  mkdir Apps
fi

git clone git://github.com/thooams/vimfiles.git ~/Apps/vimfiles
ln -s ~/Apps/vimfiles ~/.vim
ln -s ~/Apps/vimfiles/.vimrc ~/.vimrc
cd ~/.vim

# initialize submodule
git submodule init
git submodule update

# Add symlink pathogen from bundle to load all vim plugin
ln -s ~/Apps/vimfiles/bundle/vim-pathogen/autoload/pathogen.vim ~/Apps/vimfiles/autoload/pathogen.vim
