class Alkali < Formula
  desc "Reactive bridge between Swift's compiler and your running UI"
  homepage "https://github.com/abdousarr/alkali"
  url "https://github.com/AbdouSarr/alkali/releases/download/v1.0.4/alkali-macos.tar.gz"
  sha256 "2b9eddc1a8db29f5363d584d5632a68c66eb95011e816b6757a497d46568bb8c"
  license "MIT"
  version "1.0.4"

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
    assert_match "1.0.4", shell_output("#{bin}/alkali --version")
  end
end
