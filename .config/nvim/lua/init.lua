vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

requires = {"tami5/sqlite.lua"}

require("telescope").setup({
	defaults = {
                file_ignore_patterns = {".ttf", ".otf", ".png", ".mp4", ".icon.js", ".svg", ".git", "trade/*"},
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
                frecency = {
                  show_scores = true,
                  show_unindexed = true,
                  ignore_patterns = {"*.git/*", "*/tmp/*", "*.svg", "*.d.ts", "*.otf", "*.ttf"},
                  disable_devicons = false,
                  workspaces = {
                    ["conf"]    = "$HOME/.conf",
                    ["riemann"]    = "Users/aran/dev/riemann",
                }
            }
	},
})

require('telescope').load_extension('fzy_native')
require("telescope").load_extension("frecency")

require'nvim-web-devicons'

require"octo".setup({
  default_remote = {"upstream", "origin"}; -- order to try remotes
  reaction_viewer_hint_icon = "";         -- marker for user reactions
  user_icon = " ";                        -- user icon
  timeline_marker = "";                   -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = "";            -- Bubble delimiter
  left_bubble_delimiter = "";             -- Bubble delimiter
  github_hostname = "";                    -- GitHub Enterprise host
  snippet_context_lines = 4;               -- number or lines around commented lines
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = false                       -- use web-devicons in file panel
  }
})
