-- Remove espaços em branco no fim das linhas antes de salvar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Destaca brevemente o texto copiado (yank)
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Realçar texto copiado",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})
