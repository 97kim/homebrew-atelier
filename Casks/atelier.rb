cask "atelier" do
  version "0.9.32"
  sha256 "f1e5917a65dc89028a9dc44b74afe846e9fd6c8522535747347e3ff074181ea7"

  url "https://github.com/97kim/Atelier/releases/download/v#{version}/atelier-#{version}-arm64.dmg"
  name "Atelier"
  desc "Chat tabs for Claude Code and Codex"
  homepage "https://github.com/97kim/Atelier"

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
    서명과 공증을 하지 않은 앱이라 처음 열 때 macOS가 막아요.
    시스템 설정 → 개인정보 보호 및 보안에서 "그래도 열기"를 누르거나 다음을 실행하세요.
      xattr -d com.apple.quarantine #{appdir}/Atelier.app
    한 번 허용하면 이후 brew upgrade는 허용을 이어받아요.
  CAVEATS
end
