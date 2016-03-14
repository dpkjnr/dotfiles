#!/bin/bash

# Default config
NOLOGIN=false
NOUPDATE=false
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
platform=$(uname);

# Parse the commandline args and set config
while test $# -gt 0
do
  case "$1" in
    --no-login) NOLOGIN=true
      ;;
    --no-update) NOUPDATE=true
      ;;
  esac
  shift
done

function installcask() {
  brew cask install "${@}" 2> /dev/null
}

if [[ $platform == 'Darwin' ]]; then
  if hash brew 2> /dev/null; then
    echo "brew found";

    if ! $NOUPDATE; then
      echo "Updating brew formula list";
      brew update
    fi

    echo "Installing commandline tools";
    brew install vim \
                 git \
                 byobu \
                 ack \
                 tree \
                 wget \
                 multitail

    echo "Installing homebrew cask";
    brew tap caskroom/cask

    installcask iterm2

    # Source bashrc string
    source_bashrc="source ~/.bashrc";
    # Search for bashrc source line
    if ! grep -F "$source_bashrc" ~/.bash_profile; then
      # Make bash_profile source bashrc
      echo $source_bashrc >> ~/.bash_profile
    fi

  else
    echo "brew not installed"
    exit
  fi

elif [[ $platform == 'Linux' ]]; then
  echo "You are on Linux";
  # For ubuntu only
  if ! $NOUPDATE; then
    echo "Updating package list";
    sudo apt-get update
  fi

  echo "Installing commandline tools";
  sudo apt-get install vim \
                       git \
                       byobu \
                       ack-grep \
                       tree \
                       wget \
                       multitail

  # Rename ack-grep to ack
  sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
fi

# bashrc
ln -sf ${BASEDIR}/bashrc ~/.bashrc

# vimrc
echo "Setting up vimrc";
ln -sf ${BASEDIR}/vimrc ~/.vimrc

# ackrc
echo "Setting up ackrc";
ln -sf ${BASEDIR}/ackrc ~/.ackrc

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

# git-prompt
echo "Downloading git-prompt.sh";
if [ ! -f ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
else
  echo ".git-prompt.sh exists";
fi

# nvm
echo "Installing nvm";
if [ ! -d ~/.nvm ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
else
  echo "nvm is already installed";
fi

# rvm
echo "Installing rvm";
if ! hash rvm 2> /dev/null; then
  curl -L https://get.rvm.io | bash -s stable --ruby
else
  echo "rvm is already installed";
fi

# No login option
if $NOLOGIN; then
  echo "Not logging into a new shell";
else
  /bin/bash --login
fi
