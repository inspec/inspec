require "helper"
require "inspec/source_reader"

describe Inspec::SourceReader do
  let(:reg) { Inspec::SourceReader }

  it "resolves nil-targets to nil" do
    _(reg.resolve(nil)).must_be_nil
  end

  it "only supports Fetchers" do
    _(proc { reg.resolve("not supported") }).must_raise StandardError
  end
end
