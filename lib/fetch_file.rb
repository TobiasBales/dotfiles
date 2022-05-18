class FetchFile < Base
  def initialize(url:, target:)
    @url = url
    @target = target.gsub('~', Dir.home)
  end

  def run
    debug("Fetching url #{@url} to #{@target}")
    if File.exists?(@target)
      debug("Target file already exists, skipping")
      return
    end

    `curl -L #{@url} --output #{@target}`
  end
end
