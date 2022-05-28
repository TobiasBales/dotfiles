class LuaPackage < Base
  def initialize(name:)
    @name = name
  end

  def run
    debug("Installing lua package #{@name}")

    if rock_exists?(@name)
      debug("Already in path, skipping")
      return
    end

    puts `luarocks install --local #{@name}`
  end

  private

  def rock_exists?(executable)
    File.executable?(File.join(Dir.home, '.luarocks', 'bin', executable))
  end
end
