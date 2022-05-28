class NeoVim < Base
  def initialize(last_run: LastRun.instance)
    @last_run = last_run
  end

  def run
    debug("")
    debug("Setting up neovim config")
    Link.new(source: "nvim", target: "~/.config/nvim").run
    Script.new(file: "install_neovim").run if linux? && spin?
    @last_run.run_if_needed("sudo apt-get install -y neovim") if linux? && !spin?
    LuaPackage.new(name: "luacheck").run
  end
end
