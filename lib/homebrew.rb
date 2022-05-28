class Homebrew < Base
    def initialize(last_run: LastRun.instance)
        @last_run = last_run
    end

    def run
        debug("")
        debug("Running brew")
        if !macos?
          debug("Not running on MacOS, skipping") 
          return
        end

        @last_run.run_if_needed("brew bundle")
        @last_run.run_if_needed("brew bundle", sub_directory: "personal") if personal?
        @last_run.run_if_needed("brew bundle", sub_directory: "work") if work?
    end
end
