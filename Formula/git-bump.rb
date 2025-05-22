class GitBump < Formula
  desc "Easily tag new versions (semver) with git."
  homepage "https://git.sr.ht/~timharek/git-bump"
  url "https://git.sr.ht/~timharek/git-bump/archive/v0.1.0.tar.gz"
  sha256 "7c900de5c520490e5c95dd0bd42975298d1ffa8b626b35ae88376723c0d0d5bc"
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
