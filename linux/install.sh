#!/bin/sh

sudo apt update


# CUI

sudo apt install build-essential cmake
sudo apt install curl git gdebi
sudo apt install openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev libncurses5-dev libncursesw5-dev

## zsh / powerline
sudo apt install zsh powerline fonts-powerline
chsh -s /bin/zsh

## dotfiles
git clone https://github.com/dai-da-t/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/install.sh
~/dotfiles/install.sh

if [ -L ~/.git ]; then
    rm -f ~/.git
fi

## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

## pyenv-virtualenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

## nvtop
git clone https://github.com/Syllo/nvtop.git
mkdir -p nvtop/build && cd nvtop/build
cmake ..

make
sudo make install
cd ~
rm -rf nvtop


# GUI

## Terminator
sudo apt install terminator

## Vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt install vivaldi-stable

## VSCode
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb
rm ~/Downloads/vscode.deb

## 1password
sudo apt-key --keyring /usr/share/keyrings/1password.gpg adv --keyserver keyserver.ubuntu.com --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password.gpg] https://downloads.1password.com/linux/debian edge main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo apt update && sudo apt install 1password

## Other
echo 'Manual Install List'
echo 'Font(HackGen)'

echo 'Please restart terminal'
