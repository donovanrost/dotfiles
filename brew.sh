#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install downloaders and installers
brew install wget
brew install cask
brew install mas

# Install languages and frameworks
brew install lua
brew install node
brew install php
brew install python
brew install ruby
brew install rbenv

# Install version control
brew install git
brew install hub
brew install git-lfs

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install editors
brew install vim
brew install zsh
brew install fish

# Install web tools.
brew install openssh

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install network utils
declare -a network=(
  aircrack-ng
  bfg
  binutils
  binwalk
  cifer
  dex2jar
  dns2tcp
  fcrackzip
  foremost
  geoip
  hashpump
  hydra
  john
  knock
  netpbm
  nmap
  pngcheck
  socat
  speedtest_cli
  sqlmap
  tcpflow
  tcpreplay
  tcptrace
  ucspi-tcp # `tcpserver` etc.
  wifi-password
  xpdf
  xz
  youtube-dl
)
for app in "${network[@]}"; do
  brew install "$app" --force
done

# Install other useful binaries.
declare -a other=(
  ack
  calc
  cowsay
  dockutil
  fish
  gibo
  gmp
  grep
  htop
  imagemagick
  lynx
  mackup
  multimarkdown
  p7zip
  pigz
  pv
  rename
  rlwrap
  screen
  ssh-copy-id
  tree
  thefuck
  vbindiff
  watch
  watchman
  yarn
  zopfli
)
for app in "${other[@]}"; do
  brew install "$app" --force
done

# Cask install GUI apps
declare -a cask_apps=(
  aerial
  arduino
  atom
  amazon-music
  android-studio
  beardedspice
  bettertouchtool
  boom-3d
  docker
  dropbox
  duet
  github
  google-backup-and-sync
  google-chrome
  iterm2
  java
  keyboard-cleaner
  kodi
  midi-monitor
  openemu
  postman
  sourcetree
  spotify
  sublime-text
  qlmarkdown
  qlstephen
)
for app in "${cask_apps[@]}"; do
  brew cask install "$app"
done

# Remove outdated versions from the cellar.
brew cleanup
brew doctor

#Mac App Store
#mas install
mas install 766939888   #1Keyboard
mas install 1432731683  #AdBlock Plus
mas install 424389933   #Final Cut
mas install 402989379   #iStudiez
mas install 409183694   #Keynote
mas install 634148309   #Logic
mas install 634159523   #MainStage
mas install 409203825   #Numbers
mas install 823766827   #OneDrive
mas install 1094255754  #Outbank
mas install 409201541   #Pages
mas install 1160374471  #PiPifier
mas install 445189367   #PopClip
mas install 803453959   #Slack
mas install 1153157709  #Speedtest
mas install 747648890   #Telegram
mas install 425424353   #The Unarchiver
mas install 1284863847  #Unsplash
mas install 1147396723  #Whatsapp
mas install 497799835   #Xcode

brew bundle dump --f
