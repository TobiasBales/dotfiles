# frozen_string_literal: true

class FetchFile < Base
  def initialize(url:, target:)
    super()

    @url = url
    @target = target.gsub("~", Dir.home)
  end

  def run
    debug("Fetching url #{@url} to #{@target}")
    if File.exist?(@target)
      debug("Target file already exists, skipping")
      return
    end

    `curl -L #{@url} --output #{@target}`
  end
end
