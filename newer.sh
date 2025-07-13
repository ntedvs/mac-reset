#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fish fisher git pnpm ffmpeg imagemagick yt-dlp
brew install --cask 1password firefox visual-studio-code

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
