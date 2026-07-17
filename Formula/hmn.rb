# typed: false
# frozen_string_literal: true

# 0.17.x releases ship a bare darwin-arm64 binary asset (manual release path;
# the GoReleaser tarball pipeline that generated this formula is not currently
# in use — restore it to re-enable amd64/linux + auto-bumps).
class Hmn < Formula
  desc "HeavyMetal Network provider node CLI"
  homepage "https://heavymetal.network"
  version "0.17.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heavymetal-network/hmn-cli-pub/releases/download/v0.17.13/hmn-darwin-arm64"
      sha256 "1f4559aa74ffe782f38265b1b1c3fb024fe703600191e65e0394c8cc6edb7502"

      define_method(:install) do
        bin.install "hmn-darwin-arm64" => "hmn"
      end
    end
  end

  test do
    system "#{bin}/hmn", "--version"
  end
end
