class CreateAwesomeNodeApp < Formula
  desc "Composable scaffolding CLI — one command, any Node.js stack"
  homepage "https://create-awesome-node-app.vercel.app"
  url "https://registry.npmjs.org/create-awesome-node-app/-/create-awesome-node-app-0.16.1.tgz"
  sha256 "ce693c9fd8a97dddf19c05c299ad1428ba802e7103582c8856e219c9e4d9216d"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--production", "--prefix", libexec, "."
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/create-awesome-node-app --version")
    help = shell_output("#{bin}/create-awesome-node-app --help")
    assert_includes help, "create-awesome-node-app"
    assert_includes help, "list-templates"
    assert_includes help, "list-addons"
  end
end
