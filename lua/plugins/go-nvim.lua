return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    -- not sure this would interfere with the nvchad ui
    --  "ray-x/guihua.lua",
    -- lspconfig and treesitter are there by default already
    -- thanks to nvchad
    --  "neovim/nvim-lspconfig",
    --  "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
