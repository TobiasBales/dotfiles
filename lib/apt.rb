# frozen_string_literal: true

class Apt < Base
  def initialize(last_run: LastRun.instance)
    super()

    @last_run = last_run
  end

  def run
    debug("")
    debug("Running apt")

    
    return debug("Not running on Linux, skipping") unless linux?

    @last_run.run_if_needed("sudo apt-get update -y")
    @last_run.run_if_needed("sudo apt-get install -y #{packages.join(' ')}")

    return if personal? && linux?

    GoPackage.new(package: "github.com/jesseduffield/lazygit@latest",
                  executable: "lazygit").run
  end

  private

  def packages
    %w[
      fzf
      luarocks
      ripgrep
      shellcheck
      tmux
      zsh
    ]
  end
end
