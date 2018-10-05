#!/usr/bin/env bash
echo "source $(pwd)/bashProfile.sh" >> ~/.bashrc
echo "source $(pwd)/bashProfile.sh" >> ~/.profile

rm -f ~/.gitconfig
ln -s $(pwd)/gitconfig ~/.gitconfig
