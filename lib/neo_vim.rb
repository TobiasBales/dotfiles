# frozen_string_literal: true

class NeoVim < Base
  def initialize(last_run: LastRun.instance)
    super()

    @last_run = last_run
  end

  def run
    debug("")
    debug("Setting up neovim config")
    Link.new(source: "nvim", target: "~/.config/nvim").run
    Script.new(file: "install_neovim").run if linux?
    LuaPackage.new(name: "luacheck").run
  end
end
