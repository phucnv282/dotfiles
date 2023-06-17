local status, fzf = pcall(require, "fzf-lua")
if not status then
	return
end

fzf.setup({
	files = {
		fd_opts = "--color=never --type f --hidden --follow -E .git -E node_modules -E .next -E .idea",
	},
	grep = {
		rg_opts = "-g '!.git' -g '!node_modules' -g '!.idea' --column --line-number --no-heading --color=always --smart-case --max-columns=4096",
	},
})

vim.keymap.set("n", ";f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", ";r", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
