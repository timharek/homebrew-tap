class Yr < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/yr"
  url "https://git.sr.ht/~timharek/yr/archive/v0.0.11.tar.gz"
  sha256 "be83d0f46aae37ebb6a508091f0a4282d97f03eb763a844087a8a84ec21393e2"
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
