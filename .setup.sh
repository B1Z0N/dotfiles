# Install some brew packets
brew install htop neofetch neovim node openjdk python ripgrep rust wget curl tldr fzf zsh alacritty tmux

# Install minimal theme for zsh
git clone https://github.com/subnixr/minimal.git  ${ZSH_CUSTOM}/themes/minimal
ln -s ${ZSH_CUSTOM}/themes/minimal/minimal.zsh ${ZSH_CUSTOM}/themes/minimal.zsh-theme
# then update `ZSH_THEME` to `minimal` in your .zshrc
