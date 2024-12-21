# typed: false
# frozen_string_literal: true

module GitStackedPr
  class Config
    attr_reader :directory, :count, :branches

    def initialize(directory:, count:)
      @directory = directory
      @count = count

      raise "Directory does not contain .git-stacked-prs config file" unless File.exist?(config_file)

      @branches = parse_branches
    end

    class << self
      def from_args(args)
        new(directory: args.directory, count: args.count)
      end
    end

    private

    def config_file
      File.join(directory, ".git-stacked-prs")
    end

    def parse_branches
      File.read(config_file).split("\n").each_with_object([]) do |line, branches|
        message, branch = line.split(":", 2)
        branches << { message: message, name: branch }
      end
    end
  end
end
