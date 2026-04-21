class Alkali < Formula
  desc "Reactive bridge between Swift's compiler and your running UI"
  homepage "https://github.com/abdousarr/alkali"
  url "https://github.com/AbdouSarr/alkali/releases/download/v2.2.0/alkali-macos.tar.gz"
  sha256 "9a3edd39d0c076e1a7451c2fa4fd76036c0d0d6749ed634ef5e91adb580ee09d"
  license "MIT"
  version "2.2.0"

  depends_on macos: :sonoma

  def install
    bin.install "alkali"
  end

  def caveats
    <<~EOS
      To configure Alkali with Claude Code, run:

        alkali setup --global

      Or for a specific project:

        cd /path/to/your/project
        alkali setup

      This adds Alkali as an MCP server so Claude Code can query
      your SwiftUI views, assets, data flow, and project structure.
    EOS
  end

  test do
    assert_match "2.2.0", shell_output("#{bin}/alkali --version")
  end
end
