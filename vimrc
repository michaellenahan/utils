" ~/.vimrc file should contain this line:
" source ~/utils/vimrc
" ... so that vim settings are taken from this file.

" Useful vim blog posts:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" use jj as an alternative to <ESC>
:inoremap jj <ESC>

" this helps us stay within 80 columns, required by coding standards
set colorcolumn=81
:hi ColorColumn ctermbg=black

" have vim copy/paste y/p use the system clipboard
" http://stackoverflow.com/questions/8757395/can-vim-use-the-system-clipboards-by-default
set clipboard=unnamedplus

" tabs, spaces and indentation
set expandtab " use spaces for tabs
set tabstop=2 " number of spaces to use for tabs
set shiftwidth=2 " number of spaces to autoindent
set softtabstop=2 " number of spaces for a tab
set autoindent " set autoindenting on
