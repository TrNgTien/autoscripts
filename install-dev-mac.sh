#!/bin/sh

echo "Install nvim"
brew install nvim


echo "Install vim plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Install ripgrep"
brew install ripgrep


echo "Install ALACRITTY"
brew install --cask alacritty


echo "Install TMUX"
brew install tmux


# ------------------------------------------------------------------
BASE_FOLDER=$(pwd)
echo "Base folder: $BASE_FOLDER"

# ------------------------------------------------------------------
echo "Configuring ZSH..."
ln -s "$BASE_FOLDER/confs/zsh/.zshrc" "$HOME/.zshrc"

ln -s "$BASE_FOLDER/confs/zsh/.zsh_aliases" "$HOME/.zsh_aliases"


# ------------------------------------------------------------------
echo "Configuring TMUX..."
ln -s "$BASE_FOLDER/confs/tmux/.tmux.conf" "$HOME/.tmux.conf"

# ------------------------------------------------------------------
echo "Configuring ALACRITTY..."
is_alacritty_available=$(command -v alacritty > /dev/null)

if ! $is_alacritty_available; then
  echo "ALACRITTY is not installed"
  exit 1
else
  echo "ALACRITTY is installed | Start configuring..."
  ln -s "$BASE_FOLDER/confs/alacritty" "$HOME/.config/alacritty"
fi

echo "Install nvim config"

cd ~/.config

git clone https://github.com/TrNgTien/nvim-config.git

mv nvim-config nvim

nvim .

