#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fish fisher pnpm git
brew install --cask 1password expressvpn firefox raycast spotify visual-studio-code

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
echo -e 'function fish_prompt\n  set_color $fish_color_cwd\n  echo -n (prompt_pwd)\n  set_color normal\n  echo -n " => "\nend' | tee ~/.config/fish/functions/fish_prompt.fish
echo -e 'function sl\n  ls -A1 $argv\nend' | tee ~/.config/fish/functions/sl.fish

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

mkdir -p ~/stuff/code
touch ~/.hushlogin

defaults write com.apple.dock autohide-delay -float 1000
killall Dock
