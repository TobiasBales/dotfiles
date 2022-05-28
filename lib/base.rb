class Base
    def directory(sub_directory: nil)
      base = File.expand_path(File.join(__dir__, ".."))

      return base if sub_directory.nil?

      File.join(base, sub_directory)
    end

    def debug(message)
        return unless debug?

        log(message)
    end

    def log(message)
        puts(message)
    end

    def macos?
      os == "MacOS"
    end

    def linux?
      os == "Linux"
    end

    def executable_exists?(executable)
      ENV['PATH'].split(File::PATH_SEPARATOR).any? do |directory|
        File.executable?(File.join(directory, executable.to_s))
      end
    end

    def work?
      spin?
    end

    def personal?
      !work?
    end

    def spin?
      ENV['SPIN']
    end

    private

    def os
      `uname -s`.strip.gsub("Darwin", "MacOS")
    end

    def debug?
        ENV["DEBUG"]
    end
end
