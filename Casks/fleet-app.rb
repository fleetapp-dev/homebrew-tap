cask "fleet-app" do
  version "1.6.1"
  sha256 "7e3d23b0a136f29f44bf88f2b6c958c363b3d504c4e45eee7027351dbc62fcd0"

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
