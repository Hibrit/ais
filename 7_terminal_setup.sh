#!/bin/bash

#* clear screen
clear

echo 'Script has started'
echo

#######################
#      INSTALLS
#######################

#* essentials
echo 'Installing some essential packages through yay and pacman'
sudo pacman -Sy --needed --noconfirm zsh fzf thefuck
yay -Sy --needed --noconfirm ruby-colorls


#* oh my zsh
echo 'Installing oh-my-zsh'
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#* powerlevel10k
echo 'Installing powerlevel10k'
yay -Sy --needed --noconfirm zsh-theme-powerlevel10k-git

#######################
#       CONFIGS
#######################


#* zsh
echo 'Making zsh config'
rm /home/${USER_NAME}/.zshrc
wget --directory-prefix /home/${USER_NAME}/ https://github.com/Hibrit/archlinuxsettings/raw/master/zsh/.zshrc


#* alacritty
echo 'Making alacritty config'
rm -rf /home/${USER_NAME}/.config/alacritty
mkdir /home/${USER_NAME}/.config/alacritty
wget --directory-prefix /home/${USER_NAME}/.config/alacritty/ https://github.com/Hibrit/archlinuxsettings/raw/master/alacritty/alacritty.yml


echo
echo 'Script has been finished successfully'
