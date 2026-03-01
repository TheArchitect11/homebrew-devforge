class Devforge < Formula
  desc "DevForge — Development Environment Automation CLI"
  homepage "https://github.com/ChinmayyK/DevForge"
  url "https://github.com/ChinmayyK/DevForge/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "cbe2cd0c3147ebd398ef90182fea9bfd7ecc63ca0aef4f5e496fbaa93e1128b1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X main.version=#{version}", "-o", "devforge", "."
    bin.install "devforge"
  end

  test do
    system "#{bin}/devforge", "version"
  end
end
