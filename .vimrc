set nocompatible

" Automagically install `vim-plug` if it does not exist
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
" For pretty printing JSON: \gqaj
Plug 'tpope/vim-jdaddy'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'bronson/vim-trailing-whitespace'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'wellle/targets.vim'
Plug 'elzr/vim-json'
Plug 'prettier/vim-prettier'
" Install `fzf`
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'embear/vim-localvimrc'
call plug#end()

syntax enable
filetype plugin indent on

" allow relative number
set nonumber
set relativenumber
set ruler
set smarttab
set ignorecase smartcase
set autoindent
set backspace=indent,eol,start
" Display real tabs as 2 spaces
set tabstop=2
set shiftwidth=2

" use silver searcher
set grepprg=ag

" Use tabs for json files too
" au FileType json setl sw=2 sts=2 et
" Use 2 spaces for terraform files
au FileType tf setl sw=2 sts=2 et

" use ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" maps ; to :
nnoremap ; :
" map easier swapping between split panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tcomment
runtime bundles/tplugin_vim/macros/tplugin.vim

" spell checking and text wrapping for commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" use silver searcher for ctrl+p
" this is just the best
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  " .gitignore. Also ignores common directories.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""  --ignore-dir "bower_components"  --ignore-dir "node_modules"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Don't syntax highlight for super long columns
set synmaxcol=250

let g:javascript_plugin_jsdoc = 1

" Git specific configuration
" let git_path = system("git rev-parse --show-toplevel 2>/dev/null")
" let git_vimrc = substitute(git_path, '\n', '', '') . "/.vimrc"
" if !empty(glob(git_vimrc))
"     exec ":source " . git_vimrc
" endif

" Enable line numbers in explore mode
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

let g:localvimrc_sandbox = 0
let g:localvimrc_whitelist=['']
