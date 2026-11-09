cask "fleet-app" do
  version "1.6.5"
  sha256 "c05616acc9a6f8c1b0c51281875ca87c7d86083670681521e43ac7ed2daa5eb8"

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
