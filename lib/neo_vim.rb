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

    Link.new(source: "nvim/", target: "~/.config/nvim").run

    LuaPackage.new(name: "luacheck").run
  end
end
