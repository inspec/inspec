require "helper"

describe Inspec::Plugins::Resource do
  let(:base) { Inspec::Plugins::Resource }

  describe "#name" do
    it "won't register a nil resource" do
      Class.new(base) { name nil; }
      Inspec::Resource.registry.keys.wont_include nil
      Inspec::Resource.registry.keys.wont_include ""
    end

    it "will register a valid name" do
      Class.new(base) { name "hello"; }
      Inspec::Resource.registry["hello"].wont_be :nil?
    end
  end

  def create(&block)
    random_name = (0...50).map { (65 + rand(26)).chr }.join
    Class.new(base) do
      name random_name
      instance_eval(&block)
    end
    Inspec::Resource.registry[random_name]
  end

  describe "#desc" do
    it "will register a description" do
      expected = rand.to_s
      create { desc expected }.desc.must_equal expected
    end

    it "can change the description" do
      c = create { desc rand.to_s }
      c.desc(x = rand.to_s)
      c.desc.must_equal x
    end
  end

  describe "#example" do
    it "will register a description" do
      expected = rand.to_s
      create { example expected }.example.must_equal expected
    end

    it "can change the description" do
      c = create { example rand.to_s }
      c.example(x = rand.to_s)
      c.example.must_equal x
    end
  end

  describe "supported platform" do
    def supports_meta(supports)
      Inspec::Resource.supports["os"] = supports
      load_resource("os")
    end

    it "loads a profile which supports multiple families" do
      m = supports_meta([
        { os_family: "windows" },
        { os_family: "unix" }
      ])
      m.check_supports.must_equal true
      Inspec::Resource.supports["os"] = nil
    end

    it "loads a profile which supports multiple names" do
      m = supports_meta([
        { os_family: "windows", os_name: "windows_2000" },
        { os_family: "unix", os_name: "ubuntu" }
      ])
      m.check_supports.must_equal true
      Inspec::Resource.supports["os"] = nil
    end

    it "reject a profile which supports multiple families" do
      m = supports_meta([
        { os_family: "windows" },
        { os_family: "redhat" }
      ])
      m.check_supports.must_equal false
      Inspec::Resource.supports["os"] = nil
    end
  end
end
