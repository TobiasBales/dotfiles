# frozen_string_literal: true

module GitStackedPr
  class Args
    attr_reader :directory, :count

    def initialize(directory:, count: 20)
      @directory = directory
      @count = count
    end

    def self.from_argv(argv)
      new(directory: argv.first || Dir.pwd)
    end
  end
end
