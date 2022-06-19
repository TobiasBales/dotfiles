# typed: strict
# frozen_string_literal: true

class VSCode < Base
  sig { override.void }
  def run
    return unless macos?

    Link.new(source: "vscode/settings.json",
             target: "~/Library/Application Support/Code/User/settings.json").run
    Link.new(source: "vscode/keybindings.json",
             target: "~/Library/Application Support/Code/User/keybindings.json").run
  end
end
