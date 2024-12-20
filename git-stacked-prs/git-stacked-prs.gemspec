# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "git-stacked-prs"
  spec.version = "0.0.1"
  spec.authors = ["Tobias Bales"]
  spec.email = ["hi@tobiasbales.com"]

  spec.summary = "CLI tool to sync a local branch with multiple remote branches."
  spec.description = "By configuring commit:branch pairs you can keep multiple stacked PRs in sync."
  spec.homepage = "https://github.com/TobiasBales/git-stacked-prs"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    %x(git ls-files -z).split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(
        "bin/",
        "test/",
        "spec/",
        "features/",
        ".git",
        ".circleci",
        "appveyor",
      )
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
