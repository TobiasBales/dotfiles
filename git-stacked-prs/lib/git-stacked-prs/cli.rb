# frozen_string_literal: true

require "git"

require_relative "./args"
require_relative "./config"

module GitStackedPr
  class CLI
    def self.run(argv)
      config = Config.from_args(Args.from_argv(argv))
      git ||= Git.open(config.directory)

      commits ||= git.log(config.count).map { |commit| { sha: commit.sha, message: commit.message } }
      commands = config.branches.map do |branch|
        matching_commit = commits.find { |commit| commit[:message].start_with?(branch[:message]) }
        raise "Could not find commit with message #{branch[:message]}" unless matching_commit

        "git push origin #{matching_commit[:sha]}:#{branch[:name]} --force-with-lease"
      end

      commands.each do |command|
        puts "Running: #{command}"
        `#{command}`
        puts ""
      end
    end
  end
end

GitStackedPr::CLI.run(ARGV)
