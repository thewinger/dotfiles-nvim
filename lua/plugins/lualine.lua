local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  diagnostics_color = {
    -- Same values as the general color option can be used here.
    -- error = { fg = '#EF4445'},
    -- warn = { fg = '#ff9e64'}
  },
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

local lazy = {
  "lazy",
  require("lazy.status").updates,
  cond = require("lazy.status").has_updates,
  color = { fg = "#ff9e64" },
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

local mcphub = {
  "mcphub",
  function()
    local hub = require("mcphub").get_hub_instance()
    if hub == nil then
      return "MCP: N/A"
    end
    local active_servers = #hub:get_servers()
    return "MCP: " .. active_servers
  end,
  icon = "🔌",
}

return {
  {
    "nvim-lualine/lualine.nvim",
    -- enabled = false,
    config = function()
      require("lualine").setup({

        options = {
          globalstatus = true,
          icons_enabled = true,
          theme = "base2tone_tailwind_dark",
          -- theme = "auto",
          component_separators = "",
          section_separators = "",
          disabled_filetypes = { "alpha", "oil", "dashboard", "NvimTree", "Outline" },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { branch },
          lualine_c = { filename },
          -- lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_x = { mcphub, lazy, diagnostics, "encoding", filetype },
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
