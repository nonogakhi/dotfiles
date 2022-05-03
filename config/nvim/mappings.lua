-- remove default bindings
vim.keymap.del("n", "<C-Down>")
vim.keymap.del("n", "<C-Left>")
vim.keymap.del("n", "<C-Right>")
vim.keymap.del("n", "<C-Up>")
vim.keymap.del("n", "<C-\\>")
vim.keymap.del("n", "<C-q>")
vim.keymap.del("n", "<C-s>")
vim.keymap.del("v", "<")
vim.keymap.del("v", ">")

-- navigating wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj", { desc = "Nagivate down" })
vim.keymap.set({ "n", "v" }, "k", "gk", { desc = "Navigate up" })

-- easy splits
vim.keymap.set("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
