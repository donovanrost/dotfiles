#!/usr/bin/env bash

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# mac-cli
sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"
