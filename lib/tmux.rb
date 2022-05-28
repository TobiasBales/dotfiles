class Tmux < Base
  def run
    debug("")
    Link.new(source: "tmux/tmux.conf", target: "~/.tmux.conf").run

    GitRepository.new(repository: "https://github.com/tmux-plugins/tpm", directory: "~/.tmux/plugins/tpm").run
  end
end
