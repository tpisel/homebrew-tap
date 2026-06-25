class Woke < Formula
  desc "Keep a MacBook awake for remote / lid-closed work, with a matching agent skill"
  homepage "https://github.com/tpisel/woke"
  url "https://github.com/tpisel/woke/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "42c2a622d380e50a62f7bb0f35c6618b907150bf7e9f4a5495fae114d59ca01e"
  license "MIT"

  depends_on :macos

  def install
    zsh_function.install "woke"
    pkgshare.install "SKILL.md"
  end

  def caveats
    <<~EOS
      The `woke` zsh function autoloads in new interactive zsh sessions.

      Two one-time setup steps:
        woke install-skills   # install the Claude/Codex agent skill
        woke init             # passwordless pmset sudoers rule (per machine)

      `woke init` reminds you to run install-skills if the skill isn't present yet.
    EOS
  end

  test do
    assert_path_exists zsh_function/"woke"
    assert_path_exists pkgshare/"SKILL.md"
  end
end
