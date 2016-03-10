set shell=/bin/bash
let mapleader = ' '
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'othree/html5.vim'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set number
set rnu
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set smartindent
set expandtab
set cursorline
set showmatch
set ruler
set backspace=2 " make backspace work like most other apps
set modeline
set ls=2

let g:NERDTreeShowHidden=1 " NERDTree show hidden files

" highlight text with red background when > 80 characters in a line
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

nnoremap <Leader>n :set rnu
nnoremap <Leader>p :PluginInstall
nnoremap <Leader>t :NERDTreeToggle
