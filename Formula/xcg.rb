require "formula"
require_relative "../custom_download_strategy.rb"
class Xcg < Formula
  desc "xcg"
  homepage "https://software.xeneos.com/internal/cli"
  version "0.1.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/XeneosConsultingGroup/xcg-cli/releases/download/v0.1.4/xcg_v0.1.4_darwin_arm64.tar.gz", :using => GitHubReleaseDownloadStrategy
    sha256 "a8e1474fec19023aa083a8eeb926d9ac2d01ae75e0bcded375f47c5faf7df786"
  end

  conflicts_with "xcg"

  def install
    bin.install "xcg"
  end

  test do
    system "#{bin}/xcg --version"
  end
end