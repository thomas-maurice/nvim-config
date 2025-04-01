-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = {
  "ansiblels",
  "bashls",
  "buf_ls",
  "docker_compose_language_service",
  "dockerls",
  "gopls",
  "graphql",
  "helm_ls",
  "jsonls",
  "lua_ls",
  "pylsp",
  "pyre",
  "sqls",
  "terraformls",
  "ts_ls",
  "vuels",
  "yamlls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.gopls.setup = {
  filetypes = { "gomod", "go", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        appends = true,
        assign = true,
        bools = true,
        deepequalerrors = true,
        defers = true,
        deprecated = true,
        unusedparams = true,
      },
    },
  },
}

-- as per https://github.com/neovim/nvim-lspconfig/issues/3189
local homedir = vim.fn.expand "$HOME"
local runtime_files = vim.api.nvim_get_runtime_file("", true)
for k, v in ipairs(runtime_files) do
  if v == homedir .. "/.config/nvim/after" or v == homedir .. "/.config/nvim" then
    table.remove(runtime_files, k)
  end
end

lspconfig.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        -- library = {
        --  vim.env.VIMRUNTIME,
        --  -- Depending on the usage, you might want to add additional paths here.
        --  "${3rd}/luv/library",
        --  "${3rd}/busted/library",
        -- },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true),
        library = runtime_files,
      },
    })
  end,
  settings = {
    Lua = {},
  },
}

vim.diagnostic.config { virtual_lines = false, virtual_text = true }
