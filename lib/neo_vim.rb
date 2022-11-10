# typed: strict
# frozen_string_literal: true

class NeoVim < Base
  extend T::Sig

  sig { params(last_run: LastRun).void }
  def initialize(last_run: LastRun.instance)
    super()

    @last_run = last_run
  end

  sig { override.void }
  def run
    debug("")
    debug("Setting up neovim config")

    return debug("Running on spin,skipping") if spin?

    GitRepository.new(
      repository: "https://github.com/AstroNvim/AstroNvim",
      directory: "~/.config/nvim"
    ).run
    Link.new(source: "nvim/lua/user", target: "~/.config/nvim/lua/user").run

    Script.new(file: "intall_neovim").run if linux?

    LuaPackage.new(name: "luacheck").run
  end
end
