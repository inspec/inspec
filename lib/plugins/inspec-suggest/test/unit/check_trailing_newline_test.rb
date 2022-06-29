require_relative "../helper"
require_relative "../../lib/inspec-suggest/checker"

describe "InspecPlugins::Suggest::Checker::Check::TrailingNewline" do
  let(:check) { InspecPlugins::Suggest::Checker::Check::TrailingNewline.new(ui: Inspec::UI.new) }
  let(:file) do
    {
      full_path: File.join(Inspec.src_root, rel_path),
      rel_path: rel_path,
      errors: [],
      warnings: [],
    }
  end

  describe "when the file has a newline" do
    let(:rel_path) { "lib/plugins/inspec-suggest/test/fixtures/src/basic-0.1.0/suggest/basic-0.1.0.rb" }
    it "finds no warnings" do
      res = check.run(file)
      _(res).must_equal true
      _(file[:errors]).must_be_empty
      _(file[:warnings]).must_be_empty
    end
  end

  describe "when there is no trailing newline" do
    let(:rel_path) { "lib/plugins/inspec-suggest/test/fixtures/src/no-newline-0.1.0/suggest/no-newline-0.1.0.rb" }
    it "finds a warning" do
      res = check.run(file)
      _(res).must_equal true # Not a show-stopper
      _(file[:errors]).must_be_empty
      _(file[:warnings]).wont_be_empty
      _(file[:warnings][0]).must_include "The file is missing a trailing newline."
    end
  end
end
