# typed: strict
# frozen_string_literal: true

require "socket"

class Base
  extend T::Helpers
  extend T::Sig
  abstract!

  include Helpers

  sig { void }
  def initialize
    @hostname = T.let(nil, T.nilable(String))
  end

  sig { abstract.void }
  def run; end

  sig { returns(T::Boolean) }
  def macos?
    os == "MacOS"
  end

  sig { returns(T::Boolean) }
  def linux?
    os == "Linux"
  end

  sig { returns(T::Boolean) }
  def work?
    return true if spin?

    hostname_matches(/shopify/i)
  end

  sig { params(regex: Regexp).returns(T::Boolean) }
  def hostname_matches(regex)
    regex.match?(hostname)
  end

  sig { returns(T::Boolean) }
  def personal?
    !work?
  end

  sig { returns(T::Boolean) }
  def spin?
    ENV.fetch("SPIN", nil) != nil
  end

  private

  sig { returns(String) }
  def hostname
    @hostname ||= Socket.gethostname
  end

  sig { returns(String) }
  def os
    %x(uname -s).strip.gsub("Darwin", "MacOS")
  end

  sig { params(name: String).void }
  def create_manifest(name)
    FileUtils.touch(File.join(directory, ".manifests", name))
  end

  sig { params(name: String).returns(T::Boolean) }
  def manifest_exists?(name)
    File.exist?(File.join(directory, ".manifests", name))
  end
end
