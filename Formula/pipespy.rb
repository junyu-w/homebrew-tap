class Pipespy < Formula
  desc "TUI that shows the data flowing through every pipe of a shell pipeline"
  homepage "https://github.com/junyu-w/pipespy"
  url "https://github.com/junyu-w/pipespy/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ac0fbdabbba73674f0c694b5d6473afbcf1c0975336451ac77d2e5d509895b8a"
  license "MIT"
  head "https://github.com/junyu-w/pipespy.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match "pipespy #{version}", shell_output("#{bin}/pipespy --version")
    assert_match "empty command", shell_output("#{bin}/pipespy 'ls |' 2>&1", 1)
  end
end
