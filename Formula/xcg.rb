require "formula"
require_relative "../custom_download_strategy.rb"
class Xcg < Formula
  desc "xcg"
  homepage "https://software.xeneos.com/internal/cli"
  version "v1.0.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/XeneosConsultingGroup/xcg-cli/releases/download/v1.0.1/xcg_v1.0.1_darwin_arm64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "78c9d110ebe1afcd71ca48e35bdfee6968eb3c3e367785110486b81e9a1b07f5"
  end

  conflicts_with "xcg"

  def install
    bin.install "xcg"
  end

  test do
    system "#{bin}/xcg --version"
  end
end