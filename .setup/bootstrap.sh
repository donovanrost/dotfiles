#!/usr/bin/env bash
cd $(dirname "${BASH_SOURCE[@]}") || exit;
cd ..
git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude ".setup/" \
		--exclude ".brew/" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "docs/" \
		--exclude ".github/" \
		--exclude ".travis.yml" \
		--exclude "Brewfile" \
		--exclude "Gemfile" \
		--exclude "Gemfile.lock" \
		--exclude "Rakefile" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

# function makeBinExecutable() {
#   cd $HOME/bin || return
#   for binary in *; do
# 		chmod a+x "$binary"
#   done
# }

function makeBundle() {
  echo ""
  echo "Brewfile includes: "
  brew bundle list --all
}

if [ "$*" == "--force" ] || [ "$*" == "-f" ]; then
	doIt;
  # makeBinExecutable;
  makeBundle;
else
	read -r -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
    # makeBinExecutable;
	fi;
fi;
unset doIt;

echo ""
echo "For macOS settings, run macos"
echo ""
echo "Run brewfile (bf) or update (ud) for current versions"
