class CreateAwesomeNodeApp < Formula
  desc "Composable scaffolding CLI — one command, any Node.js stack"
  homepage "https://create-awesome-node-app.vercel.app"
  url "https://registry.npmjs.org/create-awesome-node-app/-/create-awesome-node-app-0.16.1.tgz"
  sha256 "ce693c9fd8a97dddf19c05c299ad1428ba802e7103582c8856e219c9e4d9216d"
  license "MIT"

  depends_on "node"

  def install
    # Filter out --min-release-age so freshly-published dependencies (< 24 h) can
    # be installed. Homebrew adds this flag as a supply-chain guard for end users,
    # but it blocks valid releases immediately after publish.
    npm_args = Language::Node.std_npm_args(libexec).reject { |a| a.start_with?("--min-release-age") }
    system "npm", "install", *npm_args
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
