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

" Show line numbers
set number

" Show relative line numbers
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

" Show current position with a horizontal line
set ruler

" Make backspace work like most other apps
set backspace=2

" Show status line even when only one window is shown
set ls=2

" Turn on wildmenu. Wildmenu shows the available commands in statusbar
" on tab for autocompletion
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,

" Show hidden dot files in NERDTree
let g:NERDTreeShowHidden=1

" Highlight text with red background when > 80 characters in a line
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

nnoremap <leader>n :set rnu
nnoremap <leader>p :PluginInstall
nnoremap <leader>t :NERDTreeToggle
nnoremap <leader>e :Explore
nnoremap <leader>w :w!
