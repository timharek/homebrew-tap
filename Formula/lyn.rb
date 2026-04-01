class Lyn < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/lyn"
  url "https://git.sr.ht/~timharek/lyn/archive/v1.2.0.tar.gz"
  sha256 "7746c3207ec403727db3ffeee117180315ae80e4d099a89873240221a40ca8b6"
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
