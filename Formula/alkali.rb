class Alkali < Formula
  desc "A reactive bridge between Swift's compiler and your running UI"
  homepage "https://github.com/AbdouSarr/alkali"
  url "https://github.com/AbdouSarr/alkali.git", branch: "master"
  version "0.1.0"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/alkali"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/alkali --version")
  end
end
