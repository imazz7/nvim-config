return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar arquivos" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto no projeto" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buscar entre buffers abertos" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Buscar na ajuda" },
  },
  config = function()
    require("telescope").setup({})
  end,
}
