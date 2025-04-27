vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true 
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.sw = 2

-- vim.o.scrolloff = 999
-- vim.api.nvim_create_autocmd({"CursorMoved" },{
--     pattern = "*",
--     callback = function()
--         vim.cmd("normal! zz")
--     end
-- })
vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  callback = function()
    local winview = vim.fn.winsaveview()
    if math.abs(vim.fn.line('.') - winview.topline) > 10 then
      vim.cmd("normal! zz")
    end
  end,
})
