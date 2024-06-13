-- local foreground = hsl(210, 40, 98)
-- local background = hsl(217, 33, 17)
-- local dark = hsl(222, 47, 11)
-- local white = hsl(210, 40, 98)
-- local comment = hsl(215, 16, 47)
-- local gray_light = hsl(213, 27, 84)
-- local gray = hsl(215, 20, 65)
-- local blue_dark = hsl(202, 80, 24)
-- local blue = hsl(199, 95, 74)
-- local green_light = hsl(168, 84, 78)
-- local green = hsl(158, 64, 52)
-- local cyan = hsl(187, 92, 69)
-- -- local red_light = hsl(353, 96, 90)
-- local red = hsl(351, 95, 71)
-- local orange = hsl(31, 97, 72)
-- local yellow = hsl(50, 98, 64)
-- local purple = hsl(255, 92, 76)
-- local pink = hsl(329, 86, 70)
--
local colors = {
  black = "#1d283a",
  white = "#f8fafc",
  green = "#98f6e3",
  blue = "#7ed4fc",
  yellow = "#fddf49",
  orange = "#fdba72",
  pink = "#f471b5",
  lightgray = "#cbd5e1",
  gray = "#94a3b8",
  inactivegray = "#65758b",
  darkgray = "#0c4a6e",
}
return {
  normal = {
    a = { fg = colors.black, bg = colors.blue, gui = "bold" },
    b = { fg = colors.blue, bg = colors.black },
    c = { fg = colors.blue, bg = colors.black },
  },
  insert = {
    a = { fg = colors.black, bg = colors.pink, gui = "bold" },
    b = { fg = colors.pink, bg = colors.black },
    c = { fg = colors.pink, bg = colors.black },
  },
  visual = {
    a = { fg = colors.black, bg = colors.orange, gui = "bold" },
    b = { fg = colors.orange, bg = colors.black },
    c = { fg = colors.orange, bg = colors.black },
  },
  replace = {
    a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
    b = { fg = colors.yellow, bg = colors.black },
    c = { fg = colors.yellow, bg = colors.black },
  },
  command = {
    a = { fg = colors.black, bg = colors.green, gui = "bold" },
    b = { fg = colors.green, bg = colors.black },
    c = { fg = colors.green, bg = colors.black },
  },
  inactive = {
    a = { fg = colors.black, bg = colors.darkgray, gui = "bold" },
    b = { fg = colors.darkgray, bg = colors.black },
    c = { fg = colors.darkgray, bg = colors.black },
  },
}
