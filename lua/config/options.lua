-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.statuscolumn = "%s %l %r"
-- LSP Server to use for Ruby.
-- Set to "solargraph" to use solargraph instead of ruby_lsp.
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"
-- vim.cmd.colorscheme = "catppuccin-macchiato"
-- vim.cmd.colors_name = "catppuccino-macchiato"
-- vim.g.colors_name = "catppuccino-macchiato"
