-- Precisa ser definido antes do lazy.nvim carregar os plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Árvore de arquivos
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Alternar árvore de arquivos" })

-- Compilar e rodar arquivo atual com F5, dependendo da linguagem
-- Ajuste os caminhos dos compiladores conforme seu sistema (aqui: Windows + MSYS2 UCRT64)
local function run_current_file()
  vim.cmd("w") -- salva antes de rodar

  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  local file_no_ext = vim.fn.expand("%:r")

  local cmd

  if ft == "c" then
    local gcc = "C:/msys64/ucrt64/bin/gcc.exe"
    local output = file_no_ext .. ".exe"
    cmd = string.format('"%s" "%s" -o "%s" && "%s"', gcc, file, output, output)
  elseif ft == "cpp" then
    local gpp = "C:/msys64/ucrt64/bin/g++.exe"
    local output = file_no_ext .. ".exe"
    cmd = string.format('"%s" "%s" -o "%s" && "%s"', gpp, file, output, output)
  elseif ft == "javascript" then
    cmd = string.format('node "%s"', file)
  else
    vim.notify("Sem comando de execução configurado para o filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  vim.cmd("split")
  vim.cmd("wincmd j")
  vim.cmd("resize 12")
  vim.fn.termopen(cmd)
  vim.cmd("startinsert")
end

map("n", "<F5>", run_current_file, { desc = "Compilar/rodar arquivo atual" })

-- Navegação entre janelas
map("n", "<C-h>", "<C-w>h", { desc = "Ir para janela à esquerda" })
map("n", "<C-l>", "<C-w>l", { desc = "Ir para janela à direita" })
map("n", "<C-j>", "<C-w>j", { desc = "Ir para janela abaixo" })
map("n", "<C-k>", "<C-w>k", { desc = "Ir para janela acima" })

-- Sair do modo terminal com Esc
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Sair do modo terminal" })
