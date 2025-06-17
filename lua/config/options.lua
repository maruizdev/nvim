vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
-- vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.sw = 2

vim.o.showtabline = 2  -- Siempre mostrar la tabline

vim.o.tabline = "%!v:lua.TabLine()"

function _G.TabLine()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local path = vim.fn.bufname(bufnr)

    local display
    if path == '' then
      display = '[No Name]'
    else
      local dir = vim.fn.fnamemodify(path, ':h:t') -- último directorio
      local file = vim.fn.fnamemodify(path, ':t')  -- nombre del archivo
      display = dir .. '/' .. file
    end

    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end
    s = s .. '%' .. i .. 'T' .. ' ' .. i .. ': ' .. display .. ' '
  end
  s = s .. '%#TabLineFill#'
  return s
end
