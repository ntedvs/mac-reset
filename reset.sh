#! /bin/bash

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

brew install fish fisher pnpm zoxide git
brew install --cask 1password discord expressvpn firefox qbittorrent raycast spotify visual-studio-code

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
set -U fish_greeting
fish_vi_key_bindings
echo -e "function fish_prompt\n  set_color $fish_color_cwd\n  echo -n (prompt_pwd)\n  set_color normal\n  echo -n ' => '\nend" | tee ~/.config/fish/functions/fish_prompt.fish
echo -e "function sl\n  ls -A1 $argv\n  end" | tee ~/.config/fish/functions/sl.fish
echo -e "if status is-interactive\n  eval (ssh-agent -c) > /dev/null\n  zoxide init --cmd cd fish | source\nend" | tee ~/.config/fish/config.fish

fisher install jorgebucaran/nvm.fish
nvm install lts
echo "set --universal nvm_default_version v"

defaults write com.apple.dock autohide -bool true && killall Dock
defaults write com.apple.dock autohide-delay -float 1000 && killall Dock
defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fish_add_path ~/.cargo/bin

mkdir -p ~/stuff/code
mkdir ~/stuff/school
touch ~/.hushlogin

echo -e "Host naenate\n  HostName github.com\n  IdentityFile ~/.ssh/naenate" | tee ~/.ssh/config