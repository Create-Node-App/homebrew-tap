class CreateAwesomeNodeApp < Formula
  desc "Composable scaffolding CLI — one command, any Node.js stack"
  homepage "https://create-awesome-node-app.vercel.app"
  url "https://registry.npmjs.org/create-awesome-node-app/-/create-awesome-node-app-0.11.3.tgz"
  sha256 "f656f918cee8d4095c5d17b264113d17498cf594bab1f20b2890a3421e738d6c"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/create-awesome-node-app --version")
  end
end
