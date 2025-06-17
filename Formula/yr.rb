class Yr < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/yr"
  url "https://git.sr.ht/~timharek/yr/archive/v1.0.0.tar.gz"
  sha256 "bc8980f06abc23b80fa2e8a8adcfbeeb3fa98b35d4ae883540c9e3c6cb627cba"
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
