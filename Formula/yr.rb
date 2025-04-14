class Yr < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/yr"
  url "https://git.sr.ht/~timharek/yr/archive/v0.0.10.tar.gz"
  sha256 "12f53b30cc7971becdcdcbdaec40485fca16de6a491a5b68b7c912c703e9f27c"
  license "GPLv3" 

  depends_on "go" => :build

  def install
    system "go", "build",
           "-ldflags", "-s -w -X main.Version=v#{version}",
           "-o", bin/"yr", "./cmd/yr"
  end

  test do
    system "#{bin}/yr", "--version"
  end
end
