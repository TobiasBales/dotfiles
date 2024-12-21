# typed: strict
# frozen_string_literal: true

class Cursor < Base
  sig { override.void }
  def run
    return unless macos?
    Link.new(source: "cursor/settings.json",
             target: "~/Library/Application Support/Cursor/settings.json").run
    Link.new(source: "cursor/keybindings.json",
             target: "~/Library/Application Support/Cursor/keybindings.json").run
    Link.new(source: "cursor/snippets",
             target: "~/Library/Application Support/Cursor/snippets").run
  end
end
