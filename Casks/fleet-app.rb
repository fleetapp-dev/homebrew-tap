cask "fleet-app" do
  version "1.1.0"
  sha256 "a41268f7f35f08ab765efc7c778aa911631f4039b345f0f7222569f319e5ac5a"

  url "https://github.com/DavidKras95/fleet/releases/download/v#{version}/Fleet-v#{version}.zip"
  name "Fleet"
  desc "Native macOS manager for parallel Claude Code agents, tmux-backed"
  homepage "https://fleetapp.dev"

  depends_on macos: ">= :sonoma"
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
