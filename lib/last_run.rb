class LastRun < Base
    TIME_BETWEEN_UPDATES = 60 * 60 * 24

    def self.instance
      @@instance ||= LastRun.new
    end

    def run_if_needed(command, &blk)
        debug("Checking if #{command} needs to be run")
        if Time.now.to_i - get < TIME_BETWEEN_UPDATES
            debug("Was run recently, skipping")
	    return
	end

        log("Running #{command}")
        `cd #{directory} && #{command}` if command

        yield blk if block_given?
    end

    def update
        File.write(last_run_file, Time.now.to_i)
    end

    private

    def get
        File.read(last_run_file).to_i
    rescue Errno::ENOENT
        0
    end

    def last_run_file
        File.join(File.expand_path(directory), ".last_run")
    end
end
