# typed: true
# frozen_string_literal: true

class Atuin < Base
  extend T::Sig

  sig { override.void }
  def run
    return if executable_exists?("atuin")

    debug("Installing atuin")

    `curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash`
    if spin?
      password = File.read("/etc/spin/secrets/atuin-password")
      key = File.read("/etc/spin/secrets/atuin-key")
      `atuin login --username TobiasBales --password "#{password}" --key "#{key}"`
    else
      `atuin login`
    end
    `atuin sync`
  end
end
