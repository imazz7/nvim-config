return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- Apenas os servidores necessários para C, C++ e JavaScript.
      ensure_installed = { "clangd", "ts_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- clangd é o servidor LSP; GCC/G++ continuam sendo o toolchain usado
      -- para compilar e também pelo clangd para descobrir os includes.
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--query-driver=C:/msys64/ucrt64/bin/gcc.exe,C:/msys64/ucrt64/bin/g++.exe",
        },
        filetypes = { "c", "cpp" },
      })
      vim.lsp.enable("clangd")

      -- JavaScript
      vim.lsp.config("ts_ls", {
        filetypes = { "javascript", "javascriptreact" },
      })
      vim.lsp.enable("ts_ls")

      -- Atalhos criados só no buffer onde o LSP anexa
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })
    end,
  },
}
