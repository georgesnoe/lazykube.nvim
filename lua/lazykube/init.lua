local M = {}

M.default_options = {
	keymap = "<leader>lk",
	cmd = "lazykube",
	border = "single",
}

M.options = M.default_options
local lazykube = nil

M.setup = function(options)
	--- Clone options and replace empty ones with default ones
	M.options = vim.tbl_deep_extend("keep", options or {}, M.default_options)
	-- Register command
	vim.cmd("command! Lazykube lua require('lazykube').open()")
	-- Pressing <leader>lk will open Lazykube
	vim.keymap.set("n", M.options.keymap, "<cmd>Lazykube<CR>", { desc = "Open Lazykube" })
end

M.open = function()
	local Terminal = require("toggleterm.terminal").Terminal

	-- Close Lazykube if it's already open, open a new one if it's not
	if lazykube and lazykube:is_open() then
		lazykube:close()
		lazykube = nil
	else
		lazykube = Terminal:new({
			cmd = M.options.cmd,
			direction = "float",
			float_opts = { border = M.options.border },
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		})
		return lazykube:toggle()
	end
end

return M
