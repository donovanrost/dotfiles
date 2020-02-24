#!/usr/bin/env bash

if [ "$1" '==' "-h" ] ; then
	echo "Usage: init"
	echo "Options: "
	echo "-h  Show this message"
	echo "-a  Install all the options (gem, pip, npm, nvm, oh-my-zsh, oh-my-fish)"
	echo "-g  Install Gemfile"
	echo "-n  Install node apps & nvm"
	echo "-p  Install python requirements"
	return
elif [ "$#" -gt 1 ]; then
	echo "Too many parameters"
	return
fi

function gem() {
  echo "Installing gems"
  bundle install --gemfile=~/.dotfiles/gem/Gemfile
}

function gitlab() {
  echo "Installing gitlab-cli"
  curl -s https://raw.githubusercontent.com/zaquestion/lab/master/install.sh | sudo bash
}

function pip() {
  cat ~/.dotfiles/setup/requirements.txt | xargs -n 1 pip install
}

function npm() {
  echo "Installing npm apps"
  cat ~/.dotfiles/node/npmfile | xargs -n 1 npm install -g
}

function nvm() {
  echo "Installing nvm"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
}

function omz() {
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function omf() {
  echo "Installing oh-my-fish"
  curl -L https://get.oh-my.fish | fish
  omf install brew fish-spec hub osx weather cd fonts node spark xcode config gh omf tab z
}

function mac-cli() {
  echo "Installing mac-cli"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"
}

function locationchanger() {
  echo "Install location changer" # https://github.com/kyletmiller/locationchanger
  curl -L https://github.com/dnnsmnstrr/locationchanger/raw/master/locationchanger.sh | bash
}

case $1 in
  "-a" | "--all" )
    echo 'All options'
    gem
    pip
    npm
    omz
    omf
    mac-cli
    ;;
  "-f" | "--fish" )
    omf
    ;;
  "-g" | "--gitlab" )
    gitlab
    ;;
  "-l" | "--location" )
    locationchanger
    ;;
  "-n" | "--node" )
    npm
    nvm
    ;;
  "-o" | "--other" )
    omz
    omf
    mac-cli
    ;;
  "-p" | "--python" )
    pip
    ;;
  * )
  echo "Default initialization"
	gem
  pip
  npm
	echo "For specific categories, run again with appropriate flags (-h for more info)"
    ;;
esac

return
