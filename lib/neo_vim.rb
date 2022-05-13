class NeoVim < Base
  def run
    debug("Setting up neovim config")
    Link.new(source: "nvim", target: "~/.config/nvim").run
    LuaPackage.new(name: "luacheck").run
  end
end
