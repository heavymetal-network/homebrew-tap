# typed: false
# frozen_string_literal: true

# Release archives use the promoted GCP CLI delivery API.
class Hmn < Formula
  desc "HeavyMetal Network provider node CLI"
  homepage "https://heavymetal.network"
  version "0.17.81"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://api.heavymetal.network/v3/cli/releases/0.17.81/hmn_0.17.81_darwin_amd64.tar.gz"
      sha256 "f089a3540c6515a34e3c438c4a545bcff213a036b02c65d8c6c03d921597fe14"

      define_method(:install) do
        bin.install "hmn"
        doc.install "NOTICE"
      end
    end
    if Hardware::CPU.arm?
      url "https://api.heavymetal.network/v3/cli/releases/0.17.81/hmn_0.17.81_darwin_arm64.tar.gz"
      sha256 "f4d3bc9206c313dd358904bb343b83c5e3067707abb97d32149cdfeadc691e80"

      define_method(:install) do
        bin.install "hmn"
        doc.install "NOTICE"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://api.heavymetal.network/v3/cli/releases/0.17.81/hmn_0.17.81_linux_amd64.tar.gz"
      sha256 "384c100e4f8273c2379373335843aee1c487cb017eb85899c7d02dc3d3e4da05"
      define_method(:install) do
        bin.install "hmn"
        doc.install "NOTICE"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://api.heavymetal.network/v3/cli/releases/0.17.81/hmn_0.17.81_linux_arm64.tar.gz"
      sha256 "5b530e48f850da87807cab9867f96a46485fb8b7b4d5e406275a6f343d55d6ca"
      define_method(:install) do
        bin.install "hmn"
        doc.install "NOTICE"
      end
    end
  end

  test do
    system "#{bin}/hmn", "--version"
  end
end
