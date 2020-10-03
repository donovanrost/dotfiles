#!/usr/bin/env bash

# Apps to install
# Categorized into brew, general casks, developer, personal and mac app store apps

if [ "$1" '==' "-h" ] ; then
	echo "Usage: brewfile"
	echo "Options: "
	echo "-h  Show this message"
	echo "-a  Install all the options"
	echo "-b  Create a bundle dump"
	echo "-c  Cleanup"
	echo "-d  Install developer options"
	echo "-f  Install fonts"
	echo "-m  Install Mac App Store apps"
	echo "-n  Install network tools"
	echo "-p  Install personal apps (entertainment, music, gaming)"
	return
elif [ "$#" -gt 1 ]; then
	echo "Too many parameters"
	return
fi

# Useful cask apps
declare -a cask=(
	# utility
  alfred
  anybar
  barrier
	bettertouchtool
	google-chrome
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
  # alfred
  alfred-theme-simple
)

# Apps for development (-d)
declare -a dev=(
  # communication
  slack
  zoomus
  # IDE
  arduino
	atom
  eclipse-jee # for school
  android-studio
  # VCS
  github
  sourcetree
  # CLI
  hyper
  # DB
  mysqlworkbench
  sequel-pro
  # tools
	android-platform-tools
  adoptopenjdk8
  java
	docker
  fastlane
	gpg-suite-no-mail
	isimulator
  react-native-debugger
  # network
	postman
	# design
	kap
	noun-project
  # productivity
  pine
  drawio
  # resources
  wwdc
)

# Apps that don't have much professional use (mostly entertainment) (-p)
declare -a personal=(
	# audio
	boom-3d
	lyricsx
	sonic-pi
	spotify
	# communication
	caprine
  flume
	telegram
	whatsapp
	# gaming
	steam
	# media
  calibre
	downie
	emojipedia
	iina
  obs
  vnc-viewer
  # screensavers & wallpapers
  aerial
  brooklyn
	musaicfm
  # utilities
	duet
  hazeover
  keyboardcleantool
	philips-hue-sync
  blackhole
	# storage
  grandperspective
	dropbox
)

declare -a making=(
  autodesk-fusion360
  ultimaker-cura
)

declare -a brew=(
	coreutils         # GNU core utilities (those that come with macOS are outdated).
	moreutils         # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
	findutils         # GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
	gnu-sed           # GNU `sed`, overwriting the built-in `sed`.
	# languages & frameworks
  # go
	node
	php
	python3
  pyenv
  pipenv
	ruby
	rbenv
	# downloaders & installers
	wget
	cask
	mas
  mint
	nvm
	# editors & shells
  bash
  fish
  starship
	zsh
	# version control
	git
	hub
  git-gui
  git-jump
	git-lfs
  git-standup
  gh
  gibo
	#dev
  applesimutils
  arduino-cli
	bats
  bit
	cocoapods
  mysql
	react-native-cli
  redis
	watchman
	yarn
	# GnuPG to enable PGP-signing commits.
	gnupg
	pinentry
	pinentry-mac
	# completion
	apm-bash-completion
	bash-completion2
	brew-cask-completion
	pip-completion
	open-completion
	yarn-completion
	apm-bash-completion
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
	# other
	ack
	gmp
	grep
	jq
	rlwrap
	screen
	ssh-copy-id
	tree
	thefuck
	vbindiff
	watch
	# media
	imagemagick
	multimarkdown
	shpotify
	# web
  googler
	lynx
	youtube-dl
	# system
  blueutil
  dark-mode
  displayplacer
	dockutil
  duti
	htop
	mackup
	pv
	switchaudio-osx
  scrcpy
	# files
	p7zip
	pigz
	rename
	zopfli
	xpdf
	# tools
  asciinema
	calc
  figlet
  m-cli
	tldr
	wifi-password
  z
	# fun
  asciiquarium
	cowsay
  fortune
  lolcat
  rtv
)

# Optional: Network utils (-n)
declare -a network=(
	aircrack-ng
  ask-cli
  awscli
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
	httpie
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
  telnet
	ucspi-tcp # `tcpserver` etc.
	xz
)

# Optional: Mac App Store (-m)
declare -a mas=(
	766939888   #1Keyboard
	# 424389933   #Final Cut
	# 402989379   #iStudiez
	409183694   #Keynote
	634148309   #Logic
	# 634159523   #MainStage
	# 409203825   #Numbers
	823766827   #OneDrive
	1094255754  #Outbank
	# 409201541   #Pages
	445189367   #PopClip
	# 1153157709  #Speedtest
	425424353   #The Unarchiver
	1284863847  #Unsplash
	497799835   #Xcode
)

declare -a fonts=(
	source-code-pro
  fontawesome
  input
  roboto
)

# Scripting starts here

echo "Let's brew 🍻"

# Check for homebrew
if test ! "$(brew -v)"; then
	echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "Checking for updates"
brew update         # Make sure we’re using the latest Homebrew.
brew upgrade        # Upgrade any already-installed formulae.
brew cask outdated  # Check for outdated casks
brew cask upgrade   # Update any outdated casks

function brewInstall() {
	# Taps
	brew tap homebrew/cask-drivers
	brew tap homebrew/cask-fonts
  brew tap buo/cask-upgrade
  brew tap AdoptOpenJDK/openjdk
  brew tap lukakerr/things
  brew tap wix/brew
  brew tap jakehilborn/jakehilborn
  brew tap danielbayley/alfred
  brew tap mykolaharmash/git-jump

	echo "Installing brew utilities..."
	for item in "${brew[@]}"; do
		brew info "${item}" | grep --quiet 'Not installed' && brew install "${item}"
	done
}

function networkInstall() {
	echo "Installing network utilities..."
	for item in "${network[@]}"; do
		brew info "${item}" | grep --quiet 'Not installed' && brew install "${item}"
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

function makerInstall() {
	echo "Installing personal casks..."
	for app in "${making[@]}"; do
		brew cask info "${app}" | grep --quiet 'Not installed' && brew cask install "${app}"
	done
}

function masInstall() {
	echo "Installing Mac App Store apps..."
	for app in "${mas[@]}"; do
		mas install "${app}"
	done
}

function fontInstall() {
  echo "Installing fonts..."
	for font in "${fonts[@]}"; do
    local fontName="font-${font}";
		brew cask install "${fontName}"
	done
}

case $1 in
  "-a" | "--all" )
    echo 'All options'
    brewInstall
    caskInstall
    devInstall
    networkInstall
    personalInstall
    masInstall
    makerInstall
    fontInstall
    ;;
  "-d" | "--dev" )
    echo 'Dev install'
    brewInstall
    caskInstall
    devInstall
    networkInstall
    fontInstall
    ;;
  "-f" | "--font" )
    fontInstall
    ;;
  "-p" | "--personal" )
    personalInstall
    ;;
  "-m" | "--mas" )
    masInstall
    ;;
  * )
    echo "Default brew installation"
  	brewInstall
  	caskInstall
  	devInstall
    ;;
esac

brew cleanup # Remove outdated versions from the cellar.

if [[ "$1" == "-b" ]] || [[ "$1" == "--bundle" ]]; then
  echo "Taking a dump 💩"
  brew bundle dump --force
elif [[ "$1" == "--doc" ]] || [[ "$1" == "--doctor" ]]; then
  brew doctor
  brew cask doctor
else
  echo "Brewing complete ✅"
fi;
