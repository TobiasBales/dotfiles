require("telescope").setup(
  {
    defaults = {
      file_ignore_patterns = {".git", "node_modules"},
      file_sorter = require("telescope.sorters").get_fzy_sorter
    }
  }
)
require("telescope").load_extension("fzy_native")

local M = {}

M.search_dotfiles = function()
  require("telescope.builtin").find_files(
    {
      prompt_title = "< dotfiles >",
      cwd = "$HOME/.dotfiles/",
      hidden = true
    }
  )
end

M.search_vimrc = function()
  require("telescope.builtin").find_files(
    {
      prompt_title = "< vimrc >",
      cwd = "$HOME/.dotfiles/nixpkgs/nvim",
      hidden = true
    }
  )
end

M.search_files = function()
  require("telescope.builtin").find_files(
    {
      prompt_title = ">",
      hidden = true
    }
  )
end

M.git_branches = function()
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

return M
