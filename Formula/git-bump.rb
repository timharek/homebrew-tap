class GitBump < Formula
  desc "Easily tag new versions (semver) with git."
  homepage "https://git.sr.ht/~timharek/git-bump"
  url "https://git.sr.ht/~timharek/git-bump/archive/v0.2.0.tar.gz"
  sha256 "5061a07a9b046b0b8ebac9fa2d8ed3e5766e6f88899e405327ee86d4333694d4"
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
