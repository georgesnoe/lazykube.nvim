local M = {}

M.default_options = {
	keymap = "<leader>lg",
	cmd = "gh lazy",
	border = "single",
}

M.options = M.default_options
local lazygithub = nil

M.setup = function(options)
	--- Clone options and replace empty ones with default ones
	M.options = vim.tbl_deep_extend("keep", options or {}, M.default_options)
	-- Register command
	vim.cmd("command! Lazygithub lua require('lazygithub').open()")
	-- Pressing <leader>lg will open Lazygithub
	vim.keymap.set("n", M.options.keymap, "<cmd>Lazygithub<CR>", { desc = "Open Lazygithub" })
end

M.open = function()
	local Terminal = require("toggleterm.terminal").Terminal

	-- Close Lazygithub if it's already open, open a new one if it's not
	if lazygithub and lazygithub:is_open() then
		lazygithub:close()
		lazygithub = nil
	else
		lazygithub = Terminal:new({
			cmd = M.options.cmd,
			direction = "float",
			float_opts = { border = M.options.border },
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		})
		return lazygithub:toggle()
	end
end

return M
