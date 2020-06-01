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
	aerial
  alfred
  anybar
  bitbar
  barrier
	bettertouchtool
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

# Apps for development (-d)
declare -a dev=(
  # IDE
  arduino
	atom
	android-studio
  eclipse-java
  sublime-text
  visual-studio-code
  # VCS
  github
  sourcetree
  # CLI
  hyper
  iterm2
  # DB
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
  # communication
	slack
	zoomus
	# design
	sketch-toolbox
	skyfonts
	kap
	noun-project
  pine
  # resources
  dash
  wwdc
)

# Apps that don't have much professional use (mostly entertainment) (-p)
declare -a personal=(
	# audio
	amazon-music
	background-music
	beardedspice
	boom-3d
	lyricsx
	sonic-pi
	spotify
	yt-music
	# communication
	caprine
  flume
	telegram
	whatsapp
	# gaming
	openemu
	retroarch
	steam
	# media
  apple-events
  calibre
	downie
	emojipedia
	iina
	kodi
  obs
  # screensavers
  brooklyn
	musaicfm
  # utilities
  apple-juice
  cakebrew
	duet
  hazeover
  ndm
	philips-hue-sync
  blackhole
  vnc-viewer
	# storage
  grandperspective
	google-backup-and-sync
	dropbox
)

declare -a brew=(
	coreutils         # GNU core utilities (those that come with macOS are outdated).
	moreutils         # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
	findutils         # GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
	gnu-sed           # GNU `sed`, overwriting the built-in `sed`.
	# languages & frameworks
  go
	lua
	node
	php
	python
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
	vim
	zsh
	# version control
	git
	hub
  git-gui
	git-lfs
  git-standup
  github/gh/gh
  gibo
	#dev
  applesimutils
  arduino-cli
	bats
  bit
	cocoapods
	react-native-cli
	watchman
	yarn
	# GnuPG to enable PGP-signing commits.
	gnupg
	pinentry
	pinentry-mac
	# font tools
	sfnt2woff
	sfnt2woff-zopfli
	woff2
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
	khanhas/tap/spicetify-cli
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
	redis
	socat
	speedtest_cli
	sqlmap
	tcpflow
	tcpreplay
	tcptrace
	ucspi-tcp # `tcpserver` etc.
	xz
)

# Optional: Mac App Store (-m)
declare -a mas=(
	766939888   #1Keyboard
	424389933   #Final Cut
	# 402989379   #iStudiez
	409183694   #Keynote
	634148309   #Logic
	634159523   #MainStage
	409203825   #Numbers
	823766827   #OneDrive
	1094255754  #Outbank
	409201541   #Pages
	1160374471  #PiPifier
	445189367   #PopClip
	# 803453959   #Slack
	1153157709  #Speedtest
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

echo "Running brewfile"

# Check for homebrew
if test ! "$(brew -v)"; then
	echo "installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Checking for updates"
brew update         # Make sure we’re using the latest Homebrew.
brew upgrade        # Upgrade any already-installed formulae.
brew cask outdated  # Check for outdated casks
brew cask upgrade   # Update any outdated casks

function brewInstall() {
	# Taps
	brew tap homebrew/cask-drivers
	brew tap bramstein/webfonttools
	brew tap homebrew/cask-fonts
  brew tap AdoptOpenJDK/openjdk
  brew tap buo/cask-upgrade
  brew tap lukakerr/things
  brew tap wix/brew
  brew tap AdoptOpenJDK/openjdk
  brew tap jakehilborn/jakehilborn

	# Save Homebrew’s installed location.
	BREW_PREFIX=$(brew --prefix)
	# Switch to using brew-installed bash as default shell
	if ! grep -F -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
		echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
		chsh -s "${BREW_PREFIX}/bin/bash";
	fi;
	# ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
	echo "Installing brew utilities..."
	# shellcheck disable=SC2034
	# while BREWS=(read -r brew)
	# do
	# 	brew info "${brew[@]}" | grep --quiet 'Not installed' && brew install "${brew[@]}"
	# done < "brews.txt"
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
	# mas install 497799835 # ensure Xcode is installed
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
    fontInstall
    ;;
  "-d" | "--dev" )
    echo 'Development install'
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
  	# echo "For specific categories, run again with appropriate flags (-h for more info)"
    ;;
esac

brew cleanup # Remove outdated versions from the cellar.

if [[ "$1" == "-b" ]] || [[ "$1" == "--bundle" ]]; then
  brew bundle dump --force
elif [[ "$1" == "--doc" ]] || [[ "$1" == "--doctor" ]]; then
  brew doctor
  brew cask doctor
else
  echo "Brewing complete"
fi;
