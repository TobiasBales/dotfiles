# typed: true
# frozen_string_literal: true

class Hammerspoon < Base
  extend T::Sig

  sig { override.void }
  def run
    return unless macos?

    debug("")
    Link.new(source: "hammerspoon", target: "~/.hammerspoon").run
  end
end
