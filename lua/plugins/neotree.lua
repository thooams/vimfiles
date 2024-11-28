return {
  -- change trouble config
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- opts will be merged with the parent spec
    opts = {
      filesystem = {
        follow_current_file = { enabled = false },
      },
    },
  },
}
