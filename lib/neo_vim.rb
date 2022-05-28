class NeoVim < Base
  def run
    debug("")
    debug("Setting up neovim config")
    Link.new(source: "nvim", target: "~/.config/nvim").run
    Script.new(file: "install_neovim").run if linux?
    LuaPackage.new(name: "luacheck").run
  end
end
