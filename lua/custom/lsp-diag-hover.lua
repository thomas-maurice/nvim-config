---comment Returns the diagnostics at the cursor's position
---@return string
local function get_diag_at_cursor()
  local bufnr = vim.api.nvim_get_current_buf()
  local winnr = vim.api.nvim_get_current_win()
  local curx, cury = unpack(vim.api.nvim_win_get_cursor(winnr))
  local diags = vim.diagnostic.get(bufnr, {
    lnum = curx - 1,
  })

  local text = ""

  for _, diag in pairs(diags) do
    text = text .. diag.message .. "[" .. diag.source .. "]" .. "\n"
  end

  return text
end

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
    -- uncomment wenn the notifications don't suck anymore
    --
    -- local diags = get_diag_at_cursor()
    -- if diags == "" then
    --   return
    -- end
    -- vim.notify(diags, "info", {
    --   id = "diag",
    --   title = "Diag",
    --   opts = function(notif)
    --     notif.timeout = 5000
    --   end,
    -- })
  end,
})
