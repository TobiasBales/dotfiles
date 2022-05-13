require("telescope").setup({
  defaults = {
    file_ignore_patterns = {".git/", "node_modules"},
    file_sorter = require("telescope.sorters").get_fzy_sorter
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
})
require("telescope").load_extension("fzf")

local find_in_dotfiles = function()
  require("telescope.builtin").find_files(
  {
    prompt_title = "< dotfiles >",
    cwd = "$HOME/dotfiles/",
    hidden = true
  }
  )
end

local find_in_vimrc = function()
  require("telescope.builtin").find_files(
  {
    prompt_title = "< vimrc >",
    cwd = "$HOME/dotfiles/nvim",
    hidden = true
  }
  )
end

local find_files = function()
  require("telescope.builtin").find_files(
  {
    prompt_title = ">",
    hidden = true
  }
  )
end

local find_git_branches = function()
  require("telescope.builtin").git_branches(
  {
    attach_mappings = function(_, map)
      map("i", "<c-d>", actions.git_delete_branch)
      map("n", "<c-d>", actions.git_delete_branch)
      return true
    end
  }
  )
end

local vimp = require('vimp')

vimp.nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>")
vimp.nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>")
vimp.nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>")
vimp.nnoremap("<leader>fd", find_in_dotfiles)
vimp.nnoremap("<leader>fv", find_in_vimrc)
vimp.nnoremap("<leader>ff", find_files)
vimp.nnoremap("<leader>gb", find_git_branches)
