require_relative "../helper"
require_relative "../../lib/inspec-suggest/checker"

# TESTING NOTE: This test cheats by relying on the LoadAsJSON Check
# to load the text fixtures.

describe "InspecPlugins::Suggest::Checker::Check::ResourceType" do
  let(:check) { InspecPlugins::Suggest::Checker::Check::ResourceType.new(ui: Inspec::UI.new) }
  let(:loader) { InspecPlugins::Suggest::Checker::Check::LoadAsJSON.new(ui: Inspec::UI.new) }
  let(:file) do
    {
      full_path: File.join(Inspec.src_root, rel_path),
      rel_path: rel_path,
      errors: [],
      warnings: [],
    }
  end

  # when the file contains a command resource
  # when the file contains a variable-reference describe

  [
    "basic",
    "describe.one",
    "all-resource-types",
  ].each do |profile|
    describe "when the file is valid - #{profile}" do
      let(:rel_path) { "lib/plugins/inspec-suggest/test/fixtures/src/#{profile}-v0.1.0/suggest/#{profile}-v0.1.0.rb" }
      it "finds no warnings" do
        loader.run(file)
        res = check.run(file)
        _(res).must_equal true
        _(file[:errors]).must_be_empty
        _(file[:warnings]).must_be_empty
      end
    end
  end

  %w{
    command-resource
    variable-describe
  }.each do |profile|
    describe "when the resource type is unsupported - #{profile}" do
      let(:rel_path) { "lib/plugins/inspec-suggest/test/fixtures/src/#{profile}-v0.1.0/suggest/#{profile}-v0.1.0.rb" }
      it "finds a warning" do
        loader.run(file)
        res = check.run(file)
        _(res).must_equal true # Continue
        _(file[:warnings]).wont_be_empty
        _(file[:errors]).must_be_empty
        _(file[:warnings][0]).must_include "Possible use of a disallowed resource near"
      end
    end
  end
end
