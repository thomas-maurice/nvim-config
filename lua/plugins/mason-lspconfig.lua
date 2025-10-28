local function filter_lsps()
  local to_install = {}
  local lsps = require("configs.lspconfig").lsps_list
  for _, v in ipairs(lsps) do
    if v ~= "nixd" then
      table.insert(to_install, v)
    end
  end

  return to_install
end

return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    ensure_installed = filter_lsps(),
  },
}
