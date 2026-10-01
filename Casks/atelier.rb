cask "atelier" do
  version "0.9.27"
  sha256 "9f918efb96f96f4e026ff290e0a0ce8f3ac4157b81a4224b6756ceb705d5013a"

  url "https://github.com/97kim/atelier-releases/releases/download/v#{version}/atelier-#{version}-arm64.dmg"
  name "Atelier"
  desc "Chat tabs for Claude Code and Codex"
  homepage "https://github.com/97kim/atelier-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Atelier.app"

  zap trash: [
    "~/Library/Application Support/Atelier",
    "~/Library/Preferences/io.github.97kim.atelier.plist",
    "~/Library/Saved Application State/io.github.97kim.atelier.savedState",
  ]

  caveats <<~CAVEATS
    서명과 공증을 하지 않은 앱이라 처음 열 때 macOS가 막습니다.
    시스템 설정 → 개인정보 보호 및 보안에서 "그래도 열기"를 누르거나 다음을 실행하세요.
      xattr -d com.apple.quarantine #{appdir}/Atelier.app
    한 번 허용하면 이후 brew upgrade 는 허용을 이어받습니다.
  CAVEATS
end
