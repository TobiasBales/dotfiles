class Zsh < Base
  def run
    debug("")
    Link.new(source: "zsh/.zshrc", target: "~/.zshrc").run
    Link.new(source: "zsh/.antigenrc", target: "~/.antigenrc").run
    FetchFile.new(url: "https://git.io/antigen", target: "~/.antigen.zsh").run
    Link.new(source: "zsh/starship.toml", target: "~/.config/starship.toml").run
    ExecuteFile.new(url: "https://starship.rs/install.sh", executable: "starship").run
    Link.new(source: "zsh/personal.zsh", target: "~/.additional.zsh").run if personal?
  end
end
