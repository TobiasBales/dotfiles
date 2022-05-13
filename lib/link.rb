class Link < Base
    def initialize(source:, target:, dir: nil)
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

        if File.exists?(@target)
          debug("File exists but is no symlink, moving it")
          File.rename(@target, "#{@target}.old")
        end

        File.symlink("#{@dir}/#{@source}", @target)
    end
end
