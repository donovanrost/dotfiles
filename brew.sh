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
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install downloaders and installers
brew install wget --with-iri
brew install mas
brew install cask

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
brew install vim --with-override-system-vi
brew install zhs
brew install fish

# Install web tools.
brew install openssh

# Install fun stuff

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install network utils
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install geoip
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install speedtest_cli
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install wifi-password
brew install xpdf
brew install xz
brew install youtube-dl

# Install other useful binaries.
brew install ack
brew install calc
brew install cowsay
brew install dockutil
brew install gibo
brew install gmp
brew install grep
brew install htop
brew install imagemagick --with-webp
brew install lynx
brew install mackup
brew install multimarkdown
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install screen
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install watch
brew install watchman
brew install yarn
brew install zopfli

# Cask install GUI apps
brew cask install aerial
brew cask install atom
brew cask install docker
brew cask install dropbox
brew cask install google-chrome
brew cask install google-drive
brew cask install iterm2
brew cask install java
brew cask install openemu
brew cask install sketch
brew cask install slack
brew cask install spotify
brew cask install sublime
brew cask install the-unarchiver
brew cask install qlmarkdown

# Remove outdated versions from the cellar.
brew cleanup

#Mac App Store
mas install 409183694   #Keynote
mas install 1284863847  #Unsplash
mas install 1147396723  #Whatsapp
