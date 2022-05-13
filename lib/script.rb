require 'fileutils'

class Script < Base
  def initialize(file:)
    @file = file
  end

  def run
    debug("Running script #{@file}")

    if File.exists?(manifest)
      debug("Manifest for #{@file} already exists, skippping")
      return
    end

    `#{File.join(directory, 'scripts', @file)}`

    FileUtils.touch(manifest)
  end

  private

  def manifest
    File.join(directory, '.manifests', @file)
  end
end
