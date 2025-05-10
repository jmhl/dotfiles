set nocompatible

" Automagically install `vim-plug` if it does not exist
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Must be enabled before ALE is loaded.
" To use another autocompletion source with ALE, this must be disabled or
" removed.
let g:ale_completion_enabled = 1

call plug#begin('~/.vim/plugged')
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
" For pretty printing JSON: \gqaj
Plug 'tpope/vim-jdaddy'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'bronson/vim-trailing-whitespace'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'wellle/targets.vim'
Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" Plug 'jparise/vim-graphql'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'vim-scripts/VimCompletesMe'
Plug 'fatih/vim-go'

if has('nvim')
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	" Start with `:MarkdownPreview`
	" Stop with `:MarkdownPreviewStop`
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
endif
call plug#end()

syntax enable
filetype plugin indent on

" Hybrid - relative lines with the current line number instead of 0
" turn hybrid line numbers on
set number relativenumber
set nu rnu

set ruler
set smarttab
set ignorecase smartcase
set autoindent
set backspace=indent,eol,start
" Display real tabs as 2 spaces
set tabstop=2
set shiftwidth=2

" Make nvim not look like shit
colorscheme vim

" use ripgrep
set grepprg=rg

" Use 2 spaces for terraform & json files
au FileType json setl tabstop=4 sw=4 sts=4 noexpandtab
au Filetype tf setl tabstop=4 sw=4 sts=4 noexpandtab
au Filetype terraform setl tabstop=4 sw=4 sts=4 noexpandtab
au Filetype gql setl tabstop=4 sw=4 sts=4 noexpandtab
au Filetype graphql setl tabstop=4 sw=4 sts=4 noexpandtab

" maps ; to :
nnoremap ; :
" map easier swapping between split panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tcomment
runtime bundles/tplugin_vim/macros/tplugin.vim

" Spell checking and text wrapping for commits
autocmd Filetype gitcommit setlocal spell textwidth=72
" Use Vim Command line completion for all filetypes
autocmd FileType vim let b:vcm_tab_complete = 'vim'

" Use ctrl + p or ctrl + t to use `fzf`. `GFiles` excludes anything in
" `.gitignore`
nnoremap <C-T> :GFiles<cr>
nnoremap <C-P> :GFiles<cr>

" Create a new file relative to the current directory
nnoremap <Leader>nf :hide :edit %:h/<cfile><CR>

" Don't syntax highlight for super long columns
set synmaxcol=250

let g:javascript_plugin_jsdoc = 1

" Enable line numbers in explore mode
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

let g:ale_linters = {
			\'graphql': ['eslint'],
			\'javascript': ['eslint'],
			\'javascriptreact': ['eslint'],
			\'javascript.jsx': ['eslint'],
			\'html': ['eslint'],
			\'typescript': ['eslint'],
			\'typescriptreact': ['eslint'],
			\'typescript.jsx': ['eslint'],
			\}
" Lint only on enter and save
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
" let g:ale_fix_on_save = 1
" Fixers to use when using `ALEFix`
let g:ale_fixers = {
			\'css': ['prettier'],
			\'scss': ['prettier'],
			\'graphql': ['prettier'],
			\'javascript': ['prettier'],
			\'javascriptreact': ['prettier'],
			\'javascript.jsx': ['prettier'],
			\'html': ['prettier'],
			\'markdown': ['prettier'],
			\'md': ['prettier'],
			\'typescript': ['prettier'],
			\'typescriptreact': ['prettier'],
			\'typescript.jsx': ['prettier'],
			\}
let g:ale_javascript_prettier_executable = 'prettier/bin/prettier.cjs'
let g:ale_javascript_prettier_options = '--arrow-parents=avoid --print-width=120 --single-quote=true --use-tabs=true'

let g:coc_global_extensions = ['coc-tsserver']

let g:terraform_align = 1

" Remove deprecation message
let g:snipMate = { 'snippet_version' : 1 }

" Shorter commands for MarkdownPreview
command MDP MarkdownPreview
command MDPS MarkdownPreviewStop
command MDPT MarkdownPreviewToggle

" Stolen from: https://vim.fandom.com/wiki/Pretty-formatting_XML
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" lightline.vim config
function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')

  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif

  return expand('%')
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
			\   	[ 'mode', 'paste' ],
      \     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \   ],
			\ 	'right': [
			\     [ 'lineinfo' ],
      \     [ 'percent' ], [ 'filetype' ]
      \   ]
      \ },
      \ 'component_function': {
			\   'filename': 'LightlineFilename',
      \   'filetype': 'LightlineFiletype',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
