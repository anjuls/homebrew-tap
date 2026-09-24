class CloudinaryCli < Formula
  desc "Optimize images locally to WebP and AVIF, upload both variants to Cloudinary"
  homepage "https://github.com/anjuls/cloudinary-cli"
  url "https://github.com/anjuls/cloudinary-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "fb5d02e5398d11e15c4e06ab5bfa6960eadff39637f64381a5fcfb238f2e3f6b"
  head "https://github.com/anjuls/cloudinary-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/anjuls/cloudinary-cli/internal/cli.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match "cloudinary-cli version v#{version}", shell_output("#{bin}/cloudinary-cli --version")
  end
end
