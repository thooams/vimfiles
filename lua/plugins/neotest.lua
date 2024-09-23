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
        ["neotest-rspec"] = {
          -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
          -- rspec_cmd = function()
          --   return vim.tbl_flatten({
          --     "bundle",
          --     "exec",
          --     "rspec",
          --   })
          -- end,
        },
      },
    })
  end,
}
