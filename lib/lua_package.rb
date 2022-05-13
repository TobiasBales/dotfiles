class LuaPackage < Base
  def initialize(name:)
    @name = name
  end

  def run
    debug("Installing lua package #{@name}")

    if exists?(@name)
      debug("Already in path, skipping")
      return
    end

    `luarocks install luacheck`
  end

  private

  def exists?(executable)
    ENV['PATH'].split(File::PATH_SEPARATOR).any? do |directory|
      File.executable?(File.join(directory, executable.to_s))
    end
  end
end
