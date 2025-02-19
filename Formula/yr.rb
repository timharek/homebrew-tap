class Yr < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/yr"
  url "https://git.sr.ht/~timharek/yr/archive/v0.0.9.tar.gz"
  sha256 "1d281b314d703cd6e8143907266d0930b5240427656135fcd8693b68480af926"
  license "GPLv3" 

  depends_on "go" => :build

  def install
    system "go", "build", 
           "-ldflags", "-s -w -X git.sr.ht/~timharek/yr/cmd.Version=v#{version}",
           *std_go_args
  end

  test do
    system "#{bin}/yr", "--version"
  end
end
