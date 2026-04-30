-- ~/.config/yazi/init.lua
-- Some stuff
require("relative-motions"):setup({ show_numbers="relative", show_motion = true, enter_mode ="first", line_numbers_styles = {
		hovered = ui.Style():bold():fg("#e0def4"):reverse(true),
		normal = ui.Style():fg("#6e6a86"),
	}, })
require("full-border"):setup()

--##############
--#Bunny config#
--##############

require("bunny"):setup({
  hops = {
    { key = "/",          path = "/",                                    },
    { key = "t",          path = "/tmp",                                 },
    { key = "h",          path = "~",              desc = "Home"         },
    { key = "m",          path = "~/Music",        desc = "Music"        },
    { key = "d",          path = "~/Desktop",      desc = "Desktop"      },
    { key = "D",          path = "~/Documents",    desc = "Documents"    },
    { key = "c",          path = "~/.config",      desc = "Config files" },
    { key = { "l", "s" }, path = "~/.local/share", desc = "Local share"  },
    { key = { "l", "b" }, path = "~/.local/bin",   desc = "Local bin"    },
    { key = { "l", "t" }, path = "~/.local/state", desc = "Local state"  },
    -- key and path attributes are required, desc is optional
  },
  desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
  ephemeral = false, -- Enable ephemeral hops, default is true
  tabs = true, -- Enable tab hops, default is true
  notify = true, -- Notify after hopping, default is false
  fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})

--#################
--#Git.yazi config#
--#################

th.git = th.git or {}
th.git.modified = ui.Style():fg("#ebbcba")
th.git.modified_sign = "󱇧"

th.git.added = ui.Style():fg("#31748f")
th.git.added_sign = "󰝒"

th.git.untracked = ui.Style():fg("#e0def4")
th.git.untracked_sign = "󰡯"

th.git.ignored = ui.Style():fg("#524f67")
th.git.ignored_sign = "󰘓"

th.git.deleted = ui.Style():fg("#eb6f92")
th.git.deleted_sign = "󰮘"

th.git.updated = ui.Style():fg("#f6c177")
th.git.updated_sign = ""
require("git"):setup()

--#########
--#Yatline#
--#########

require("yatline"):setup({
	--theme = my_theme,
	section_separator = { open = "◖", close = "◗" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "◖", close = "◗" },

	style_a = {
		fg = "black",
		bg_mode = {
			normal = "#ebbcba",
			select = "#c4a7e7",
			un_set = "brightred"
		}
	},
	style_b = { bg = "#26233a", fg = "#e0def4" },
	style_c = { bg = "#1f1d2e", fg = "#e0def4" },

	permissions_t_fg = "green",
	permissions_r_fg = "yellow",
	permissions_w_fg = "red",
	permissions_x_fg = "cyan",
	permissions_s_fg = "white",

	tab_width = 20,
	tab_use_inverse = false,

	selected = { icon = "󰻭", fg = "#c4a7e7" },
	copied = { icon = "", fg = "green" },
	cut = { icon = "", fg = "red" },

	total = { icon = "󰮍", fg = "yellow" },
	succ = { icon = "", fg = "green" },
	fail = { icon = "", fg = "red" },
	found = { icon = "󰮕", fg = "blue" },
	processed = { icon = "󰐍", fg = "green" },

	show_background = true,

	display_header_line = true,
	display_status_line = true,

	component_positions = { "header", "tab", "status" },

	header_line = {
		left = {
			section_a = {
        			{type = "line", custom = false, name = "tabs", params = {"left"}},
			},
			section_b = {
			},
			section_c = {
			}
		},
		right = {
			section_a = {
        			{type = "string", custom = false, name = "date", params = {"%A, %d %B %Y"}},
			},
			section_b = {
        			{type = "string", custom = false, name = "date", params = {"%I:%M %p"}},
			},
			section_c = {
			}
		}
	},

	status_line = {
		left = {
			section_a = {
        			{type = "string", custom = false, name = "tab_mode"},
			},
			section_b = {
        			{type = "string", custom = false, name = "hovered_size"},
			},
			section_c = {
        			{type = "string", custom = false, name = "hovered_path"},
                    {type = "coloreds", custom = false, name = "githead"},
        			{type = "coloreds", custom = false, name = "count"},
			}
		},
		right = {
			section_a = {
        			{type = "string", custom = false, name = "cursor_position"},
			},
			section_b = {
        			{type = "string", custom = false, name = "cursor_percentage"},
			},
			section_c = {
        			{type = "string", custom = false, name = "hovered_file_extension", params = {true}},
        			{type = "coloreds", custom = false, name = "permissions"},
			}
		}
	},
})

--Githead for yatline
require("yatline-githead"):setup({
    show_branch = true,
    branch_prefix = "",
    prefix_color = "red",
    branch_color = "blue",
    branch_symbol = "",
    branch_borders = "()",

    commit_color = "#f6c177",
    commit_symbol = "󰜘",

    show_behind_ahead = true,
    behind_color = "#eb6f92",
    behind_symbol = "⇣",
    ahead_color = "#9ccfd8",
    ahead_symbol = "⇡",

    show_stashes = true,
    stashes_color = "#31748f",
    stashes_symbol = "󰪶",

    show_state = true,
    show_state_prefix = true,
    state_color = "red",
    state_symbol = "~",

    show_staged = true,
    staged_color = "#c4a7e7",
    staged_symbol = "+",

    show_unstaged = true,
    unstaged_color = "#ebbcba",
    unstaged_symbol = "",

    show_untracked = true,
    untracked_color = "#e0def4",
    untracked_symbol = "",
})

require("starship"):setup()
