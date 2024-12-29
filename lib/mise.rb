# typed: strict
# frozen_string_literal: true

class Mise < Base
  extend T::Sig

  sig { override.void }
  def run
    return unless personal?

    debug("")
    debug("Setting up mise config")
    Link.new(source: "mise", target: "~/.config/mise").run
  end
end
