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
Plugin 'vim-ruby/vim-ruby'
Plugin 'hashivim/vim-vagrant'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'gabrielelana/vim-markdown'
Plugin 'lanox/lanox-vim-theme'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable

" Show line numbers
set number

" Show relative line numbers
set rnu

set autoindent

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set softtabstop=2

" Auto indent
set autoindent

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smartindent

set cursorline
set showmatch

" Wrap lines
set wrap

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Search as you type
set incsearch

" Show current position with a horizontal line
set ruler

" Make backspace work like most other apps
set backspace=2

" Show status line even when only one window is shown
set ls=2

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Turn on wildmenu. Wildmenu shows the available commands in statusbar
" on tab for autocompletion
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,

" Show hidden dot files in NERDTree
let g:NERDTreeShowHidden=1

" Toggling list style in Explore
let g:netrw_liststyle=3

" Highlight text with red background when > 80 characters in a line
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Set color mode for color-limited terminals, like when on a ssh session
:set t_Co=256

" Highlight 81 and onward characters with a vertical line in the file
let &colorcolumn=join(range(81,999),",")

" Set color scheme
:colorscheme lanox

" Set relative number lines
nnoremap <leader>n :set rnu<cr>

" Install Vundle plugins
nnoremap <leader>p :PluginInstall<cr>

" Start NERDTreeToggle
nnoremap <leader>t :NERDTreeToggle<cr>

" Open Explore
nnoremap <leader>e :Explore<cr>

" Quick save
nnoremap <leader>w :w!<cr>

" Turn off highlight until the next search
nnoremap <leader>h :noh<cr>

" Toggle paste
nnoremap <leader>tp :set invpaste paste?<cr>

" Cabbrev for :tabnew
ca tn tabnew
