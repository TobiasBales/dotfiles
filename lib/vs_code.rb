# typed: strict
# frozen_string_literal: true

class VSCode < Base
  sig { override.void }
  def run
    Link.new(source: "vscode/settings.json",
             target: "~/Library/Application Support/Code/User/settings.json").run if macos?
    Link.new(source: "vscode/keybindings.json",
             target: "~/Library/Application Support/Code/User/keybindings.json").run if macos?

    install_extensions(general_extensions) if macos? || spin?
    install_extensions(personal_extensions) if personal? && macos?
  end

  private

  sig { params(extensions: T::Array[String]).void }
  def install_extensions(extensions)
    extensions.each do |extension|
      VSCodeExtension.new(name: extension).run
    end
  end

  sig { returns(T::Array[String]) }
  def general_extensions
    [
      "itarato.byesig", "kahole.magit", "Shopify.ruby-lsp", "sorbet.sorbet-vscode-extension",
      "vscodevim.vim", "wwm.better-align", "orepor.color-tabs-vscode-ext", "usernamehw.errorlens",
      "oderwat.indent-rainbow", "johnpapa.vscode-peacock", "Gruntfuggly.todo-tree"
    ]
  end

  sig { returns(T::Array[String]) }
  def personal_extensions
    ["platformio.platformio-ide"]
  end
end
