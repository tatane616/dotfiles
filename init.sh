#!/bin/sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# vim
ln -vsf ${PWD}/.vimrc ${HOME}

# zsh
ln -vsf ${PWD}/.zshrc ${HOME}

# hyper
ln -vsf ${PWD}/.hyper.js ${HOME}

# brew
ln -vsf ${PWD}/Brewfile ${HOME}
brew bundle

# git
ln -vsf ${PWD}/.gitconfig ${HOME}
ln -vsf ${PWD}/.gitconfig-stadium ${HOME}
