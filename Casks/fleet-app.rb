cask "fleet-app" do
  version "1.6.2"
  sha256 "b3d61dd4736a33fdba657aa61591a82d8fed8d82991d6c33d69574eb21da7223"

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
