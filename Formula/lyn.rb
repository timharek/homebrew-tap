class Lyn < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/lyn"
  url "https://git.sr.ht/~timharek/lyn/archive/v1.3.0.tar.gz"
  sha256 "432629cd44d6f2ffb991fdd1b148cb5abac84b37fe909cb1b5d8b6a268926f1e"
  license "GPLv3" 

  depends_on "go" => :build

  def install
    system "go", "build",
           "-ldflags", "-s -w -X main.Version=v#{version}",
           "-o", bin/"lyn", "./cmd/lyn"
  end

  test do
    system "#{bin}/lyn", "--version"
  end
end
