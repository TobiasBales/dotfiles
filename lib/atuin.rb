# typed: true
# frozen_string_literal: true

class Atuin < Base
  extend T::Sig

  # rubocop:disable Metrics/MethodLength
  sig { override.void }
  def run
    return if executable_exists?("atuin")

    debug("Installing atuin")

    `curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | bash` if linux?

    binary = "~/.atuin/bin/atuin"

    if spin?
      password = File.read("/etc/spin/secrets/atuin-password")
      key = File.read("/etc/spin/secrets/atuin-key")
      `#{binary} login --username TobiasBales --password "#{password}" --key "#{key}"`
    else
      `#{binary} login`
    end
    `#{binary} sync`
  end
  # rubocop:enable Metrics/MethodLength
end
