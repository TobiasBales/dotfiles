# typed: strict
# frozen_string_literal: true

class Zsh < Base
  extend T::Sig

  sig { override.void }
  def run
    debug("")
    Link.new(source: "zsh/.zshrc", target: "~/.zshrc").run
    Link.new(source: "zsh/.zprofile", target: "~/.zprofile").run
    Link.new(source: "zsh/.antigenrc", target: "~/.antigenrc").run
    FetchFile.new(url: "https://git.io/antigen", target: "~/.antigen.zsh").run
    Link.new(source: "zsh/starship.toml", target: "~/.config/starship.toml").run
    ExecuteFile.new(url: "https://starship.rs/install.sh", executable: "starship").run
    Link.new(source: "zsh/personal.zsh", target: "~/.additional.zsh").run if personal?
    Link.new(source: "zsh/wt.zsh", target: "~/.wt.zsh").run
    Link.new(source: "zsh/zsh", target: "~/.zsh").run
    RunCommand.new(
      command: "atuin gen-completions --shell zsh --out-dir ~/.zsh/completions",
      file: "~/.zsh/completions",
    )
  end
end
