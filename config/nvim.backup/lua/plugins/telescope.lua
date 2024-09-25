return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<Leader>s", builtin.find_files, {})
			vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-project.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					project = {
						hidden_files = true,
						order_by = "asc",
						search_by = "title",
						on_project_selected = function(prompt_bufnr)
							project_actions.change_working_directory(prompt_bufnr, false)
							require("harpoon.ui").nav_file(1)
						end,
					},
				},
			})
			require("telescope").load_extension("project")
		end,
	},
}
