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

        if (!File.exists?(parent_dir(@target)))
          debug("Parent directory does not exist, creatking")
          Dir.mkdir(parent_dir(@target))
        end

        File.symlink("#{@dir}/#{@source}", @target)
    end

    private

    def parent_dir(file_or_dir)
      File.expand_path(File.join(@target, '..'))
    end
end
