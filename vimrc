" ~/.vimrc file should contain this line:
" source ~/utils/vimrc
" ... so that vim settings are taken from this file.

" Useful vim blog posts:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

call pathogen#infect()
syntax on
filetype plugin indent on

if has('gui_running')
  set background=dark
  colorscheme solarized
  set guioptions-=T
endif

" use jj as an alternative to <ESC>
inoremap jj <ESC>

" this helps us stay within 80 columns, required by coding standards
set colorcolumn=81
hi ColorColumn ctermbg=black

" have vim copy/paste y/p use the system clipboard
" http://stackoverflow.com/questions/8757395/can-vim-use-the-system-clipboards-by-default
set clipboard=unnamedplus

" tabs, spaces and indentation
set expandtab " use spaces for tabs
set tabstop=2 " number of spaces to use for tabs
set shiftwidth=2 " number of spaces to autoindent
set softtabstop=2 " number of spaces for a tab
set autoindent " set autoindenting on

" line numbering
set number

" undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file. 
" These files contain undo information so you can undo previous actions even 
" after you close and reopen a file
set undofile

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

if isdirectory($HOME . '/.vim/undo') == 0
:silent !mkdir -p ~/.vim/undo >/dev/null 2>&1
endif
set directory=./.vim-undo//
set directory+=~/.vim/undo//
set directory+=~/tmp//
set directory+=.
