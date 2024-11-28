return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "zidhuss/neotest-minitest",
    "olimorris/neotest-rspec",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-minitest")({
          test_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rails",
              "test",
            })
          end,
        }),
        -- require("neotest-rspec")({
        --   rspec_cmd = function()
        --     return vim.tbl_flatten({
        --       "bundle",
        --       "exec",
        --       "rspec",
        --     })
        --   end,
        -- }),
      },
    })
  end,
}
