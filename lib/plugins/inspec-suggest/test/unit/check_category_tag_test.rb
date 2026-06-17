require_relative "../helper"
require_relative "../../lib/inspec-suggest/checker"

describe "InspecPlugins::Suggest::Checker::Check::CategoryTag" do
  let(:check) { InspecPlugins::Suggest::Checker::Check::CategoryTag.new(ui: Inspec::UI.new) }
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
            "tags" => {
              "category" => "app",
            },
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

  describe "when there are no tags" do
    let(:json) do
      {
        "controls" => [
          {
            "tags" => {},
          },
        ],
      }
    end
    it "finds an error" do
      res = check.run(file)
      _(res).must_equal false
      _(file[:warnings]).must_be_empty
      _(file[:errors]).wont_be_empty
      _(file[:errors][0]).must_include "Missing 'category' tag"
    end
  end

  describe "when the tags look odd" do
    let(:json) do
      {
        "controls" => [
          {
            "tags" => [], # Not sure this is possible via JSON export
          },
        ],
      }
    end
    it "finds an error" do
      res = check.run(file)
      _(res).must_equal false
      _(file[:warnings]).must_be_empty
      _(file[:errors]).wont_be_empty
      _(file[:errors][0]).must_include "Tags field did not end up as a Hash"
    end
  end

  describe "when the tag value is unrecognized" do
    let(:json) do
      {
        "controls" => [
          {
            "tags" => {
              "category" => "moonwhisk",
            },
          },
        ],
      }
    end
    it "finds a warning" do
      res = check.run(file)
      _(res).must_equal true # Continue
      _(file[:warnings]).wont_be_empty
      _(file[:errors]).must_be_empty
      _(file[:warnings][0]).must_include "not recognized"
    end
  end
end
