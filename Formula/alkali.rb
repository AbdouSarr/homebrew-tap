class Alkali < Formula
  desc "Reactive bridge between Swift's compiler and your running UI"
  homepage "https://github.com/abdousarr/alkali"
  url "https://github.com/AbdouSarr/alkali/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "7d01727b077e4a654f0782b5952324d10295d06705cace27122f0ab29008f8e5"
  license "MIT"

  head "https://github.com/abdousarr/alkali.git", branch: "master"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/alkali"
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
    assert_match "1.0.2", shell_output("#{bin}/alkali --version")

    (testpath/"TestView.swift").write <<~SWIFT
      import SwiftUI
      struct TestView: View {
@State var count: Int = 0
var body: some View {
    VStack {
        Text("Hello")
            .font(.headline)
            .padding(16)
        Button("Tap") { count += 1 }
    }
}
      }
    SWIFT

    output = shell_output("#{bin}/alkali render TestView --project-root #{testpath}")
    assert_match "TestView", output
  end
end
