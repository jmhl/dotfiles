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
" alternative method to save
nnoremap <C-S> :w

" tcomment
runtime bundles/tplugin_vim/macros/tplugin.vim

" rails.vim keybindings for working with backbone apps
autocmd User Rails Rnavcommand template    app/assets/templates               -glob=**/*  -suffix=.jst.ejs
autocmd User Rails Rnavcommand jmodel      app/assets/javascripts/models      -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jview       app/assets/javascripts/views       -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jcollection app/assets/javascripts/collections -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jrouter     app/assets/javascripts/routers     -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jspec       spec/javascripts                   -glob=**/*  -suffix=.coffee

" four spaces for python files
autocmd FileType py :setlocal sw=4 ts=4 sts=4

" spell checking and text wrapping for commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" remove trailing whitespace on save for ruby files
au BufWritePre *.rb :%s/\s\+$//e

au BufNewFile,BufRead *.hamlc set filetype=haml
au BufNewFile,BufRead *.js.coffee set filetype=coffee
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.ex set filetype=elixir
