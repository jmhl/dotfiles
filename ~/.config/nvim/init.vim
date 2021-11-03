set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "css", "graphql", "javascript", "json", "scss", "typescript", "yaml" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
