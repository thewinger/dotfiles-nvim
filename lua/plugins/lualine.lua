local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

--[[ local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
} ]]

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

local filename = {
  "filename",
  file_status = true,
  path = 1,
  shorting_target = 40,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", "__" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({

        options = {
          globalstatus = true,
          icons_enabled = true,
          theme = "tailscheme",
          component_separators = "",
          section_separators = "",
          disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { branch },
          lualine_c = { filename },
          -- lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_x = { diagnostics, "encoding", filetype },
          lualine_y = { progress },
          lualine_z = { location },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { filename },
          lualine_x = { location },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end,
  },
}
