# typed: strict
# frozen_string_literal: true

require "fileutils"

class Script
  extend T::Sig
  include Helpers
  sig { params(file: String).void }
  def initialize(file:)
    super()

    @file = file
  end

  sig { void }
  def run
    debug("Running script #{@file}")

    if File.exist?(manifest)
      debug("Manifest for #{@file} already exists, skippping")
      return
    end

    `#{File.join(directory, "scripts", @file)}`

    FileUtils.touch(manifest)
  end

  private

  sig { returns(String) }
  def manifest
    File.join(directory, ".manifests", @file)
  end
end
