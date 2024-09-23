local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp"
  },
  cond = not os.getenv("LIGHT_NVIM")
}

function M.config()
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")
  local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true
  lsp_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
  mason_lspconfig.setup({
    automatic_installation = true,
    ensure_installed = {
      'angularls',
      'ansiblels',
      'bashls',
      'clangd',
      'cssls',
      'dockerls',
      'eslint',
      'gopls',
      'html',
      'jsonls',
      'lua_ls',
      'marksman',
      'pylsp',
      'rust_analyzer',
      'solargraph',
      'sqlls',
      'stimulus_ls',
      'tailwindcss',
      'ts_ls',
      'yamlls'
    }
  })
  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup {
        capabilities = lsp_capabilities,
        flags = { debounce_text_changes = 150 }
      }
    end,
    ["solargraph"] = function()
      lspconfig.solargraph.setup({
        capabilities = lsp_capabilities,
        flags = { debounce_text_changes = 150 },
        -- cmd = { os.getenv("HOME") .. "/.asdf/shims/solargraph", 'stdio' },
        cmd = { "asdf", "exec", "solargraph", "stdio" },
        settings = {
          solargraph = {
            useBundler = true,
            diagnostic = true,
            completion = true,
            hover = true,
            formatting = true,
            symbols = true,
            definitions = true,
            rename = true,
            references = true,
            folding = true
          }
        }
      })
    end,
    ["html"] = function()
      lspconfig.html.setup({
        capabilities = lsp_capabilities,
        filetypes = { "html" }
      })
    end,
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            diagnostics = {
              globals = { "vim" }
            },
            telemetry = {
              enable = false
            }
          }
        }
      })
    end
  })

  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })
end

return M
