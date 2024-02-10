require "formula"
require_relative "../custom_download_strategy.rb"
class Xcg < Formula
  desc "xcg"
  homepage "https://software.xeneos.com/internal/cli"
  version "0.1.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/XeneosConsultingGroup/xcg-cli/releases/download/v0.1.6/xcg_v0.1.6_darwin_arm64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "112c471429f7263b30dd7548f5a877eb8c5fdbfd3074336d86657a84e03587eb"
  end

  conflicts_with "xcg"

  def install
    bin.install "xcg"
  end

  test do
    system "#{bin}/xcg --version"
  end
end