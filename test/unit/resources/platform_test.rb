require "helper"
require "inspec/resource"
require "inspec/resources/platform"

describe "Inspec::Resources::Platform" do
  let(:resource) { MockLoader.new(:ubuntu1504).load_resource("platform") }

  it "verify platform parsing on Ubuntu" do
    _(resource.name).must_equal "ubuntu"
    _(resource.family).must_equal "debian"
    _(resource.release).must_equal "15.04"
    _(resource.arch).must_equal "x86_64"
  end

  it "verify platform hash parsing on Ubuntu" do
    _(resource[:name]).must_equal "ubuntu"
    _(resource[:family]).must_equal "debian"
    _(resource[:release]).must_equal "15.04"
    _(resource[:arch]).must_equal "x86_64"
  end

  it "verify platform families" do
    expect = %w{debian linux unix os}
    _(resource.families).must_equal expect
  end

  it "verify platform? responds correctly" do
    _(resource.platform?("windows")).must_equal false
    _(resource.platform?("unix")).must_equal true
    _(resource.platform?("ubuntu")).must_equal true
    _(resource.platform?("mac_os_x")).must_equal false
  end

  it "verify family? responds correctly" do
    _(resource.in_family?("windows")).must_equal false
    _(resource.in_family?("unix")).must_equal true
    _(resource.in_family?("ubuntu")).must_equal false
    _(resource.in_family?("mac_os_x")).must_equal false
  end

  it "accept an empty supports collection" do
    supports = []
    _(resource).must_be :supported?, supports
  end

  it "verify supported? with multiple families" do
    supports = [
      { os_family: "windows" },
      { os_family: "unix" },
    ]
    _(resource).must_be :supported?, supports
  end

  it "loads a profile which supports multiple names" do
    supports = [
      { 'os-family': "windows", 'os-name': "windows_2000" },
      { 'os-family': "unix", 'os-name': "ubuntu" },
    ]
    _(resource).must_be :supported?, supports
  end

  it "reject a profile which supports multiple families" do
    supports = [
      { os_family: "windows" },
      { os_family: "redhat" },
    ]
    _(resource).wont_be :supported?, supports
  end

  it "loads a profile which supports release 15.04" do
    supports = [
      { 'os-family': "windows", 'os-name': "windows_2000" },
      { 'os-name': "ubuntu", 'release': "15.04" },
    ]
    _(resource).must_be :supported?, supports
  end

  it "loads a profile which supports release 15.*" do
    supports = [
      { 'os-family': "windows", 'os-name': "windows_2000" },
      { 'os-name': "ubuntu", 'release': "15.*" },
    ]
    _(resource).must_be :supported?, supports
  end

  it "loads a profile which supports release *.04" do
    supports = [
      { 'os-family': "windows", 'os-name': "windows_2000" },
      { 'os-name': "ubuntu", 'release': "*.04" },
    ]
    _(resource).must_be :supported?, supports
  end

  it "reject a profile which supports release 12.*" do
    supports = [
      { 'os-family': "windows", 'os-name': "windows_2000" },
      { 'os-name': "ubuntu", 'release': "12.*" },
    ]
    _(resource).wont_be :supported?, supports
  end

  let(:resource2) { MockLoader.new(:windows2016).load_resource("platform") }
  it "loads a profile which supports platform-name windows_server_2016*" do
    supports = [
      { 'platform-name': "windows_server_2016*" },
    ]
    _(resource2).must_be :supported?, supports
  end

  it "loads a profile which supports platform-name windows_server_2016*" do
    supports = [
      { 'platform-name': "*2016*" },
    ]
    _(resource2).must_be :supported?, supports
  end

  it "reject a profile which supports platform-name not matching regex windows_server_2016*" do
    supports = [
      { 'platform-name': "*2019*" },
    ]
    _(resource2).wont_be :supported?, supports
  end

end
