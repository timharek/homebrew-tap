class Lyn < Formula
  desc "CLI tool for checking weather"
  homepage "https://git.sr.ht/~timharek/lyn"
  url "https://git.sr.ht/~timharek/lyn/archive/v1.4.0.tar.gz"
  sha256 "1296fbd21d2030f320ac0cec668020cb06cc9d7736f9793355fd224a759365e3"
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
