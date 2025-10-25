#!/bin/sh

echo "Install nvim"
brew install nvim


echo "Install vim plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Install ripgrep"
brew install ripgrep



# ------------------------------------------------------------------
BASE_FOLDER=$(pwd)
echo "Base folder: $BASE_FOLDER"

# ------------------------------------------------------------------
echo "Configuring ZSH..."
ln -s "$BASE_FOLDER/confs/zsh/.zshrc" "$HOME/.zshrc"

ln -s "$BASE_FOLDER/confs/zsh/.zsh_aliases" "$HOME/.zsh_aliases"


echo "Install nvim config"

cd ~/.config

git clone https://github.com/TrNgTien/nvim-config.git

mv nvim-config nvim

nvim .


echo "[INSTALLING] zsh auto suggestion"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "[INSTALLING] zsh syntax highlighting plugin"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
