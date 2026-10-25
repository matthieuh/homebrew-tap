# Template. The release workflow renders it with scripts/render-homebrew.sh
# (real version and sha256) and attaches the result to the GitHub release;
# copy that file to matthieuh/homebrew-tap as Casks/balance-ton-port.rb.
cask "balance-ton-port" do
  version "0.4.0"
  sha256 "ef2b174e89490383b4066aef3a6c50aa72610f4811208c314f62d107b860fd3c"

  url "https://github.com/matthieuh/balance-ton-port/releases/download/v#{version}/BalanceTonPort-#{version}.dmg"
  name "Balance ton port"
  desc "Menu bar app that kills dev servers left behind by coding-agent sessions"
  homepage "https://github.com/matthieuh/balance-ton-port"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Balance ton port.app"

  uninstall quit: "com.matthieuh.balancetonport"

  # Shared with the btp CLI: config.toml and the kill history.
  zap trash: "~/Library/Application Support/balance-ton-port"
end
