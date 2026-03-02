class Devforge < Formula
  desc "DevForge — Development Environment Automation CLI"
  homepage "https://github.com/ChinmayyK/DevForge"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChinmayyK/DevForge/releases/download/v#{version}/devforge-darwin-arm64"
      sha256 "8e4e73d728912e82507a3486bc162cec994b755d55f90dc7adba467ef30f6302"
    else
      url "https://github.com/ChinmayyK/DevForge/releases/download/v#{version}/devforge-darwin-amd64"
      sha256 "6ce4a8fc5801a2c5f108489326dee7a7c0337893b3c7b03a1119ebd4280aa805"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ChinmayyK/DevForge/releases/download/v#{version}/devforge-linux-arm64"
      sha256 "3cda9de4092be0e9bf8dcab7e0a5ef6425635b19e4102117f83cee4cbcc14ff2"
    else
      url "https://github.com/ChinmayyK/DevForge/releases/download/v#{version}/devforge-linux-amd64"
      sha256 "bf057e45458f686707818110a212ad7b0e8699abec3f0d06c7a0ef0b939ba82f"
    end
  end

  def install
    binary = Dir["devforge-*"].first || "devforge"
    mv binary, "devforge"
    chmod 0755, "devforge"
    bin.install "devforge"

    # Generate and install shell completions
    generate_completions_from_executable(bin/"devforge", "completion")
  end

  test do
    assert_match "devforge version", shell_output("#{bin}/devforge version")
  end
end
