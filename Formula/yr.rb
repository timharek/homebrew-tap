class Yr < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/yr"
  url "https://git.sr.ht/~timharek/yr/archive/v1.1.0.tar.gz"
  sha256 "cf7b92d980f74278623306f4b715acfd69c629266849f61999570005b3f2cc7e"
  license "GPLv3"
  deprecate! date: "2026-02-23", because: "it has been replaced by https://git.sr.ht/~timharek/lyn"

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
