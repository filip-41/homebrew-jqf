class Jqf < Formula
  desc "Jq's language, for every format"
  homepage "https://github.com/filip-41/jqf"
  url "https://github.com/filip-41/jqf/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "154ecc80682fdaca491f76978e96b9f3b04cd75150419b4ffce7a7361af25704"
  license "MIT"
  head "https://github.com/filip-41/jqf.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "jqf-cli"
    man1.install "docs/jqf.1"
    bash_completion.install "tools/completions/jqf.bash" => "jqf"
    zsh_completion.install "tools/completions/jqf.zsh" => "_jqf"
  end

  test do
    assert_equal "8080\n", pipe_output("#{bin}/jqf '.port'", '{"port":8080}')
  end
end
