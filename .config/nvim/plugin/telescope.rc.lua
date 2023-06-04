-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end
local builtin = require("telescope.builtin")

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
			},
		},
		file_ignore_patterns = {
			"node_modules",
			".git",
			".next",
		},
		extensions = {
			file_browser = {
				theme = "ivy",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")

-- vim.keymap.set('n', '<leader>f',
--   function()
--     builtin.find_files({
--       no_ignore = false,
--       hidden = true
--     })
--   end)
-- vim.keymap.set('n', '<leader>r', function()
--   builtin.live_grep()
-- end)
vim.keymap.set("n", "\\\\", function()
	builtin.buffers()
end)
vim.keymap.set("n", "<leader>t", function()
	builtin.help_tags()
end)
vim.keymap.set("n", "<leader>e", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
	})
end)
