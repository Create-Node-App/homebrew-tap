class CreateAwesomeNodeApp < Formula
  desc "Composable scaffolding CLI — one command, any Node.js stack"
  homepage "https://create-awesome-node-app.vercel.app"
  url "https://registry.npmjs.org/create-awesome-node-app/-/create-awesome-node-app-0.17.4.tgz"
  sha256 "d7851d9063e356fca1df01321bda68ae2bb446c5654e9e0837e763cb2ac344c1"
  license "MIT"

  depends_on "node"

  def install
    # Install from the downloaded tarball (not the unpacked directory):
    # with npm 11, `npm install --prefix <dir> .` links the package shell
    # without dependencies or bins. The tarball form installs the full
    # tree (lib/node_modules) plus bin links. Verified against
    # create-awesome-node-app-0.16.1 (30 packages, working --version).
    system "npm", "install", "--global", "--prefix=#{libexec}", "--omit=dev", "#{cached_download}"
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
