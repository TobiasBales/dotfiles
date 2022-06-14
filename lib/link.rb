# frozen_string_literal: true

class Link < Base
  def initialize(source:, target:, dir: nil)
    super()

    @dir = dir || directory
    @source = source
    @target = target.gsub("~", Dir.home)
  end

  def run
    debug("Linking #{@source} -> #{@target}")
    if File.symlink?(@target)
      debug("Already in place, skipping")
      return
    end

    if File.exist?(@target)
      debug("File exists but is no symlink, moving it")
      File.rename(@target, "#{@target}.old")
    end

    unless File.exist?(parent_dir(@target))
      debug("Parent directory does not exist, creatking")
      Dir.mkdir(parent_dir(@target))
    end

    File.symlink("#{@dir}/#{@source}", @target)
  end

  private

  def parent_dir(_file_or_dir)
    File.expand_path(File.join(@target, ".."))
  end
end
