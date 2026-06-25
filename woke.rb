class Woke < Formula
  desc "Keep a MacBook awake for remote / lid-closed work, with a matching agent skill"
  homepage "https://github.com/tpisel/woke"
  url "https://github.com/tpisel/woke/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "b23252c63e0b3636d8ed24e752e3d1de367928c4b10ffd9ca531272a10b25f8c"
  license "MIT"

  depends_on :macos

  def install
    bin.install "woke"
    pkgshare.install "SKILL.md"
  end

  def caveats
    <<~EOS
      Two one-time setup steps:
        woke install-skills   # install the Claude/Codex agent skill
        woke init             # passwordless pmset sudoers rule (per machine)

      `woke init` reminds you to run install-skills if the skill isn't present yet.
    EOS
  end

  test do
    assert_path_exists bin/"woke"
    assert_path_exists pkgshare/"SKILL.md"
  end
end
