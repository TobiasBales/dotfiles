class Kitty < Base
  def run
    debug("")
    debug("Setting up kitty config")
    Link.new(source: "kitty", target: "~/.config/kitty").run
  end
end
