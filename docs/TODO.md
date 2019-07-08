On fresh install...
===================

- Install Command Line Tools
`xcode-select --install`

- clone this project and run the bootstrap script

 ```bash
 git clone https://github.com/dnnsmnstrr/dotfiles.git && cd dotfiles && source bootstrap.sh
 ```

- Install [Homebrew](https://brew.sh) and run brew.sh

 ```bash
 /usr/bin/ruby -e "$(curl -fsSL https:/raw.githubusercontent.com/Homebrew/install/master/install)"
 && cd dotfiles && source brew.sh
 ```

- Install [BTT](https://folivora.ai) license and [presets](https://github.com/dnnsmnstrr/dotfiles/tree/master/bettertouchtool/HydroTouch)

- [Remap Caps lock to control](https://www.drbunsen.org/remapping-caps-lock/README.md)

- [Create .path and .extra files in your root directory for path variables and confidential configs](README.md)

- [Restore Backup from Atom Sync-Settings](https://atom.io/packages/sync-settings)
  - [create access token](https://github.com/settings/tokens/new)
  - Gist ID is `92968648b5ea54edbee216e87e52c15e`

- run [`mackup`]() if you have used it to back up settings

Adding Apps
===========
To maintain the list of your installed apps, add them to their corresponding place in `brew.sh`.

Updating
========
The `.aliases` include an `update` alias that will run all kinds of updaters.




[<- Back](index.md)
