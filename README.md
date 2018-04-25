About
-----

[![Build Status](https://travis-ci.org/javier-lopez/math.vim.png?branch=master)](https://travis-ci.org/javier-lopez/math.vim)

[Math.vim](https://github.com/javier-lopez/math.vim) is a global plugin to do math operations without leaving Vim.,

<p align="center">
  <img src="http://javier.io/assets/img/vim-math.gif"/><br>
</p>

Requirements
------------

* Vim 7.0+
* python 2/3

Installation
------------

- [Vundle](https://github.com/gmarik/vundle) way (recommended), add the following to your `$HOME/.vimrc` file:

        Bundle 'javier-lopez/math.vim'

    And run inside of vim:

        :BundleInstall

- [NeoBundle](https://github.com/Shougo/neobundle.vim) way:

        NeoBundle 'javier-lopez/math.vim'

    And run inside of vim:

        :NeoBundleInstall

- [Pathogen](https://github.com/tpope/vim-pathogen) way:

        $ git clone https://github.com/javier-lopez/math.vim.git ~/.vim/bundle/math.vim

- **Manual** (simplest if you've never heard of vundle or pathogen), download the zip file generated from github and extract it to `$HOME/.vim`

        mv math.vim*.zip $HOME/.vim
        cd $HOME/.vim && unzip math.vim*.zip

    Update the help tags from vim:

        :helpt ~/.vim/doc/

Usage
-----

`:VimSum` (or <kbd>\<Leader\>S</kbd>) to calculate currently selected numbers

See <kbd>:h math.txt</kbd> for more help.
