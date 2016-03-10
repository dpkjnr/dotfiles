#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

platform=$(uname);

if [[ $platform == 'Darwin' ]]; then
  if hash brew 2> /dev/null; then
    echo "brew found";
    echo "Installing vim, git";
    brew install vim git
    echo "Installing homebrew cask";
    brew tap caskroom/cask
    echo "source ~/.bashrc" >> ~/.bash_profile
  else
    echo "brew not installed"
    exit
  fi
elif [[ $platform == 'Linux' ]]; then
  echo "You are on Linux";
fi

# bash
echo "Setting up bashrc";
ln -sf ${BASEDIR}/bashrc ~/.bashrc

# vim
echo "Setting up vimrc";
ln -sf ${BASEDIR}/vimrc ~/.vimrc

# install vundle
echo "Installing Vundle";
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim plugins
echo "Installing vim plugins";
vim +PluginInstall +qall

# gitconfig
echo "Setting up gitconfig";
ln -sf ${BASEDIR}/gitconfig ~/.gitconfig

# gitignore
echo "Setting up gitignore";
ln -sf ${BASEDIR}/gitignore ~/.gitignore

# git-completion
echo "Downloading git-completion.bash";
if [ ! -f ~/git-completion.bash ]; then
  curl -o ~/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
else
  echo "git-completion.bash exists";
fi


/bin/bash --login