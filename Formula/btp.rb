# Template. The release workflow renders it with scripts/render-homebrew.sh
# (real version in the url, real sha256) and attaches the result to the
# GitHub release; copy that file to matthieuh/homebrew-tap as Formula/btp.rb.
class Btp < Formula
  desc "Kill dev servers left behind by coding-agent sessions"
  homepage "https://github.com/matthieuh/balance-ton-port"
  url "https://github.com/matthieuh/balance-ton-port/releases/download/v0.4.5/btp-0.4.5-macos-universal.tar.gz"
  sha256 "7a5e926b258b0e89aca894b0808363d61c4b9ad937ba84e067bb30aec4cb6e33"
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
