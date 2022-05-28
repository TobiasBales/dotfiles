class Apt < Base
  def initialize(last_run: LastRun.instance)
    @last_run = last_run
  end

  def run
    debug("")
    debug("Running apt")

    if !linux?
      debug("Not running on Linux, skipping")
      return
    end

    @last_run.run_if_needed("sudo apt-get update -y")
    @last_run.run_if_needed("sudo apt-get install -y #{packages.join(' ')}")
  end

  private

  def packages
    [
      "fzf",
      "luarocks",
      "ripgrep",
      "shellcheck",
      "tmux",
      "zsh",
    ]
  end
end
