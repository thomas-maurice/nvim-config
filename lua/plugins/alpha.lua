return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local logo = [[
                  █████ █     ██                           █████ █      ██
           ██████  ██    ████ █                     ██████  █    █████    █
          ██   █  █ ██    ████                     ██   █  █       █████ ███
         █    █  █  ██    █ █                     █    █  ██       █ ██   █
             █  █    ██   █                ████       █  ███      █   █
            ██ ██    ██   █       ███     █ ███  █   ██   ██      █     ███    ███ ████ ████
            ██ ██     ██  █      █ ███   █   ████    ██   ██      █      ███    ███ ████ ███  █
            ██ ██     ██  █     █   ███ ██    ██     ██   ██     █        ██     ██  ████ ████
            ██ ██      ██ █    ██    █████    ██     ██   ██     █        ██     ██   ██   ██
            ██ ██      ██ █    ████████ ██    ██     ██   ██     █        ██     ██   ██   ██
            █  ██       ███    ███████  ██    ██      ██  ██    █         ██     ██   ██   ██
               █        ███    ██       ██    ██       ██ █     █         ██     ██   ██   ██
           ████          ██    ████    █ ██████         ███     █         ██     ██   ██   ██
          █  █████              ███████   ████           ███████          ███ █  ███  ███  ███
         █     ██                █████                     ███             ███    ███  ███  ███
         █
          █
           ██
    ]]

    local colors = {
      "#FF6F61",
      "#FFB347",
      "#FFD700",
      "#FF69B4",
      "#FF4500",
      "#00FFFF",
      "#00CED1",
      "#7FFFD4",
      "#ADFF2F",
      "#32CD32",
      "#00FF7F",
      "#8A2BE2",
      "#BA55D3",
      "#DA70D6",
      "#EE82EE",
      "#9370DB",
      "#8B008B",
      "#FF6347",
      "#FF8C00",
      "#FFA500",
      "#1E90FF",
      "#00BFFF",
      "#4682B4",
      "#5F9EA0",
      "#7B68EE",
      "#6A5ACD",
      "#483D8B",
      "#7FFF00",
      "#00FA9A",
      "#20B2AA",
    }

    local hlgroups = {}

    for idx, color in ipairs(colors) do
      hlgroups["AlphaHeader" .. idx] = color
      vim.api.nvim_set_hl(0, "AlphaHeader" .. idx, { fg = color })
    end

    _G.random_header_color = function()
      math.randomseed(os.time())
      local picked = colors[math.random(#colors)]
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = picked })
    end

    _G.open_config_directory = function()
      vim.cmd("cd " .. vim.fn.stdpath "config")
      vim.cmd "NvimTreeFocus"
    end

    _G.open_nix_config_directory = function()
      vim.cmd("cd " .. vim.fn.expand "${HOME}/.config/home-manager")
      vim.cmd "NvimTreeFocus"
    end

    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.header.opts.hl = "AlphaHeader"

    ---@type uv.uv_timer_t?
    local timer = nil

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        timer = vim.loop.new_timer()
        if timer ~= nil then
          timer:start(
            0,
            1000,
            vim.schedule_wrap(function()
              dashboard.section.header.opts.hl = "AlphaHeader" .. math.random(#colors)
              alpha.redraw()
            end)
          )
        end
      end,
    })

    -- Stop and clean up timer when alpha is closed
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaClosed",
      callback = function()
        if timer then
          timer:stop()
          timer:close()
        end
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        -- dashboard.section.footer.val = "⚡ Neovim loaded "
        local footer = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
        dashboard.section.footer.val = footer
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Search for a file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("r", "󱫤  Recent files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("g", "  Grep for a word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("h", "󰌌  Key mappings and cheat sheet", "<cmd>NvCheatsheet<CR>"),
      dashboard.button("L", "󰅢  Lazy package manager", "<cmd>Lazy<CR>"),
      dashboard.button("M", "  Mason tools and binaries manager", "<cmd>Mason<CR>"),
      dashboard.button("c", "  Edit Neovim configuration", "<cmd>lua _G.open_config_directory()<CR>"),
      dashboard.button("n", "󱄅  Edit Nix configuration", "<cmd>lua _G.open_nix_config_directory()<CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.config)

    _G.random_header_color()

    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
