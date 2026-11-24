class Pipespy < Formula
  desc "TUI that shows the data flowing through every pipe of a shell pipeline"
  homepage "https://github.com/junyu-w/pipespy"
  url "https://github.com/junyu-w/pipespy/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3072b84621a2f07b121c3f3f2bf2e436b8a78bac859c4d1507a15b1e422e1705"
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
