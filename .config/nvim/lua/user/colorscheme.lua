require("tokyonight").setup({
  --use
  style = "night",
  on_colors = function(colors)
    colors.bg = "#1e222a";
    colors.bg_dark = "#1e222a";
  end
})

local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
