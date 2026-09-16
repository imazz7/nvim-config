local opt = vim.opt

-- Números de linha
opt.number = true
opt.relativenumber = true

-- Indentação
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Visual
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.guicursor = {
  "n-v-c:underline-blinkwait700-blinkoff400-blinkon250",
  "i-ci-ve:underline-blinkwait700-blinkoff400-blinkon250",
  "r-cr:underline-blinkwait700-blinkoff400-blinkon250",
}

-- Arquivos temporários (evita lixo no diretório do projeto)
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Splits abrem do jeito mais intuitivo
opt.splitright = true
opt.splitbelow = true

-- Clipboard do sistema (copiar/colar fora do NeoVim)
opt.clipboard = "unnamedplus"

-- Busca
opt.ignorecase = true
opt.smartcase = true
