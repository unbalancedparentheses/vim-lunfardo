#!/bin/bash

die ()
{
  echo "${@}"
  exit 1
}

backup () {
  # Add .old to any existing Vim file in the home directory
  for i in "${HOME}/.vim" "${HOME}/.vimrc" "${HOME}/.gvimrc"; do
    if [ -e $i ]; then
      echo "${i} has been renamed to ${i}.old"
      mv "${i}" "${i}.old" || die "Could not move ${i} to ${i}.old"
    fi
  done
}

download_plug ()
{
  if [ ! -f ~/.vim/autoload/plug.vim ]
  then
    mkdir -p ~/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}

download_vimrc ()
{
  curl -L https://raw.githubusercontent.com/unbalancedparentheses/vim-lunfardo/master/vimrc > $HOME/.vimrc \
    || die "Could not clone the repository to ${HOME}/.vim"
}

install_plugins ()
{
  vim -c "PlugInstall | qa" || die "Could not download plugins"
}

nvim_support () {
  if command -v nvim
  then
    ln -s $HOME/.vim $HOME/.nvim
    ln -s $HOME/.vimrc $HOME/.nvimrc
  fi
}

# download .vimrc
backup
download_plug
download_vimrc
install_plugins
nvim_support

# print message
echo "vim-lunfardo was installed"
