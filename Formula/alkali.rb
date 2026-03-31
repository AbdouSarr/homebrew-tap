class Alkali < Formula
  desc "Reactive bridge between Swift's compiler and your running UI"
  homepage "https://github.com/abdousarr/alkali"
  url "https://github.com/AbdouSarr/alkali/releases/download/v1.0.5/alkali-macos.tar.gz"
  sha256 "ed01c1e47c4ce95423c6832dafa2eeae8afa79bc3cf1615bf08edd438704c250"
  license "MIT"
  version "1.0.5"

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
    assert_match "1.0.5", shell_output("#{bin}/alkali --version")
  end
end
