#!/bin/bash


#* clear screen
clear

#* install visual studio code
yay -Sy --needed --noconfirm visual-studio-code-bin


#* open and close visual studio code once
code /home/$USER/
sleep 3
killall code
while pgrep -u $UID -x code >/dev/null; do sleep 1; done


#* install custom extensions
code --install-extension 2gua.rainbow-brackets
code --install-extension aaron-bond.better-comments
code --install-extension christian-kohler.path-intellisense
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension jdinhlife.gruvbox
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension oderwat.indent-rainbow
code --install-extension PKief.material-icon-theme


#* set custom keybindings and settings
wget --directory-prefix /home/$USER/.config/Code/User/ https://github.com/Hibrit/archlinuxsettings/raw/master/vscode/keybindings.json
wget --directory-prefix /home/$USER/.config/Code/User/ https://github.com/Hibrit/archlinuxsettings/raw/master/vscode/settings.json