class GitBump < Formula
  desc "Easily tag new versions (semver) with git."
  homepage "https://git.sr.ht/~timharek/git-bump"
  url "https://git.sr.ht/~timharek/git-bump/archive/v0.1.1.tar.gz"
  sha256 "6ff6aeeac8d262d858b5d7be3878d3dedc7f9892fb2bb3ab38bbc2400c9c0eda"
  license "GPLv3" 

  depends_on "go" => :build

  def install
    system "go", "build",
           "-ldflags", "-s -w -X main.Version=v#{version}",
           "-o", bin/"git-bump", "./cmd/git-bump"
  end

  test do
    system "#{bin}/git-bump", "--version"
  end
end
