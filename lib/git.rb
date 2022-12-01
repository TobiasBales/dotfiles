# typed: strict
# frozen_string_literal: true

class Git < Base
  extend T::Sig

  sig { override.void }
  def run
    debug("")
    debug("Setting up git config")

    Link.new(source: "git/config", target: "~/.gitconfig").run
    if linux?
      Link.new(
        source: "git/fsmonitor-watchman",
        target: "~/.fsmonitor-watchman"
      ).run
      Link.new(source: "git/config.linux", target: "~/.gitconfig.linux").run
    end

    if macos?
      Link.new(source: "git/config.macos", target: "~/.gitconfig.macos").run
    end

    if work?
      Link.new(source: "git/config.shopify", target: "~/.gitconfig.shopify").run
    end
  end
end
