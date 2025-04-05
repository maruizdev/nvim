--nvim-tree
vim.keymap.set("n", "<F3>", function() 
		vim.cmd("NvimTreeToggle")
end)
-- vim.keymap.set("n", "<F4>", function() 
-- 		vim.cmd("NvimTreeClose")
-- end)
vim.keymap.set("n", "<F2>", function() 
		vim.cmd("NvimTreeFindFile")
end)
-- vim.keymap.set("n", "<leader>e", function() 
-- 		vim.cmd("Neotree")
-- end)
-- vim.keymap.set("n", "<leader>w", function() 
-- 		vim.cmd("Neotree focus")
-- end)
-- vim.keymap.set("n", "<leader>r", function() 
-- 		vim.cmd("Neotree close")
-- end)

-- Hide open file
-- vim.cmd([[
-- augroup CloseNeoTree
--   autocmd!
--   autocmd BufEnter * if bufwinnr('neo-tree') > 0 | exe 'Neotree close' | endif
-- augroup END
-- ]])

--Move 
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move left" })
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move down" })
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move up" })
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move right" })


--vim.keymap.set("n","<c-s>")
-- Tabs
vim.keymap.set('n',"<Tab>", ":tabnext<CR>", {noremap =true})
vim.keymap.set('n',"<S-Tab>", ":tabprevious<CR>", {noremap =true})
vim.keymap.set('n',"<S-t>", ":tabnew<CR>", {noremap =true, silent = true})

-- bufferline 
--[[ vim.keymap.set('n',"<Tab>", ":BufferLineCycleNext<CR>", {noremap =true, silent = true})
vim.keymap.set('n',"<S-Tab>", ":BufferLineCyclePrev<CR>", {noremap =true, silent = true})
vim.keymap.set('n',"<F4>", ":Bdelete<CR>", {noremap =true, silent = true}) ]]

--save file
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('i', '<C-s>', '<esc>:w<CR>', opts)

--aerial
vim.keymap.set("n", "<leader>m", "<cmd>AerialToggle!<CR>")

--prettier
vim.keymap.set('n', "<F4>", ":Prettier<CR>", {noremap = true, silent = true})
vim.keymap.set('x', "<F4>", ":Prettier<CR>", {noremap = true, silent = true})


