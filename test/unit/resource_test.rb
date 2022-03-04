require "helper"
require "inspec/resource"
require "inspec/resources/os"

# TODO: remove or merge tests with resource_test.rb

describe Inspec::Resource do
  let(:base) { Inspec::Resource }

  describe "#name" do
    it "won't register a nil resource" do
      Class.new(base) { name nil; }
      _(Inspec::Resource.registry.keys).wont_include nil
      _(Inspec::Resource.registry.keys).wont_include ""
    end

    it "will register a valid name" do
      Class.new(base) { name "hello"; }
      _(Inspec::Resource.registry["hello"]).wont_be :nil?
    end
  end

  def create(&block)
    # random_name = (0...50).map { (65 + rand(26)).chr }.join
    random_name = "NotSoRandomName"
    Class.new(base) do
      name random_name
      instance_eval(&block)
    end
    Inspec::Resource.registry[random_name]
  end

  describe "#desc" do
    it "will register a description" do
      expected = rand.to_s
      _(create { desc expected }.desc).must_equal expected
    end

    it "can change the description" do
      c = create { desc rand.to_s }
      c.desc(x = rand.to_s)
      _(c.desc).must_equal x
    end
  end

  describe "#example" do
    it "will register a description" do
      expected = rand.to_s
      _(create { example expected }.example).must_equal expected
    end

    it "can change the description" do
      c = create { example rand.to_s }
      c.example(x = rand.to_s)
      _(c.example).must_equal x
    end
  end

  describe "supported platform" do
    def supports_meta(supports)
      @old = Inspec::Resource.support_registry[:os]
      Inspec::Resource.support_registry[:os] = supports
      load_resource("os")
    end

    after do
      Inspec::Resource.support_registry[:os] = @old
    end

    it "loads a profile which supports multiple families" do
      m = supports_meta([
        { os_family: "windows" },
        { os_family: "unix" },
      ])
      _(m.check_supports).must_equal true
      Inspec::Resource.support_registry["os"] = nil
    end

    it "loads a profile which supports multiple names" do
      m = supports_meta([
        { os_family: "windows", os_name: "windows_2000" },
        { os_family: "unix", os_name: "ubuntu" },
      ])
      _(m.check_supports).must_equal true
      Inspec::Resource.support_registry["os"] = nil
    end

    it "reject a profile which supports multiple families" do
      m = supports_meta([
        { os_family: "windows" },
        { os_family: "redhat" },
      ])
      _(m.check_supports).must_equal false
      Inspec::Resource.support_registry["os"] = nil
    end
  end
end
