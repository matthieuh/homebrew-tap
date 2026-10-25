# Template. The release workflow renders it with scripts/render-homebrew.sh
# (real version and sha256) and attaches the result to the GitHub release;
# copy that file to matthieuh/homebrew-tap as Casks/balance-ton-port.rb.
cask "balance-ton-port" do
  version "0.4.2"
  sha256 "1364bea5da9726841934bad94995ed67d98576fd14cde201f67958adc7fba57a"

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
