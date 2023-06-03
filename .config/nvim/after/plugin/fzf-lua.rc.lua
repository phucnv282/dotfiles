local status, fzf = pcall(require, "fzf-lua")
if (not status) then return end

fzf.setup({
  'fzf-native'
})

vim.keymap.set("n", ";f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", ";r", "<cmd>lua require('fzf-lua').live_grep()<CR>", {})
