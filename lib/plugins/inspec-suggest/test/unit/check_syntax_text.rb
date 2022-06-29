require_relative "../helper"
require_relative "../../lib/inspec-suggest/checker"

describe "InspecPlugins::Suggest::Checker::Check::Syntax" do
  let(:check) { InspecPlugins::Suggest::Checker::Check::Syntax.new(ui: Inspec::UI.new) }
  let(:file) do
    {
      full_path: File.join(Inspec.src_root, rel_path),
      rel_path: rel_path,
      errors: [],
      warnings: [],
    }
  end

  describe "when the syntax is OK" do
    let(:rel_path) { "lib/plugins/inspec-suggest/test/fixtures/src/basic-0.1.0/suggest/basic-0.1.0.rb" }
    it "finds no errors" do
      res = check.run(file)
      _(res).must_equal true
      _(file[:errors]).must_be_empty
      _(file[:warnings]).must_be_empty
      _(file[:basename]).must_equal "basic-0.1.0.rb"
    end
  end

  describe "when there is an error" do
    let(:rel_path) { "lib/plugins/inspec-suggest/test/fixtures/src/bad-syntax-0.1.0/suggest/bad-syntax-0.1.0.rb" }
    it "finds an error" do
      res = check.run(file)
      _(res).must_equal false
      _(file[:warnings]).must_be_empty
      _(file[:errors]).wont_be_empty
      _(file[:basename]).must_equal "bad-syntax-0.1.0.rb"
      _(file[:errors][0]).must_include "Syntax check failed:"
    end
  end
end
