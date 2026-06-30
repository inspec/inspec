require "helper"
require "inspec/source_reader"
require "source_readers/gem"

describe SourceReaders::GemReader do
  let(:reader) { SourceReaders::GemReader }

  it "registers with the source readers registry" do
    reg = Inspec::SourceReader.registry
    _(reg["gem"]).must_equal reader
  end

  describe "when resolving profiles" do
    it "does not resolve a profile with gemspec only in vendor directory" do
      files = ["inspec.yml", "controls/test.rb", "vendor/abc123/test.gemspec"]
      mock_provider = Minitest::Mock.new
      mock_provider.expect :files, files

      result = reader.resolve(mock_provider)
      _(result).must_be_nil
      mock_provider.verify
    end

    it "does not resolve a profile with no gemspec" do
      files = ["inspec.yml", "controls/test.rb"]
      mock_provider = Minitest::Mock.new
      mock_provider.expect :files, files
      result = reader.resolve(mock_provider)
      _(result).must_be_nil
      mock_provider.verify
    end

    it "filters vendor gemspecs correctly" do
      # This test verifies the fix: gemspec in vendor/ should be filtered out
      files = ["inspec.yml", "controls/test.rb", "vendor/abc123/test.gemspec"]
      mock_provider = Minitest::Mock.new
      mock_provider.expect :files, files
      # The gem reader should NOT resolve since the only gemspec is in vendor/
      result = reader.resolve(mock_provider)
      _(result).must_be_nil
      mock_provider.verify
    end
  end
end
