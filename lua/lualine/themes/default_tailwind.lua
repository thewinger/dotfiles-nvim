local colors = {
  black = "#1e293b",
  white = "#f1f5f9",
  lightgray = "#e2e8f0",
  gray = "#cbd5e1",
  darkgray = "#94a3b8",
  inactivegray = "#64748b",
  blue = "#38bdf8",
  cyan = "#67e8f9",
  green = "#4ade80",
  magenta = "#fb64b6",
  red = "#f87171",
  yellow = "#fcd34d",
}

return {
  normal = {
    a = { bg = colors.gray, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.white },
    c = { bg = colors.black, fg = colors.gray },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.white },
    c = { bg = colors.black, fg = colors.white },
  },
  visual = {
    a = { bg = colors.magenta, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.white },
    c = { bg = colors.black, fg = colors.black },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.white },
    c = { bg = colors.black, fg = colors.white },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.white },
    c = { bg = colors.black, fg = colors.black },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.black, gui = "bold" },
    b = { bg = colors.darkgray, fg = colors.black },
    c = { bg = colors.darkgray, fg = colors.black },
  },
}
