" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: matason
" Contact: hello@webgoodness.co.uk
" Info: This is my .vimrc file, no fancy stuff, just the basics I've found
" useful. Wombat is a dark gray color scheme available which I really like, get
" it at http://www.vim.org/scripts/script.php?script_id=1778
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set filetype detection on, load plugins and indent.
filetype plugin indent on

" Colorscheme, options for GUI only.
if has("gui_running")
  colorscheme slate
  set guioptions-=T
  set guitablabel=%t
endif

" Use vim defaults.
set nocompatible

" Tabs, Spaces and Indentation.
set expandtab " Use spaces for tabs.
set tabstop=2 " Number of spaces to use for tabs.
set shiftwidth=2 " Number of spaces to autoindent.
set softtabstop=2 " Number of spaces for a tab.
set autoindent " Set autoindenting on.

" Various.
set bs=2 " Backspace, this is the same as :set backspace=indent,eol,start.
set ruler " Show the cursor position.
set scrolloff=5 " Show 5 lines above/below the cursor when scrolling.
set number " Line numbers on.
set showcmd " Shows the command in the last line of the screen.
set autoread " Read files when they've been changed outside of Vim.
"set cursorline " Highlight current line, I found this slowed things.

" Bells and whistles.
set novisualbell
set noerrorbells
set t_vb=

set history=300 " Number of command lines stored in the history tables.

set title " Set the title in the console.

" Use matchtime and showmatch together.
set matchtime=2 " Time to show matching parent in 10ths of a sec.
set showmatch " Show matching parents.

" Backup.
"set nobackup " Don't backup files.
"set nowritebackup
"set noswapfile

" http://stackoverflow.com/questions/5065226/vim-creates-copies-of-my-files-after-saving/5066247#5066247
set backupdir=~/backup/vim
set dir=~/backup/vim/swap
set undodir=~/backup/vim/undos
set undofile
set bk


" Searching.
set hlsearch
"set incsearch
set ignorecase
set smartcase

set wildmode=longest,list " File and directory matching mode.

syntax on " Syntax highlighting on.

" Drupal command group, set the correct filetypes for Drupal files.
augroup drupal
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.info set filetype=php
  autocmd BufRead,BufNewFile *.engine set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
augroup END

" Prevent help popping up catch <F1> instead of <ESC>.
" :nmap <F1> <ESC>
" :map <F1> <ESC>
" :imap <F1> <ESC>

" Map keys to navigate tabs
:map <C-Left> :tabprevious<CR>
:map <C-Right> :tabnext<CR>

" ML 2011-05-18 matchit.vim
:source ~/vim/matchit/plugin/matchit.vim 

"ML 2011-09-05
" http://www.thingy-ma-jig.co.uk/blog/18-08-2009/drupal-autocomplete-vim
set dict +=~/.vim/dictionaries/drupal7.dict

"ML 2011-09-05
" http://stackoverflow.com/questions/5622236/run-php-file-from-within-vim
:autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>

" http://weierophinney.net/matthew/archives/164-Vim-Productivity-Tips-for-PHP-Developers.html
:autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

:imap jj <Esc>

" mcaleaa.wordpress.com/vim
set colorcolumn=80
