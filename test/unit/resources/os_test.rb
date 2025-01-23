require "helper"
require "inspec/resource"
require "inspec/resources/os"

# rubocop:disable Metrics/BlockLength
describe "Inspec::Resources::Os" do
  it "verify os parsing on CentOS" do
    resource = MockLoader.new(:centos7).load_resource("os")
    _(resource.resource_id).must_equal "centos"
    _(resource.name).must_equal "centos"
    _(resource.family).must_equal "redhat"
    _(resource.release).must_equal "7.1.1503"
    _(resource.arch).must_equal "x86_64"
  end

  it "read env variable on Windows" do
    resource = MockLoader.new(:windows).load_resource("os")
    _(resource.resource_id).must_equal "windows"
    _(resource.name).must_equal "windows"
    _(resource.family).must_equal "windows"
    _(resource.release).must_equal "6.2.9200"
    _(resource.arch).must_equal "x86_64"
  end

  it "verify os parsing on Debian" do
    resource = MockLoader.new(:debian8).load_resource("os")
    _(resource.resource_id).must_equal "debian"
    _(resource.name).must_equal "debian"
    _(resource.family).must_equal "debian"
    _(resource.release).must_equal "8"
    _(resource.arch).must_equal "x86_64"
  end

  it "verify os parsing on Ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("os")
    _(resource.name).must_equal "ubuntu"
    _(resource.family).must_equal "debian"
    _(resource.release).must_equal "22.04"
    _(resource.arch).must_equal "x86_64"
  end

  it "verify os parsing on Mint" do
    resource = MockLoader.new(:mint18).load_resource("os")
    _(resource.name).must_equal "linuxmint"
    _(resource.family).must_equal "debian"
    _(resource.release).must_equal "18"
    _(resource.arch).must_equal "x86_64"
  end

  describe "#platform_specific_info" do
    it "returns build version for darwin" do
      resource = MockLoader.new(:macos1472).load_resource("os")
      _(resource.release).must_equal "14.7.2"
      _(resource.params[:version][:build]).must_equal "23H311"
    end

    it "returns nil build version for non-darwin platforms" do
      resource = MockLoader.new(:undefined).load_resource("os")
      _(resource.params[:version][:build]).must_be_nil
    end
  end

  describe "Version" do
    let(:version_class) { Inspec::Resources::OSResource::Version }

    describe "#initialize" do
      it "handles standard version strings" do
        v = version_class.new("1.2.3")
        _(v.major).must_equal 1
        _(v.minor).must_equal 2
        _(v.patch).must_equal 3
        _(v.build).must_be_nil
      end

      it "handles version with build" do
        v = version_class.new("1.2.3.456")
        _(v.major).must_equal 1
        _(v.minor).must_equal 2
        _(v.patch).must_equal 3
        _(v.build).must_equal "456"
      end

      it "handles version with multiple build segments" do
        v = version_class.new("1.2.3.456.789")
        _(v.major).must_equal 1
        _(v.minor).must_equal 2
        _(v.patch).must_equal 3
        _(v.build).must_equal "456.789"
      end

      it "handles short version strings" do
        v = version_class.new("1.2")
        _(v.major).must_equal 1
        _(v.minor).must_equal 2
        _(v.patch).must_be_nil
        _(v.build).must_be_nil
      end

      it "handles empty version strings" do
        v = version_class.new("")
        _(v.major).must_be_nil
        _(v.minor).must_be_nil
        _(v.patch).must_be_nil
        _(v.build).must_be_nil
      end
    end

    describe "comparison operations" do
      it "compares equal versions" do
        v1 = version_class.new("1.2.3")
        v2 = version_class.new("1.2.3")
        assert_equal v1, v2
        assert v1 == v2
        assert v1 >= v2
        assert v1 <= v2
      end

      it "compares different versions" do
        v1 = version_class.new("1.2.3")
        v2 = version_class.new("1.2.4")
        refute_equal v1, v2
        assert v1 < v2
        assert v2 > v1
        assert v1 <= v2
        assert v2 >= v1
      end

      it "compares versions with different segments" do
        v1 = version_class.new("1.2")
        v2 = version_class.new("1.2.1")
        refute_equal v1, v2
        assert v1 < v2
        assert v2 > v1
      end

      it "compares versions with build numbers" do
        v1 = version_class.new("1.2.3.100")
        v2 = version_class.new("1.2.3.200")
        refute_equal v1, v2
        assert v1 < v2
        assert v2 > v1
      end

      it "handles comparison with string versions" do
        v = version_class.new("1.2.3")
        assert v == "1.2.3"
        assert v < "1.2.4"
        assert v > "1.2.2"
      end
    end
  end
end
