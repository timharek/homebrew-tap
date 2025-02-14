class Migadu < Formula
  desc "CLI tool for interacting with Migadu"
  homepage "https://sr.ht/~timharek/migadu"
  url "https://git.sr.ht/~timharek/migadu/archive/v0.0.1.tar.gz"
  sha256 "ee792b5ebaa84c069429d3bfe35eeebae4013628a59845e3be76d829558bc030"
  license "GPLv3" 

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "#{bin}/migadu", "--version"
  end
end
