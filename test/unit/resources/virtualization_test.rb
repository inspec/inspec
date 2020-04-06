require "helper"
require "inspec/resource"
require "inspec/resources/file"
require "inspec/resources/virtualization"

describe "Inspec::Resources::Virtualization" do
  def mock_proc(mocked_files)
    proc do |filename|
      OpenStruct.new(
        exist?: mocked_files.include?(filename) ? false : true
      )
    end
  end

  it "returns nil for all properties if no virtualization platform is found" do
    mocked_files = [
      "/proc/xen/capabilities",
      "/proc/modules",
      "/proc/cpuinfo",
      "/sys/devices/virtual/misc/kvm",
      "/proc/bc/0",
      "/proc/vz",
      "/proc/bus/pci/devices",
      "/proc/self/status",
      "/proc/self/cgroup",
      "/.dockerenv",
      "/.dockerinit",
      "/dev/lxd/sock",
      "/var/lib/lxd/devlxd",
    ]

    mock_loader = MockLoader.new(:ubuntu)
    mock_loader.backend.stub :file, mock_proc(mocked_files) do
      mock_resource = mock_loader.load_resource("virtualization")
      _(mock_resource.system).must_be_nil
      _(mock_resource.role).must_be_nil
    end
  end
end
