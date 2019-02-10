
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" 把要安裝的套件寫在這裡
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

nnoremap <silent> <F5> :NERDTree<CR>

syntax on

set showcmd		" Show (partial) command in status line.
" blue      default  desert   evening   koehler  murphy  peachpuff  ron    slate  zellner
" darkblue  delek    elflord  industry  morning  pablo   README.txt     shine  torte
colorscheme koehler
set nu
set tabstop=2
set shiftwidth=4
set autoindent
set nowrap
