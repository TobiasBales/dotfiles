class Zsh < Base
  def run
    Link.new(source: "zsh/.zshrc", target: "~/.zshrc").run
    Link.new(source: "zsh/.antigenrc", target: "~/.antigenrc").run
    FetchFile.new(url: "https://git.io/antigen", target: "~/.antigen.zsh").run
  end
end
