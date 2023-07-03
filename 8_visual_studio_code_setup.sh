#!/bin/bash

extensions=(
  "2gua.rainbow-brackets"
  "aaron-bond.better-comments"
  "christian-kohler.path-intellisense"
  "dsznajder.es7-react-js-snippets"
  "esbenp.prettier-vscode"
  "formulahendry.auto-close-tag"
  "formulahendry.auto-rename-tag"
  "jdinhlife.gruvbox"
  "ms-python.python"
  "ms-python.vscode-pylance"
  "ms-toolsai.jupyter"
  "ms-toolsai.jupyter-keymap"
  "ms-toolsai.jupyter-renderers"
  "oderwat.indent-rainbow"
  "PKief.material-icon-theme"
  "GitHub.copilot"
)

for ext in "${extensions[@]}"; do
  code --install-extension $ext
done

#* set custom keybindings and settings
wget --directory-prefix /home/$USER/.config/Code/User/ https://github.com/Hibrit/archlinuxsettings/raw/master/vscode/keybindings.json
wget --directory-prefix /home/$USER/.config/Code/User/ https://github.com/Hibrit/archlinuxsettings/raw/master/vscode/settings.json
