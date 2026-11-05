cask "keel" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.14.0"
  sha256 arm:   "53d94fde1dde21ece9ed62e47d727cdcaef11dd9d99f907005262425eb83e023",
         intel: "2db685dc64bedd27f15142c03f9baafc3a651ac9819b59a57ad8b012bcb81151"

  url "https://github.com/daneb/keel/releases/download/v#{version}/keel-#{version}-#{arch}-apple-darwin.tar.gz"
  name "keel"
  desc "Gated harness for AI-assisted delivery"
  homepage "https://daneb.github.io/keel/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  binary "keel-#{version}-#{arch}-apple-darwin/keel"
end
