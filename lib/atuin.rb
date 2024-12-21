# typed: strict
# frozen_string_literal: true

class Atuin < Base
  extend T::Sig

  sig { override.void }
  def run
    return if executable_exists?("atuin")

    debug("Installing atuin")

    %x(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash) if linux?

    binary = "~/.atuin/bin/atuin"

    if spin?
      password = File.read("/etc/spin/secrets/atuin-password")
      key = File.read("/etc/spin/secrets/atuin-key")
      %x(#{binary} login --username TobiasBales --password "#{password}" --key "#{key}")
    else
      %x(#{binary} login)
    end
    %x(#{binary} sync)
  end
end
