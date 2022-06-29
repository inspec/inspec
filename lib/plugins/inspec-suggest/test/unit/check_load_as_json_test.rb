require_relative "../helper"
require_relative "../../lib/inspec-suggest/checker"

describe "InspecPlugins::Suggest::Checker::Check::LoadAsJSON" do
  let(:check) { InspecPlugins::Suggest::Checker::Check::LoadAsJSON.new(ui: Inspec::UI.new) }
  let(:file) do
    {
      full_path: File.join(Inspec.src_root, rel_path),
      rel_path: rel_path,
      errors: [],
      warnings: [],
    }
  end

  describe "when the file is valid" do
    let(:rel_path) { "lib/plugins/inspec-suggest/test/fixtures/src/basic-0.1.0/suggest/basic-0.1.0.rb" }
    it "finds no warnings" do
      res = check.run(file)
      _(res).must_equal true
      _(file[:errors]).must_be_empty
      _(file[:warnings]).must_be_empty
      _(file[:as_json]).must_be_kind_of Hash
      _(file[:as_json].keys).must_include "controls"
    end
  end

  describe "when the file is invalid" do
    let(:rel_path) { "lib/plugins/inspec-suggest/test/fixtures/src/bad-syntax-0.1.0/suggest/bad-syntax-0.1.0.rb" }
    it "finds an error" do
      res = check.run(file)
      _(res).must_equal false
      _(file[:warnings]).must_be_empty
      _(file[:errors]).wont_be_empty
      _(file[:errors][0]).must_include "Failed to export as JSON:"
    end
  end
end
