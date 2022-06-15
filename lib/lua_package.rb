# typed: strict
# frozen_string_literal: true

class LuaPackage < Base
  extend T::Sig

  sig { params(name: String).void }
  def initialize(name:)
    super()

    @name = name
  end

  sig { override.void }
  def run
    debug("Installing lua package #{@name}")

    if rock_exists?(@name)
      debug("Already in path, skipping")
      return
    end

    puts `luarocks install --local #{@name}`
  end

  private

  sig { params(executable: String).returns(T::Boolean) }
  def rock_exists?(executable)
    File.executable?(File.join(Dir.home, ".luarocks", "bin", executable))
  end
end
