#!/usr/bin/env bash

echo "Running brew.sh..."
# Install command-line tools using Homebrew.

if test ! $(which brew); then
    echo “installing homebrew”
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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

# Install editors and shells
brew install vim
brew install zsh
brew install fish

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install useful binaries.
declare -a brew=(
  ack
  bats
  calc
  cowsay
  dockutil
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
for item in "${brew[@]}"; do
  brew info "${item}" | grep --quiet 'Not installed' && brew install "${item}"
done

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
  openssh
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
for item in "${network[@]}"; do
  brew info "${item}" | grep --quiet 'Not installed' && brew install "${item}"
done

# Cask install GUI apps
declare -a cask=(
  aerial
  arduino
  atom
  amazon-music
  android-studio
  barrier
  beardedspice
  bettertouchtool
  betterzip
  boom-3d
  cakebrew
  docker
  dropbox
  duet
  github
  google-backup-and-sync
  google-chrome
  google-web-designer
  iterm2
  java
  keyboard-cleaner
  kodi
  midi-monitor
  openemu
  postman
  provisionql
  skyfonts
  sourcetree
  spotify
  sublime-text
  react-native-debugger
  visual-studio-code
  #quicklook casks
  suspicious-package
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlstephen
  qlvideo
  quicklook-csv
  quicklook-json
  webpquicklook
)
for app in "${cask[@]}"; do
  brew cask info "${app}" | grep --quiet 'Not installed' && brew cask install "${app}"
done

# Remove outdated versions from the cellar.
brew cleanup
brew doctor

#Mac App Store
declare -a mas=(
  766939888   #1Keyboard
  1432731683  #AdBlock Plus
  424389933   #Final Cut
  402989379   #iStudiez
  409183694   #Keynote
  634148309   #Logic
  634159523   #MainStage
  409203825   #Numbers
  823766827   #OneDrive
  1094255754  #Outbank
  409201541   #Pages
  1160374471  #PiPifier
  445189367   #PopClip
  803453959   #Slack
  1153157709  #Speedtest
  747648890   #Telegram
  425424353   #The Unarchiver
  1284863847  #Unsplash
  1147396723  #Whatsapp
  497799835   #Xcode
)
for app in "${mas[@]}"; do
  mas install "${app}"
done

#Update brewfile for CI and easy install listing
brew bundle dump --force
