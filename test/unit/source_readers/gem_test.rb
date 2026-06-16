require "helper"
require "inspec/source_reader"
require "source_readers/gem"

describe SourceReaders::GemReader do
  let(:reader) { SourceReaders::GemReader }

  it "registers with the source readers registry" do
    reg = Inspec::SourceReader.registry
    _(reg["gem"]).must_equal reader
  end

  describe "resolve" do
    class MockTarget
      attr_reader :files
      def initialize(files)
        @files = files
      end

      def read(file)
        if file == "inspec.yml"
          "name: my_gem\nversion: 0.1.0\n"
        else
          "dummy content"
        end
      end
    end

    it "resolves the target when gemspec is in root" do
      target = MockTarget.new(["inspec.yml", "my_gem.gemspec", "lib/my_gem.rb"])
      res = SourceReaders::GemReader.resolve(target)
      _(res).wont_be_nil
      _(res).must_be_kind_of reader
    end

    it "does not resolve the target when gemspec is in a subfolder" do
      target = MockTarget.new(["inspec.yml", "vendor/bundle/ruby/3.1.0/specifications/other.gemspec"])
      res = SourceReaders::GemReader.resolve(target)
      _(res).must_be_nil
    end

    it "does not resolve the target when there is no gemspec" do
      target = MockTarget.new(["inspec.yml", "controls/example.rb"])
      res = SourceReaders::GemReader.resolve(target)
      _(res).must_be_nil
    end
  end
end
