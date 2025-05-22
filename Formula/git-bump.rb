class GitBump < Formula
  desc "Easily tag new versions (semver) with git."
  homepage "https://git.sr.ht/~timharek/git-bump"
  url "https://git.sr.ht/~timharek/git-bump/archive/v0.1.0.tar.gz"
  sha256 "552cb0cde8a637634720e86108abb440a6fb33b8b23658c6904edc9fc7dbb1dd"
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
