cask "moor" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.10.0"
  sha256 arm:   "302bb37596c39f986c0c4da44168d6124d6131b59c772604620b28c720c2eb21",
         intel: "656b31e80af18e198b57f64801026baade7de186e6decc14b8bbcdaf7b0b92d2"

  url "https://github.com/daneb/moor/releases/download/v#{version}/moor-#{version}-#{arch}-apple-darwin.tar.gz"
  name "moor"
  desc "Build software with an AI agent inside a locked-down container"
  homepage "https://github.com/daneb/moor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  binary "moor-#{version}-#{arch}-apple-darwin/moor"

  caveats <<~EOS
    moor drives Docker, which this cask does not install. You need a running
    Docker-compatible engine (Docker Desktop, OrbStack, Colima).

    The sandbox images are built locally, from the sources shipped alongside
    the binary:

      #{staged_path}/moor-#{version}-#{arch}-apple-darwin/share/moor/images/build.sh
  EOS
end
