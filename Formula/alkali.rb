class Alkali < Formula
  desc "Reactive bridge between Swift's compiler and your running UI"
  homepage "https://github.com/abdousarr/alkali"
  url "https://github.com/AbdouSarr/alkali/releases/download/v2.5.0/alkali-macos.tar.gz"
  sha256 "df7401288709de8fbc4844155a3e6c4eea7a3f688bccaf53fbba5bdaf09c7a9c"
  license "MIT"
  version "2.5.0"

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
    assert_match "2.5.0", shell_output("#{bin}/alkali --version")
  end
end
