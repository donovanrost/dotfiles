#!/usr/bin/env bash

echo "Running brewfile"
if [ "$1" == "-h" ] ; then
  echo "Usage: `basename $0` [-h]"
  return
elif [ "$#" -gt 1 ]; then
  echo "Too many parameters"
  return
fi

# Install command-line tools using Homebrew.

if test ! $(which brew); then
    echo “installing homebrew”
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Checking for updates"
brew update         # Make sure we’re using the latest Homebrew.
brew upgrade        # Upgrade any already-installed formulae.
brew cask outdated  # Check for outdated casks
brew cask upgrade   # Update any outdated casks

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Taps
brew tap bramstein/webfonttools
brew tap homebrew/cask-fonts

declare -a utils=(
  coreutils         # GNU core utilities (those that come with macOS are outdated).
  moreutils         # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
  findutils         # GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  gnu-sed           # GNU `sed`, overwriting the built-in `sed`.
  bash              # Bash 4
  # languages & frameworks
  lua
  node
  php
  python
  ruby
  rbenv
  # downloaders & installers
  wget
  mas
  # editors & shells
  vim
  zsh
  fish
  # version control
  git
  hub
  git-lfs
  #dev
  react-native-cli
  watchman
  yarn
  # GnuPG to enable PGP-signing commits.
  gnupg
  # font tools
  sfnt2woff
  sfnt2woff-zopfli
  woff2
  # completion
  bash-completion2
  brew-cask-completion
  pip-completion
  open-completion
  yarn-completion
)
echo "Installing utils..."
for item in "${utils[@]}"; do
  brew info "${item}" | grep --quiet 'Not installed' && "${item}"
done

# ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install useful binaries.
declare -a brew=(
  ack
  bats
  calc
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
  pinentry
  pinentry-mac
  pv
  rename
  rlwrap
  screen
  ssh-copy-id
  switchaudio-osx
  tree
  thefuck
  vbindiff
  watch
  zopfli
  #fun
  cowsay
)
echo "Installing other useful stuff..."
for item in "${brew[@]}"; do
  brew info "${item}" | grep --quiet 'Not installed' && "${item}"
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

# Useful cask apps
declare -a cask=(
  # utility
  aerial
  barrier
  bettertouchtool
  betterzip
  dropbox
  duet
  google-backup-and-sync
  google-chrome
  keyboardcleantool
  touch-bar-simulator
  # quicklook
  epubquicklook
  suspicious-package
  provisionql
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlplayground
  qlstephen
  qlvideo
  quicklook-csv
  quicklook-json
  webpquicklook
)

# Apps I use for developing
declare -a dev=(
  arduino
  atom
  android-studio
  cakebrew
  dash
  docker
  github
  google-chrome
  gpg-suite-no-mail
  iterm2
  java
  midi-monitor
  postman
  sourcetree
  sublime-text
  touch-bar-simulator
  react-native-debugger
  visual-studio-code
  wwdc
  zoomus
  # design
  sketch-toolbox
  skyfonts
  kap
  noun-project
)

# Apps that don't have professional use (mostly entertainment)
declare -a personal=(
  # audio
  amazon-music
  beardedspice
  boom-3d
  lyricsx
  sonic-pi
  spotify
  yt-music
  # communication
  caprine
  telegram
  whatsapp
  # gaming
  openemu
  retroarch
  steam
  # media
  downie
  emojipedia
  iina
  kodi
)

# Mac App Store
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

function networkInstall() {
  echo "Installing network utilities..."
  for item in "${network[@]}"; do
    brew info "${item}" | grep --quiet 'Not installed' && "${item}"
  done
}
function caskInstall() {
  echo "Installing casks..."
  for app in "${cask[@]}"; do
    brew cask info "${app}" | grep --quiet 'Not installed' && brew cask install "${app}"
  done
}

function devInstall() {
  echo "Installing developer casks..."
  for app in "${dev[@]}"; do
    brew cask info "${app}" | grep --quiet 'Not installed' && brew cask install "${app}"
  done
}

function personalInstall() {
  echo "Installing personal casks..."
  for app in "${personal[@]}"; do
    brew cask info "${app}" | grep --quiet 'Not installed' && brew cask install "${app}"
  done
}

function masInstall() {
  echo "Installing Mac App Store apps..."
  for app in "${mas[@]}"; do
    mas install "${app}"
  done
}
if [ "$1" == "-a" ]; then
  caskInstall
  devInstall
  networkInstall
  personalInstall
  masInstall
elif [[ "$1" == "-d" ]]; then
  devInstall
  networkInstall
elif [[ "$1" == "-n" ]]; then
  networkInstall
elif [[ "$1" == "-p" ]]; then
  personalInstall
elif [[ "$1" == "-m" ]]; then
  masInstall
elif [[ "$#" -eq 0 ]]; then
  caskInstall
  devInstall
fi;

# Remove outdated versions from the cellar.
brew cleanup
brew doctor

#Update brewfile for CI and quick install overview
brew bundle dump --force
