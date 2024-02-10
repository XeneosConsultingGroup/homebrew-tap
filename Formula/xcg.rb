product:  xcg
releaseUrl:  https://github.com/XeneosConsultingGroup/xcg-cli/releases/download/v0.1.16/xcg_v0.1.16_darwin_arm64.tar.gz
sha:  58ffb9d12a33c4bf1dd1db24b2e151cde2cc02d434316f282fd17ce6f8bf64cb
version:  v0.1.16
visibility:  private
require "formula"
require_relative "../custom_download_strategy.rb"
class Xcg < Formula
  desc "xcg"
  homepage "https://software.xeneos.com/internal/cli"
  version "v0.1.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/XeneosConsultingGroup/xcg-cli/releases/download/v0.1.16/xcg_v0.1.16_darwin_arm64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "58ffb9d12a33c4bf1dd1db24b2e151cde2cc02d434316f282fd17ce6f8bf64cb"
  end

  conflicts_with "xcg"

  def install
    bin.install "xcg"
  end

  test do
    system "#{bin}/xcg --version"
  end
end