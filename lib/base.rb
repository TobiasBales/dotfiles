require 'socket'

class Base
    def directory(sub_directory: nil)
      base = File.expand_path(File.join(__dir__, ".."))

      return base if sub_directory.nil?

      File.join(base, sub_directory)
    end

    def debug(message)
        log(message, level: :debug)
    end

    def log(message, level: :info)
        puts(message) if level != :debug || debug?
        File.write(File.join(directory, '.log'), "#{message}\n", mode: 'a+')
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
      spin? || hostname =~ /shopify/i
    end

    def personal?
      !work?
    end

    def spin?
      ENV['SPIN']
    end

    private

    def hostname
      @hostname ||= Socket.gethostname
    end

    def os
      `uname -s`.strip.gsub("Darwin", "MacOS")
    end

    def debug?
        ENV["DEBUG"]
    end
end
