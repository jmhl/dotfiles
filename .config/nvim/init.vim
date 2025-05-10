set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'bash', 'css', 'dockerfile', 'gitcommit', 'gitignore', 'graphql', 'html', 'javascript', 'json', 'lua', 'markdown', 'python', 'regex', 'scss', 'terraform', 'tsx', 'typescript', 'vim', 'xml', 'yaml' },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

-- Disable neovim's ugly theming
vim.cmd.colorscheme('vim')
vim.opt.termguicolors = false

vim.g.editorconfig = false
EOF
