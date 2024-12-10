require_relative "../helper"
require_relative "../../lib/inspec-suggest/checker"

describe "InspecPlugins::Suggest::Checker::Check::RootPathInput" do
  let(:check) { InspecPlugins::Suggest::Checker::Check::RootPathInput.new(ui: Inspec::UI.new) }
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
        "inputs" => [
          {
            "name" => "root_path",
            "options" => {
              "value" => "/",
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

  describe "when there are no inputs" do
    let(:json) do
      {
        "inputs" => [],
      }
    end
    it "finds a warning" do
      res = check.run(file)
      _(res).must_equal true # Do not stop
      _(file[:warnings]).wont_be_empty
      _(file[:errors]).must_be_empty
      _(file[:warnings][0]).must_include "Missing root_path input"
    end
  end

  describe "when the root_path input has no default" do
    let(:json) do
      {
        "inputs" => [
          {
            "name" => "root_path",
            "options" => {},
          },
        ],
      }
    end
    it "finds a warning" do
      res = check.run(file)
      _(res).must_equal true # Do not stop
      _(file[:warnings]).wont_be_empty
      _(file[:errors]).must_be_empty
      _(file[:warnings][0]).must_include "root_path input default value should be '/'"
    end
  end

  describe "when the root_path input has the wrong default" do
    let(:json) do
      {
        "inputs" => [
          {
            "name" => "root_path",
            "options" => {
              "value" => "C:\\",
            },
          },
        ],
      }
    end
    it "finds a warning" do
      res = check.run(file)
      _(res).must_equal true # Do not stop
      _(file[:warnings]).wont_be_empty
      _(file[:errors]).must_be_empty
      _(file[:warnings][0]).must_include "root_path input default value should be '/'"
    end
  end
end
