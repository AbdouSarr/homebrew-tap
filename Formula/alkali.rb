class Alkali < Formula
  desc "Reactive bridge between Swift's compiler and your running UI"
  homepage "https://github.com/abdousarr/alkali"
  url "https://github.com/AbdouSarr/alkali/releases/download/v2.1.0/alkali-macos.tar.gz"
  sha256 "bb8dab60ddebf1a56957d2284df3b0dfa7f33ccf0b065d1810b39458c60ac2fd"
  license "MIT"
  version "2.1.0"

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
    assert_match "2.1.0", shell_output("#{bin}/alkali --version")
  end
end
