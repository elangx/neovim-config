-- Create group to assign commands
-- "clear = true" must be set to prevent loading an
-- auto-command repeatedly every time a file is resourced
-- local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.cmd('GoFmt')
  end,
  group = format_sync_grp,
})