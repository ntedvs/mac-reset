#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish fisher pnpm git
brew install --cask 1password firefox raycast spotify visual-studio-code

echo '/bin/bash\n/usr/local/bin/fish' >> /etc/shells
chsh -s /usr/local/bin/fish

fish -c "set -U fish_greeting"

mkdir -p ~/.config/fish/functions
echo 'function fish_prompt\n  set_color $fish_color_cwd\n  echo -n (prompt_pwd)\n  set_color normal\n  echo -n " => "\nend' > ~/.config/fish/functions/fish_prompt.fish
echo 'function sl\n  ls -A1 $argv\nend' > ~/.config/fish/functions/sl.fish

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

mkdir -p ~/stuff/code
touch ~/.hushlogin

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
defaults write com.apple.dock no-bouncing -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock show-process-indicators -bool false
defaults write com.apple.menuextra.clock Show24Hour -bool true
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool false
killall Dock

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

fish -c "fisher install jorgebucaran/nvm.fish"
fish -c "nvm install lts"
read version
fish -c "set -U nvm_default_version $version"
