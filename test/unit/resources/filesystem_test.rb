require "helper"
require "inspec/resource"
require "inspec/resources/filesystem"

describe "Inspec::Resources::FileSystemResource" do
  it "verify filesystem on linux" do
    resource = quick_resource(:filesystem, :linux, "/") do |cmd|
      stdout_file "test/fixtures/cmd/df-PT"
    end

    _(resource.size_kb).must_equal 30428648
    _(resource.size).must_equal 30428648
    _(resource.name).must_equal "/"
    _(resource.type).must_equal "ext4"
    _(resource.free_kb).must_equal 20760728
    _(resource.percent_free).must_equal 68
  end

  # windows
  it "verify filesystem on windows" do
    resource = MockLoader.new(:windows).load_resource("filesystem", "c:")
    _(resource.size).must_equal 38 # Windows size() had a bug that turned it into GB, not KB
    _(resource.size_kb).must_equal 40000000 # approx 38 GB
    _(resource.name).must_equal "c:"
    _(resource.type).must_equal "NTFS"
    _(resource.free_kb).must_equal 30000000
    _(resource.percent_free).must_equal 75
  end
end
