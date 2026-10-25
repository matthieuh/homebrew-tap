# Template. The release workflow renders it with scripts/render-homebrew.sh
# (real version and sha256) and attaches the result to the GitHub release;
# copy that file to matthieuh/homebrew-tap as Casks/balance-ton-port.rb.
cask "balance-ton-port" do
  version "0.4.3"
  sha256 "cf5ab098f475eef70f90720bc2494f698331d33d977065b2f52d4dd58469685a"

  url "https://github.com/matthieuh/balance-ton-port/releases/download/v#{version}/BalanceTonPort-#{version}.dmg"
  name "Balance ton port"
  desc "Menu bar app that kills dev servers left behind by coding-agent sessions"
  homepage "https://github.com/matthieuh/balance-ton-port"

  auto_updates true
  depends_on macos: :sonoma

  app "Balance ton port.app"

  uninstall quit: "com.matthieuh.balancetonport"

  # Shared with the btp CLI: config.toml and the kill history.
  zap trash: "~/Library/Application Support/balance-ton-port"
end
