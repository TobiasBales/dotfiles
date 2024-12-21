# typed: strict
# frozen_string_literal: true

class RunCommand
  extend T::Sig
  include Helpers
  sig { params(command: String, file: String).void }
  def initialize(command:, file:)
    super()

    @command = command
    @file = file
  end

  sig { void }
  def run
    debug("Executing #{@command} to generate #{@file}")
    if file_exists?(@file)
      debug("file #{@file} exists, skipping")
      return
    end

    %x(#{@command})
  end
end
