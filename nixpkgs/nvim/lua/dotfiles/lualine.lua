local gps = require("nvim-gps")

require("lualine").setup({
  options = {theme = "gruvbox"},
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {
      "filename",
      {gps.get_location, condition = gps.is_available}
    },
    lualine_x = {"filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualina_a = {},
    lualina_b = {},
    lualina_c = {},
    lualina_x = {},
    lualina_y = {},
    lualina_z = {},
  }
})
