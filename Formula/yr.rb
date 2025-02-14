class Yr < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/yr"
  url "https://git.sr.ht/~timharek/yr/archive/v0.0.7.tar.gz"
  sha256 "d7346b41b86a46b19998fc8b0a9c6584e77b22abeae81c58e5540c794316740c"
  license "GPLv3" 

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "#{bin}/yr", "--version"
  end
end
