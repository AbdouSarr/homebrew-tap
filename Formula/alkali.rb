class Alkali < Formula
  desc "Reactive bridge between Swift's compiler and your running UI"
  homepage "https://github.com/abdousarr/alkali"
  url "https://github.com/AbdouSarr/alkali/releases/download/v2.3.0/alkali-macos.tar.gz"
  sha256 "9d6bb4537fdf64e36f328511c47876113178e1c5b20ab9a11c105b73ac689546"
  license "MIT"
  version "2.3.0"

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
    assert_match "2.3.0", shell_output("#{bin}/alkali --version")
  end
end
