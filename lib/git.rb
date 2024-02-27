# typed: strict
# frozen_string_literal: true

class Git < Base
  extend T::Sig

  sig { override.void }
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
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

    Link.new(source: "git/config.macos", target: "~/.gitconfig.macos").run if macos?

    Link.new(source: "git/config.shopify", target: "~/.gitconfig.shopify").run if work?

    Link.new(source: "git/config.personal", target: "~/.gitconfig.personal").run if personal?

    Link.new(source: "git/ignore", target: "~/.gitignore").run
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
