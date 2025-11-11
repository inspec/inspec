require_relative "../helper"
require_relative "../../lib/inspec-suggest/checker"

describe "InspecPlugins::Suggest::Checker::Check::ControlID" do
  let(:check) { InspecPlugins::Suggest::Checker::Check::ControlID.new(ui: Inspec::UI.new) }
  let(:rel_path) { "lib/plugins/inspec-suggest/test/fixtures/src/basic-v0.1.0/suggest/basic-v0.1.0.rb" }
  let(:file) do
    {
      full_path: File.join(Inspec.src_root, rel_path),
      rel_path: rel_path,
      as_json: json,
      errors: [],
      warnings: [],
    }
  end

  describe "when the file is valid" do
    let(:json) do
      {
        "controls" => [
          {
            "id" => "basic-v0.1.0",
          },
        ],
      }
    end
    it "finds no errors" do
      res = check.run(file)
      _(res).must_equal true
      _(file[:errors]).must_be_empty
      _(file[:warnings]).must_be_empty
    end
  end

  describe "when there are no controls" do
    let(:json) do
      {
        "controls" => [],
      }
    end
    it "finds an error" do
      res = check.run(file)
      _(res).must_equal false
      _(file[:warnings]).must_be_empty
      _(file[:errors]).wont_be_empty
      _(file[:errors][0]).must_include "No controls detected in the file."
    end
  end

  describe "when there are 2 controls" do
    let(:json) do
      {
        "controls" => [
          {
            "id" => "basic-v0.1.0",
          },
          {
            "id" => "something-else",
          },
        ],
      }
    end
    it "finds an error" do
      res = check.run(file)
      _(res).must_equal false
      _(file[:warnings]).must_be_empty
      _(file[:errors]).wont_be_empty
      _(file[:errors][0]).must_include "Too many controls detected in the file"
    end
  end

  describe "when the control id does not end with semver" do
    let(:json) do
      {
        "controls" => [
          {
            "id" => "basic",
          },
        ],
      }
    end
    it "finds an error" do
      res = check.run(file)
      _(res).must_equal false
      _(file[:warnings]).must_be_empty
      _(file[:errors]).wont_be_empty
      _(file[:errors][0]).must_include "does not end in vN.N.N"
    end
  end

  describe "when the control id does not match the profile name" do
    let(:json) do
      {
        "controls" => [
          {
            "id" => "fabulous-v0.1.0",
          },
        ],
      }
    end
    it "finds an error" do
      res = check.run(file)
      _(res).must_equal false
      _(file[:warnings]).must_be_empty
      _(file[:errors]).wont_be_empty
      _(file[:errors][0]).must_include "does not match profile dir name"
    end
  end
end
