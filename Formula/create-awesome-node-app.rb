class CreateAwesomeNodeApp < Formula
  desc "Composable scaffolding CLI — one command, any Node.js stack"
  homepage "https://create-awesome-node-app.vercel.app"
  url "https://registry.npmjs.org/create-awesome-node-app/-/create-awesome-node-app-0.13.0.tgz"
  sha256 "23e998bcba66a310cbd0084786ceca82464866c7ad60f70c74873f875cab9540"
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
