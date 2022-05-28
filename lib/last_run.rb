class LastRun < Base
  TIME_BETWEEN_UPDATES = 60 * 60 * 24

  def self.instance
    @@instance ||= LastRun.new
  end

  def run_if_needed(command, manifest: nil, sub_directory: nil, &blk)
    debug("Checking if #{command} needs to be run")
    if was_run_recently? && !manifest_changed?(sub_directory, manifest)
      debug("Was run recently, skipping")
      return
    end

    log("Running #{command} #{"in #{sub_directory}" if sub_directory}")
    `cd #{directory(sub_directory: sub_directory)} && #{command}` if command

    yield blk if block_given?
  end

  def update
    File.write(last_run_file, Time.now.to_i)
  end

  private

  def manifest_changed?(sub_directory, manifest)
    return false if manifest.nil?

    File.mtime(File.join(directory(sub_directory: sub_directory), manifest)).to_i > last_run_time
  end

  def was_run_recently?
    time_since_last_run = Time.now.to_i - last_run_time

    time_since_last_run < TIME_BETWEEN_UPDATES
  end

  def last_run_time
    File.read(last_run_file).to_i
    rescue Errno::ENOENT
    0
  end

  def last_run_file
    File.join(File.expand_path(directory), ".last_run")
  end
end
