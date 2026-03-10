class Razomy < Formula
  desc "Universal plugin CLI"
  homepage "https://github.com/razomy/cli"
  version "0.0.0-alpha.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/razomy/cli/releases/download/#{version}/razomy-v#{version}-darwin-x64.tar.gz"
      sha256 "YOUR_MAC_X64_SHA256"
    elsif Hardware::CPU.arm?
      url "https://github.com/razomy/cli/releases/download/#{version}/razomy-v#{version}-darwin-arm64.tar.gz"
      sha256 "YOUR_MAC_ARM64_SHA256"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/razomy/cli/releases/download/#{version}/razomy-v#{version}-linux-x64.tar.gz"
      sha256 "YOUR_LINUX_X64_SHA256"
    elsif Hardware::CPU.arm?
      url "https://github.com/razomy/cli/releases/download/#{version}/razomy-v#{version}-linux-arm64.tar.gz"
      sha256 "YOUR_LINUX_ARM64_SHA256"
    end
  end

  def install
    inreplace "bin/razomy", /^CLIENT_HOME=/, "export RAZOMY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/razomy"
  end
end
