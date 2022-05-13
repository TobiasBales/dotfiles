class NeoVim < Base
  def run
    debug("Setting up neovim config")
    Link.new(source: "nvim", target: "~/.config/nvim").run
    Script.new(file: "install_neovim", executable: "nvim").run if linux?
    LuaPackage.new(name: "luacheck").run
  end
end
