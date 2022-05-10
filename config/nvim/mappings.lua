-- remove default bindings
vim.keymap.del("n", "<C-Down>")
vim.keymap.del("n", "<C-Left>")
vim.keymap.del("n", "<C-Right>")
vim.keymap.del("n", "<C-Up>")
vim.keymap.del("n", "<C-q>")
vim.keymap.del("n", "<C-s>")
vim.keymap.del("v", "<")
vim.keymap.del("v", ">")
vim.keymap.del("t", "<esc>")
vim.keymap.del("t", "jk")
vim.keymap.del("n", "<leader>c")
vim.keymap.del("n", "<leader>h")
if require("core.utils").is_available "nvim-toggleterm.lua" then
  vim.keymap.del("n", "<C-\\>")
end
if require("core.utils").is_available "telescope.nvim" then
  vim.keymap.del("n", "<leader>fh")
  vim.keymap.del("n", "<leader>sb")
  vim.keymap.del("n", "<leader>sc")
  vim.keymap.del("n", "<leader>sh")
  vim.keymap.del("n", "<leader>sk")
  vim.keymap.del("n", "<leader>sm")
  vim.keymap.del("n", "<leader>sn")
  vim.keymap.del("n", "<leader>sr")
end

-- resize with arrows
vim.keymap.set("n", "<Up>", function()
  require("smart-splits").resize_up(2)
end, { desc = "Resize split up" })
vim.keymap.set("n", "<Down>", function()
  require("smart-splits").resize_down(2)
end, { desc = "Resize split down" })
vim.keymap.set("n", "<Left>", function()
  require("smart-splits").resize_left(2)
end, { desc = "Resize split left" })
vim.keymap.set("n", "<Right>", function()
  require("smart-splits").resize_right(2)
end, { desc = "Resize split right" })

-- navigating wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj", { desc = "Nagivate down" })
vim.keymap.set({ "n", "v" }, "k", "gk", { desc = "Navigate up" })

-- easy splits
vim.keymap.set("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })

-- line text-objects
vim.keymap.set("x", "il", "g_o^", { desc = "Inside line text object" })
vim.keymap.set("o", "il", ":normal vil<cr>", { desc = "Inside line text object" })
vim.keymap.set("x", "al", "$o^", { desc = "Around line text object" })
vim.keymap.set("o", "al", ":normal val<cr>", { desc = "Around line text object" })

-- more in/all objects between 2 characters
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    vim.keymap.set(mode, "i" .. char, (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char))
    vim.keymap.set(mode, "a" .. char, (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char))
  end
end

-- terminal mappings
vim.keymap.set("t", "<leader><esc>", "<c-\\><c-n>", { desc = "Terminal normal mode" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>:q<cr>", { desc = "Terminal quit" })

-- Treesitter Surfer
vim.keymap.set("x", "J", function()
  require("syntax-tree-surfer").surf("next", "visual")
end, { desc = "Surf next tree-sitter object" })
vim.keymap.set("x", "K", function()
  require("syntax-tree-surfer").surf("prev", "visual")
end, { desc = "Surf previous tree-sitter object" })
vim.keymap.set("x", "H", function()
  require("syntax-tree-surfer").surf("parent", "visual")
end, { desc = "Surf parent tree-sitter object" })
vim.keymap.set("x", "L", function()
  require("syntax-tree-surfer").surf("child", "visual")
end, { desc = "Surf child tree-sitter object" })
vim.keymap.set("x", "<c-j>", function()
  require("syntax-tree-surfer").surf("next", "visual", true)
end, { desc = "Surf next tree-sitter object" })
vim.keymap.set("x", "<c-l>", function()
  require("syntax-tree-surfer").surf("next", "visual", true)
end, { desc = "Surf next tree-sitter object" })
vim.keymap.set("x", "<c-k>", function()
  require("syntax-tree-surfer").surf("prev", "visual", true)
end, { desc = "Surf previous tree-sitter object" })
vim.keymap.set("x", "<c-h>", function()
  require("syntax-tree-surfer").surf("prev", "visual", true)
end, { desc = "Surf previous tree-sitter object" })
vim.keymap.set("n", "<c-down>", function()
  require("syntax-tree-surfer").move("n", false)
end, { desc = "Swap next tree-sitter object" })
vim.keymap.set("n", "<c-right>", function()
  require("syntax-tree-surfer").move("n", false)
end, { desc = "Swap next tree-sitter object" })
vim.keymap.set("n", "<c-up>", function()
  require("syntax-tree-surfer").move("n", true)
end, { desc = "Swap previous tree-sitter object" })
vim.keymap.set("n", "<c-left>", function()
  require("syntax-tree-surfer").move("n", true)
end, { desc = "Swap previous tree-sitter object" })
