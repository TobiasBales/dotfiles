# typed: strict
# frozen_string_literal: true

class Pry < Base
  extend T::Sig

  sig { override.void }
  def run
    debug("")
    debug("Setting up pry config")

    Link.new(source: "pry/pryrc", target: "~/.pryrc").run
  end
end
