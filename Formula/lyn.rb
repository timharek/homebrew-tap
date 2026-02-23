class Lyn < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/lyn"
  url "https://git.sr.ht/~timharek/lyn/archive/v1.0.0.tar.gz"
  sha256 "eb26b3eac8db0a616daa4b1ac93bfcc2fc9451293b09ad2263f4f6db8f2f3220"
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
