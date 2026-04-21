class Alkali < Formula
  desc "Reactive bridge between Swift's compiler and your running UI"
  homepage "https://github.com/abdousarr/alkali"
  url "https://github.com/AbdouSarr/alkali/releases/download/v2.0.1/alkali-macos.tar.gz"
  sha256 "4861d229d806abd84541206c8a9ab0bacdfc3c8a68751fcc098d8cae3fa17ebd"
  license "MIT"
  version "2.0.1"

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
    assert_match "2.0.1", shell_output("#{bin}/alkali --version")
  end
end
