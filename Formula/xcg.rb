require "formula"
require_relative "../custom_download_strategy.rb"
class Xcg < Formula
  desc "xcg"
  homepage "https://software.xeneos.com/internal/cli"
  version "v1.0.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/XeneosConsultingGroup/xcg-cli/releases/download/v1.0.0/xcg_v1.0.0_darwin_arm64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "ebdd2b50906f673fd2b5742fdb9ef450857b1867ace048442d5df7044c805010"
  end

  conflicts_with "xcg"

  def install
    bin.install "xcg"
  end

  test do
    system "#{bin}/xcg --version"
  end
end