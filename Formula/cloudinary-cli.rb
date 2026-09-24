class CloudinaryCli < Formula
  desc "Optimize images locally to WebP and AVIF, upload both variants to Cloudinary"
  homepage "https://github.com/anjuls/cloudinary-cli"
  url "https://github.com/anjuls/cloudinary-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b84ffbb3f336a2a716440d6df052a4806869a7014add93173b6c9a476765f96a"
  license "MIT"
  head "https://github.com/anjuls/cloudinary-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/anjuls/cloudinary-cli/internal/cli.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match "cloudinary-cli version v#{version}", shell_output("#{bin}/cloudinary-cli --version")
  end
end
