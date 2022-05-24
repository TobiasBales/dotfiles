class LuaPackage < Base
  def initialize(name:)
    @name = name
  end

  def run
    debug("Installing lua package #{@name}")

    if executable_exists?(@name)
      debug("Already in path, skipping")
      return
    end

    `luarocks install --local #{@name}`
  end
end
