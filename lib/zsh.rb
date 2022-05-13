class Zsh < Base
  def run
    Link.new(source: "zsh/.zshrc", target: "~/.zshrc").run
    GitRepository.new(repository: "https://github.com/ohmyzsh/ohmyzsh.git", directory: "~/.oh-my-zsh").run
    GitRepository.new(repository: "https://github.com/zsh-users/zsh-autosuggestions", directory: "~/.oh-my-zsh/custom/plugins/zsh-autosuggestions").run
    GitRepository.new(repository: "https://github.com/zsh-users/zsh-syntax-highlighting.git", directory: "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting").run
  end
end
