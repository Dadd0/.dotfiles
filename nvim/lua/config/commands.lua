-- Remove installed plugins that are no longer in the config
vim.api.nvim_create_user_command("DeleteUnusedPlugins", function()
  local unused = vim.tbl_filter(function(plug)
    return not plug.active
  end, vim.pack.get())
  if #unused == 0 then
    vim.notify("No unused plugins to remove")
    return
  end
  local names = vim.tbl_map(function(plug)
    return plug.spec.name
  end, unused)
  vim.pack.del(names)
  vim.notify("Removed unused plugins: " .. table.concat(names, ", "))
end, { desc = "Remove installed plugins that are no longer in the config" })
