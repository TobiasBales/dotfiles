# typed: strict
# frozen_string_literal: true

class Git < Base
  extend T::Sig

  sig { override.void }
  def run
    debug("")
    debug("Setting up git config")

    Link.new(source: "git/config", target: "~/.gitconfig").run
    Link.new(
      source: "git/fsmonitor-watchman",
      target: "~/.fsmonitor-watchman"
    ).run

    if work?
      Link.new(source: "git/config.shopify", target: "~/.gitconfig.shopify").run
    end
  end
end
