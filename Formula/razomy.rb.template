class Razomy < Formula
  desc "Universal plugin CLI"
  homepage "https://github.com/razomy/cli"
  version "${VERSION}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/razomy/cli/releases/download/${TAG}/${MAC_X64_FILE}"
      sha256 "${MAC_X64_SHA}"
    elsif Hardware::CPU.arm?
      url "https://github.com/razomy/cli/releases/download/${TAG}/${MAC_ARM64_FILE}"
      sha256 "${MAC_ARM64_SHA}"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/razomy/cli/releases/download/${TAG}/${LINUX_X64_FILE}"
      sha256 "${LINUX_X64_SHA}"
    elsif Hardware::CPU.arm?
      url "https://github.com/razomy/cli/releases/download/${TAG}/${LINUX_ARM64_FILE}"
      sha256 "${LINUX_ARM64_SHA}"
    end
  end

  def install
    inreplace "bin/razomy", /^CLIENT_HOME=/, "export RAZOMY_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/razomy"
  end
end