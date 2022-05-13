class Homebrew < Base
    def initialize(last_run: LastRun.instance)
        @last_run = last_run
    end

    def run
        debug("Running brew")
        if !macos?
          debug("Not running on MacOS, skipping") 
          return
        end

        @last_run.run_if_needed("brew bundle")
    end
end
