class Lyn < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/lyn"
  url "https://git.sr.ht/~timharek/lyn/archive/v1.1.0.tar.gz"
  sha256 "3595146c6769657f85e339943ce60a98f66a822012e0cd5a980a8a268a650fff"
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
