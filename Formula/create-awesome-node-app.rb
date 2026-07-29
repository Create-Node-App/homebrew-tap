class CreateAwesomeNodeApp < Formula
  desc "Composable scaffolding CLI — one command, any Node.js stack"
  homepage "https://create-awesome-node-app.vercel.app"
  url "https://registry.npmjs.org/create-awesome-node-app/-/create-awesome-node-app-0.15.0.tgz"
  sha256 "6c59a7d3d41127ceadcc93a9505d9ae716f6984be43d7774f0f244c1e968d99c"
  license "MIT"

  depends_on "node"

  def install
    # Filter out --min-release-age so freshly-published dependencies (< 24 h) can
    # be installed. Homebrew adds this flag as a supply-chain guard for end users,
    # but it blocks valid releases immediately after publish.
    npm_args = Language::Node.std_npm_install_args(libexec).reject { |a| a.start_with?("--min-release-age") }
    system "npm", "install", *npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/create-awesome-node-app --version")
  end
end
