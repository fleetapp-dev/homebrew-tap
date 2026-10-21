cask "fleet-app" do
  version "1.2.0"
  sha256 "b1e76ea9ec51725cf22cf54107798ddf5eb0bd0b6a714e973a5ce7001a201656"

  url "https://github.com/fleetapp-dev/fleet/releases/download/v#{version}/Fleet-v#{version}.zip"
  name "Fleet"
  desc "Native macOS manager for parallel Claude Code agents, tmux-backed"
  homepage "https://fleetapp.dev"

  depends_on macos: :sonoma
  depends_on formula: "tmux"
  depends_on formula: "jq"

  app "Fleet.app"

  caveats <<~EOS
    Open Fleet once to finish setup. Requires the `claude` CLI on your PATH.
  EOS

  zap trash: [
    "~/.claude/hooks/agent-tmux-status.sh",
    "~/.config/fleet",
    "~/Library/Preferences/com.davidkr.fleet.plist",
  ]
end
