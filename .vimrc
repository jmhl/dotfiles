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

" two spaces for scss/css/rb files
autocmd FileType scss :setlocal sw=2 ts=2 sts=2
autocmd FileType css :setlocal sw=2 ts=2 sts=2
autocmd FileType rb :setlocal sw=2 ts=2 sts=2

" spell checking and text wrapping for commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" remove trailing whitespace on save for ruby files
au BufWritePre *.rb :%s/\s\+$//e

" syntax highlighting
au BufNewFile,BufRead *.hamlc set filetype=haml
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.ex set filetype=elixir
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" use silver searcher or git for ctrl+p
" this is just the best
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
  \ }
endif

" rails.vim keybindings for working with backbone apps
autocmd User Rails Rnavcommand template    app/assets/templates               -glob=**/*  -suffix=.jst.ejs
autocmd User Rails Rnavcommand jmodel      app/assets/javascripts/models      -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jview       app/assets/javascripts/views       -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jcollection app/assets/javascripts/collections -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jrouter     app/assets/javascripts/routers     -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jspec       spec/javascripts                   -glob=**/*  -suffix=.coffee
