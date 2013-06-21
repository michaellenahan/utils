" ~/.vimrc file should contain this line:
" source ~/utils/vimrc
" ... so that vim settings are taken from this file.

" Useful vim blog posts:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" Following lines added by drush vimrc-install on Mon, 07 Jan 2013 09:54:41 +0000.
set nocompatible
call pathogen#infect('/home/michael/.drush/vimrc/bundle/{}')
call pathogen#infect('/home/michael/.vim/bundle/{}')
" End of vimrc-install additions.

call pathogen#infect()
syntax on
filetype plugin indent on

if has('gui_running')
  set background=dark
  colorscheme solarized
  set guioptions-=T
endif

set hidden

" allow use of mouse in terminal vim
set mouse=a

" use jk kj as an alternatives to <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

" this helps us stay within 80 columns, required by coding standards
set colorcolumn=81
hi ColorColumn ctermbg=black

" have vim copy/paste y/p use the system clipboard
" http://stackoverflow.com/questions/8757395/can-vim-use-the-system-clipboards-by-default
set clipboard=unnamedplus

" http://vimcasts.org/episodes/tabs-and-spaces/
set expandtab " use spaces for tabs
set tabstop=2 " number of spaces to use for tabs
set shiftwidth=2 " number of spaces to autoindent
set softtabstop=2 " number of spaces for a tab
set autoindent " set autoindenting on

" line numbering
set relativenumber

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" gives tab completion for :find, :e
:set wildmenu

:set incsearch
:set smartcase

" undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file. 
" These files contain undo information so you can undo previous actions even 
" after you close and reopen a file
set undofile

" set up syntastic for drupal syntax checking
let g:syntastic_phpcs_conf="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"

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

" http://vim.wikia.com/wiki/Diff_current_buffer_and_the_original_file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" Commented out because it was causing this error when switching in the
" Quickfix list:
" Error detected while processing function <SNR>26_ToggleWhitespaceMatch
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()
