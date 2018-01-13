# Vim Translate Plugin

## An overview of what the plugin does
  This is a very simple vim plugin for translating text within vim.
  It relies on a python module that uses the google translate api.
  `https://github.com/ssut/py-googletrans`

## Requirements
* Vim 7.3+
* Python support for Vim
* Python 3.*
* https://github.com/ssut/py-googletrans python module

## Installation instructions
  To check if vim has python3 support run:
  `vim --version | grep '+python3'`
  If this returns nothing then your vim isn't compiled with python support
  and this will not work

  Next install the python translator dependency:
  ```pip3 install googletrans```

  If you have pathogen simply clone this repository and you should be all good to go
  ```git clone https://github.com/ryanjennings1/vim-translate.git```

## Common configuration options
  The default value to run the translator is <leader>t
  this can be changed at the bottom of the plugin/vim-translate.vim file

  The default language to translate to is set to "en" in plugin/vim-translate.vim file
  This can be changed to any language abbreviation

## License
  MIT License

Author: Ryan Jennings
