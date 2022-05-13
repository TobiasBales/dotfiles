class GitRepository < Base
    def initialize(repository:, directory:)
        @repository = repository
        @directory = directory.gsub("~", Dir.home)
    end

    def run
        debug("Cloning #{@repository} to #{@directory}")
        if File.exist?(@directory)
            debug("Skipping since it already exists")
            return
        end

        `git clone #{@repository} #{@directory}`
    end
end