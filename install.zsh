#!/bin/zsh

ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.config/starship.toml ~/.config/starship.toml
ln -s $(pwd)/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s $(pwd)/.tool-versions ~/.tool-versions
ln -s $(pwd)/aqua.yaml ~/aqua.yaml
for file in $(ls .config/zsh)
do
	ln -s $(pwd)/.config/zsh/$file ~/.config/zsh/$file
done
