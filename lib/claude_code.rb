# typed: strict
# frozen_string_literal: true

class ClaudeCode < Base
  extend T::Sig

  sig { override.void }
  def run
    debug("")
    debug("Setting up claude code")
  end
end
