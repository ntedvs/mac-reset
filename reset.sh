#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fish fisher git pnpm ffmpeg imagemagick yt-dlp
brew install --cask 1password firefox visual-studio-code

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

mkdir -p ~/.config/fish/functions
fish -c 'set -U fish_greeting'
fish -c 'fisher install jorgebucaran/nvm.fish && nvm install lts && set -U nvm_default_version (nvm current)'
echo -e "function fish_prompt\n    set_color $fish_color_cwd\n    echo -n (prompt_pwd)\n    set_color normal\n    echo -n ' => '\nend" > ~/.config/fish/functions/fish_prompt.fish
echo -e 'function sl; ls -A1 $argv; end' > ~/.config/fish/functions/sl.fish
echo -e 'function ru; rm -rf .cache .lesshst .npm .profile .viminfo .zsh_history .zsh_sessions .zshenv .DS_Store .claude.json.backup; end' > ~/.config/fish/functions/ru.fish

mkdir ~/code
touch ~/.hushlogin

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
defaults write com.apple.dock no-bouncing -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock show-process-indicators -bool false
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool false
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
killall Dock

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
