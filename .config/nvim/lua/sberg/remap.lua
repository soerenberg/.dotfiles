vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", ":w!<cr>")
vim.keymap.set("n", "<leader>wq", ":wq<cr>")
vim.keymap.set("i", "<c-u>", "<esc>b<c-v>eUea")

vim.keymap.set("n", "<leader>gh", ":diffget //3<CR>")
vim.keymap.set("n", "<leader>gu", ":diffget //2<CR>")
vim.keymap.set("n", "<leader>gs", ":G<CR>")
