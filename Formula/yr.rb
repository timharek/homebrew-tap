class Yr < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/yr"
  url "https://git.sr.ht/~timharek/yr/archive/v0.0.6.tar.gz"
  sha256 "97d5556582728b38e4e629dfc4515579e9f933596f41607e7a4addc3a5f8a9ad"
  license "GPLv3" 

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "#{bin}/yr", "--version"
  end
end
