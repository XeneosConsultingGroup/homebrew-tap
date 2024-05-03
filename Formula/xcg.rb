require "formula"
require_relative "../custom_download_strategy.rb"
class Xcg < Formula
  desc "xcg"
  homepage "https://software.xeneos.com/internal/cli"
  version "v1.0.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/XeneosConsultingGroup/xcg-cli/releases/download/v1.0.2/xcg_v1.0.2_darwin_arm64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "32c73e536752ce72fa3d96502710e49ed1124de3e092390e02a416175951c656"
  end

  conflicts_with "xcg"

  def install
    bin.install "xcg"
  end

  test do
    system "#{bin}/xcg --version"
  end
end