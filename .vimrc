set nocompatible

execute pathogen#infect()
"VimClojure
"ctrlp.vim
"tcomment_vim
"vim-airline
"vim-elixir
"vim-go
"vim-jade
"vim-projectionist
"vim-rake
"snipmate.vim
"tmuxline.vim
"vim-coffee-script
"vim-flake8
"vim-haml
"vim-pathogen
"vim-rails
"vim-surround
"emmet.vim
"vim-css-color
"vim-jsx
"vim-javascript-syntax
"vim-trailing-whitespace
"vim-fugitive
"targets.vim
"vim-argwrap
"vim-json
"vim-racket
"elm.vim
"vim-jsx
"vim-swift
"vim-terraform
"vim-localvimrc

syntax enable
filetype plugin indent on

" allow relative number
set nonumber
set relativenumber
set ruler
set sw=2
set softtabstop=2
set expandtab
set smarttab
set ignorecase smartcase
set autoindent
set backspace=indent,eol,start

" vim go prefs
let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 0

" use silver searcher
set grepprg=ag

" use ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" go lint, run with :Lint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" maps ; to :
nnoremap ; :
" map easier swapping between split panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tcomment
runtime bundles/tplugin_vim/macros/tplugin.vim

" four spaces for go that will write to disk as tabs
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
" four spaces for py files
au Filetype python setl et ts=4 sw=4

" spell checking and text wrapping for commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" remove trailing whitespace on save for ruby files
au BufWritePre *.rb :%s/\s\+$//e

" syntax highlighting
au BufNewFile,BufRead *.hamlc set filetype=haml
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.ex set filetype=elixir
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

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

" map argwrap to ctrl+a
nnoremap <C-A> :ArgWrap<CR>

" Don't syntax highlight for super long columns
set synmaxcol=250

" Config for vim-localvimrc -- create a .lvimrc file in any directory
" Don't rum vim-localvimrc in sandbox mode
let g:localvimrc_sandbox = 0
" To avoid vim-localvimrc asking for confirmation before loading a local vimrc
" List of absolute paths to directories contains .lvimrc files
let g:localvimrc_whitelist=[]
