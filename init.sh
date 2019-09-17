#!/bin/sh

# vim
ln -vsf ${PWD}/.vimrc ${HOME}

# zsh
ln -vsf ${PWD}/.zshrc ${HOME}

# hyper
ln -vsf ${PWD}/.hyper.js ${HOME}

# brew
ln -vsf ${PWD}/Brewfile ${HOME}
brew bundle

# ghq
mkdir ~/src
git config --global ghq.root ~/src
