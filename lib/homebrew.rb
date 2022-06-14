# frozen_string_literal: true

class Homebrew < Base
  def initialize(last_run: LastRun.instance)
    super()

    @last_run = last_run
  end

  def run
    debug("")
    debug("Running brew")
    unless macos?
      debug("Not running on MacOS, skipping")
      return
    end

    @last_run.run_if_needed("brew bundle", manifest: "Brewfile")
    @last_run.run_if_needed("brew bundle", manifest: "Brewfile", sub_directory: "personal") if personal?
    @last_run.run_if_needed("brew bundle", manifest: "Brewfile", sub_directory: "work") if work?
  end
end
