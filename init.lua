-- ~/.config/nvim/init.lua (Linux/Mac) ou %LOCALAPPDATA%\nvim\init.lua (Windows)
-- Ponto de entrada: só carrega os módulos, a config real fica em lua/config e lua/plugins

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
