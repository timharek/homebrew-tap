class Yr < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/yr"
  url "https://git.sr.ht/~timharek/yr/archive/v0.0.8.tar.gz"
  sha256 "5eff6975d4f9a4f6382d0e1b41fb595730651c85240ba59845c4e6fc4659f8b9"
  license "GPLv3" 

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "#{bin}/yr", "--version"
  end
end
