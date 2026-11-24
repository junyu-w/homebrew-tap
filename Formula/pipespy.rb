class Pipespy < Formula
  desc "TUI that shows the data flowing through every pipe of a shell pipeline"
  homepage "https://github.com/junyu-w/pipespy"
  url "https://github.com/junyu-w/pipespy/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "39c37e2b8e32f0d6b56916ef8f240d7057da6ce89afcb1d438ad0639226e86ad"
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
