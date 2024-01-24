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
      _(mock_resource.resource_id).must_equal "virtualization"
      _(mock_resource.system).must_be_nil
      _(mock_resource.role).must_be_nil
    end
  end

  describe "detect_container" do
    def mock_file_methods(mocked_files)
      proc do |filename|
        OpenStruct.new(
          exist?: mocked_files.keys.include?(filename) ? true : false,
          content: mocked_files.keys.include?(filename) ? mocked_files[filename] : nil
        )
      end
    end

    let(:mocked_files) {
      {
        "/proc/self/cgroup" => "",
        "/proc/1/environ" => "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binTERM=xtermcontainer=podmanHOSTNAME=8a97c663f060HOME=/root",
      }
    }

    let(:mock_loader) { MockLoader.new(:ubuntu) }
    let(:backend) { mock_loader.backend }

    it "returns podman if /proc/1/environ file has container=podman entry" do
      backend.stub :file, mock_file_methods(mocked_files) do
        resource = mock_loader.load_resource("virtualization")
        _(resource.system).must_equal "podman"
        _(resource.role).must_equal "guest"
      end
    end
  end
end
