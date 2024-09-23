return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      ruby_lsp = {
        enabled = lsp == "ruby_lsp",
      },
      solargraph = {
        enabled = lsp == "solargraph",
      },
      rubocop = {
        enabled = formatter == "rubocop",
      },
      standardrb = {
        enabled = formatter == "standardrb",
      },
    },
  },
}
