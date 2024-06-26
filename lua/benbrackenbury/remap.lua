vim.g.mapleader = " "

-- Open Neotree with <leader>e
-- vim.keymap.set("n", "<leader>e", function()
--     vim.cmd("Rex")
-- end)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-t>", function()
    vim.cmd("tabnew")
end)
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("tabnext")
end)

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>fm", function()
	vim.lsp.buf.format() 
end)


for _, mode in pairs({ 'n', 'v', 'x' }) do
    for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
        vim.keymap.set(mode, key, '<nop>')
    end
end


vim.keymap.set("n", "<leader>h", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
