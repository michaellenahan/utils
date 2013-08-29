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

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

if has('gui_running')
  set background=dark
  colorscheme jellybeans
  "colorscheme solarized
  set guioptions-=T
endif

set hidden

" allow use of mouse in terminal vim
set mouse=a

" use jk kj as an alternatives to <ESC>
" commented out because now I'm using caps-lock.
" inoremap jk <ESC>
" inoremap jj <ESC>
" commented out, I don't like the flicker when I type a k.
" I can live with it for j because it's not so common.
"inoremap kj <ESC>

" this helps us stay within 80 columns, required by coding standards
set colorcolumn=81
hi ColorColumn ctermbg=black

" have vim copy/paste y/p use the system clipboard
" http://stackoverflow.com/questions/8757395/can-vim-use-the-system-clipboards-by-default
set clipboard=unnamedplus

" http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" http://vimcasts.org/episodes/tabs-and-spaces/
set expandtab " use spaces for tabs
set tabstop=2 " number of spaces to use for tabs
set shiftwidth=2 " number of spaces to autoindent
set softtabstop=2 " number of spaces for a tab
set autoindent " set autoindenting on

" line numbering
"set relativenumber --- commented out, now I'm going to use :23 to go to a
"line.
set number
" line numbering on netrw
" http://stackoverflow.com/questions/8730702/how-do-i-configure-vimrc-so-that-line-numbers-display-in-netrw-in-vim
let g:netrw_bufsettings = 'noma nomod rnu nobl nowrap ro'

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" gives tab completion for :find, :e
:set wildmenu

:set incsearch
:set ignorecase
:set smartcase

" tab navigation
" http://vim.wikia.com/wiki/Alternative_tab_navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" undofile tells Vim to create <FILENAME>.un~ files whenever you edit a file.
" These files contain undo information so you can undo previous actions even
" after you close and reopen a file
set undofile

" set up syntastic for drupal syntax checking
let g:syntastic_phpcs_conf="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set laststatus=2

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

" automatically apply .vimrc
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ctrl-m to check php syntax
:autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
