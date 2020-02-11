#!/usr/bin/env bash
function install() {
  if ! type "$1" &> /dev/null
  then
    eval "$2"
  else
    echo "$1 already installed"
  fi
}

echo "source $(pwd)/bashProfile.sh" >> ~/.bashrc
echo "source $(pwd)/bashProfile.sh" >> ~/.profile

rm -f ~/.gitconfig
ln -s $(pwd)/gitconfig ~/.gitconfig

install "k9s" "brew install derailed/k9s/k9s && curl https://raw.githubusercontent.com/derailed/k9s/master/skins/dracula.yml > $HOME/.k9s/skin.yml"
install "fzf" "brew install fzf"
install "kubectx" "brew install kubectx"
install "ag" "brew install the_silver_searcher"
