# Template. The release workflow renders it with scripts/render-homebrew.sh
# (real version in the url, real sha256) and attaches the result to the
# GitHub release; copy that file to matthieuh/homebrew-tap as Formula/btp.rb.
class Btp < Formula
  desc "Kill dev servers left behind by coding-agent sessions"
  homepage "https://github.com/matthieuh/balance-ton-port"
  url "https://github.com/matthieuh/balance-ton-port/releases/download/v0.4.4/btp-0.4.4-macos-universal.tar.gz"
  sha256 "ba6c16f4a307120e1252e634d4559f0e18a7dccf8fd5e09a707e30d8aae529e7"
  license "MIT"

  # The binary is built with MACOSX_DEPLOYMENT_TARGET=14.0.
  depends_on macos: :sonoma

  def install
    bin.install "btp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/btp --version")
    ENV["BTP_DATA_DIR"] = testpath.to_s
    assert_match "dead_session_idle_s", shell_output("#{bin}/btp config get")
  end
end
