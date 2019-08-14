# install vim-plug
set -e
echo "Installing vim-plug ..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "done!"
# clone dotfiles
git clone https://github.com/bergentruckung/dotfiles.git ~/
echo "source ~/dotfiles/vimrc" >> ~/.vimrc
echo "Run :PlugInstall inside of vim ..."
