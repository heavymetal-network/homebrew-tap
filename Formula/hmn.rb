# typed: false
# frozen_string_literal: true

# 0.17.x releases ship a bare darwin-arm64 binary asset (manual release path;
# the GoReleaser tarball pipeline that generated this formula is not currently
# in use — restore it to re-enable amd64/linux + auto-bumps).
class Hmn < Formula
  desc "HeavyMetal Network provider node CLI"
  homepage "https://heavymetal.network"
  version "0.17.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heavymetal-network/hmn-cli-pub/releases/download/v0.17.8/hmn-darwin-arm64"
      sha256 "5556a5dbb48df522d9a05757879ddbb6403e50ab2aee17fc2b1c43f7603a4c71"

      define_method(:install) do
        bin.install "hmn-darwin-arm64" => "hmn"
      end
    end
  end

  test do
    system "#{bin}/hmn", "--version"
  end
end
