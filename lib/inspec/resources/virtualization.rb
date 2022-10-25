require "hashie/mash"
require "inspec/resources/powershell"

module Inspec::Resources
  class Virtualization < Inspec.resource(1)
    name "virtualization"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the virtualization InSpec audit resource to test various virtualization platforms."
    example <<~EXAMPLE
      describe virtualization do
        its('system') { should eq 'docker' }
      end

      describe virtualization do
        its('role') { should eq 'guest' }
      end

      control 'test' do
        describe file('/var/tmp/foo') do
          it { should be_file }
        end
        only_if { virtualization.system == 'docker' }
      end
    EXAMPLE

    def initialize
      # TODO: no need for hashie here... in fact, no reason for a hash at all
      @virtualization_data = Hashie::Mash.new

      if inspec.os.linux?
        collect_data_linux
      elsif inspec.os.windows?
        collect_data_windows
      end

      # Allows checking for non-virtualized systems as well
      @virtualization_data[:physical] = @virtualization_data.empty?
    end

    # add helper methods for easy access of properties
    # allows users to use virtualization.role, virtualization.system
    %i{role system}.each do |property|
      define_method(property) do
        @virtualization_data[property]
      end
    end

    def virtual_system?
      @virtualization_data[:role] == "guest"
    end

    def physical_system?
      @virtualization_data[:physical]
    end

    def params
      # TODO: this is broken. cannot return anything but nil
      collect_data_linux
    end

    def resource_id
      @virtualization_data[:system] || "virtualization"
    end

    def to_s
      "Virtualization Detection"
    end

    private

    def lxc_version_exists?
      inspec.command("lxc-version").exist?
    end

    def docker_exists?
      inspec.command("docker").exist?
    end

    def nova_exists?
      inspec.command("nova").exist?
    end

    # Detect Xen
    # /proc/xen is an empty dir for EL6 + Linode Guests + Paravirt EC2 instances
    # Notes:
    # - cpuid of guests, if we could get it, would also be a clue
    # - may be able to determine if under paravirt from /dev/xen/evtchn (See OHAI-253)
    # - Additional edge cases likely should not change the above assumptions
    #   but rather be additive - btm
    def detect_xen
      # This file should exist on most Xen systems, normally empty for guests
      return false unless inspec.file("/proc/xen/capabilities").exist?

      @virtualization_data[:system] = "xen"
      if inspec.file("/proc/xen/capabilities").content =~ /control_d/i
        @virtualization_data[:role] = "host"
      else
        @virtualization_data[:role] = "guest"
      end

      true
    end

    # Detect Virtualbox from kernel module
    def detect_virtualbox
      return false unless inspec.file("/proc/modules").exist?

      modules = inspec.file("/proc/modules").content
      if modules =~ /^vboxdrv/
        Inspec::Log.debug("Plugin Virtualization: /proc/modules contains vboxdrv. Detecting as vbox host")
        @virtualization_data[:system] = "vbox"
        @virtualization_data[:role] = "host"
      elsif modules =~ /^vboxguest/
        Inspec::Log.debug("Plugin Virtualization: /proc/modules contains vboxguest. Detecting as vbox guest")
        @virtualization_data[:system] = "vbox"
        @virtualization_data[:role] = "guest"
      else
        return false
      end
      true
    end

    # if nova binary is present we're on an openstack host
    def detect_openstack
      return false unless nova_exists?

      @virtualization_data[:system] = "openstack"
      @virtualization_data[:role] = "host"
      true
    end

    # Detect paravirt KVM/QEMU from cpuinfo, report as KVM
    def detect_kvm_from_cpuinfo
      return false unless inspec.file("/proc/cpuinfo").content =~ /QEMU Virtual CPU|Common KVM processor|Common 32-bit KVM processor/

      @virtualization_data[:system] = "kvm"
      @virtualization_data[:role] = "guest"
      true
    end

    # Detect KVM systems via /sys
    # guests will have the hypervisor cpu feature that hosts don't have
    def detect_kvm_from_sys
      return false unless inspec.file("/sys/devices/virtual/misc/kvm").exist?

      @virtualization_data[:system] = "kvm"
      if inspec.file("/proc/cpuinfo").content =~ /hypervisor/
        @virtualization_data[:role] = "guest"
      else
        @virtualization_data[:role] = "host"
      end
      true
    end

    # Detect OpenVZ / Virtuozzo.
    # http://wiki.openvz.org/BC_proc_entries
    def detect_openvz
      if inspec.file("/proc/bc/0").exist?
        @virtualization_data[:system] = "openvz"
        @virtualization_data[:role] = "host"
      elsif inspec.file("/proc/vz").exist?
        @virtualization_data[:system] = "openvz"
        @virtualization_data[:role] = "guest"
      else
        return false
      end
      true
    end

    # Detect Parallels virtual machine from pci devices
    def detect_parallels
      return false unless inspec.file("/proc/bus/pci/devices").content =~ /1ab84000/

      @virtualization_data[:system] = "parallels"
      @virtualization_data[:role] = "guest"
      true
    end

    # Detect Linux-VServer
    def detect_linux_vserver
      return false unless inspec.file("/proc/self/status").exist?

      proc_self_status = inspec.file("/proc/self/status").content
      vxid = proc_self_status.match(/^(s_context|VxID):\s*(\d+)$/)
      return false unless vxid && vxid[2]

      @virtualization_data[:system] = "linux-vserver"
      if vxid[2] == "0"
        @virtualization_data[:role] = "host"
      else
        @virtualization_data[:role] = "guest"
      end
      true
    end

    # Detect LXC/Docker/k8s/podman
    #
    # /proc/self/cgroup will look like this inside a docker container:
    # <index #>:<subsystem>:/lxc/<hexadecimal container id>
    #
    # /proc/self/cgroup could have a name including alpha/digit/dashes
    # <index #>:<subsystem>:/lxc/<named container id>
    #
    # /proc/self/cgroup could have a non-lxc cgroup name indicating other uses
    # of cgroups.  This is probably not LXC/Docker.
    # <index #>:<subsystem>:/Charlie
    #
    # A host which supports cgroups, and has capacity to host lxc containers,
    # will show the subsystems and root (/) namespace.
    # <index #>:<subsystem>:/
    #
    # Full notes, https://tickets.opscode.com/browse/OHAI-551
    # Kernel docs, https://www.kernel.org/doc/Documentation/cgroups
    def detect_container
      return false unless inspec.file("/proc/self/cgroup").exist?

      cgroup_content = inspec.file("/proc/self/cgroup").content
      if cgroup_content =~ %r{^\d+:[^:]+:/(lxc|docker)/.+$} ||
          cgroup_content =~ %r{^\d+:[^:]+:/[^/]+/(lxc|docker)-.+$} # rubocop:disable Layout/MultilineOperationIndentation
        @virtualization_data[:system] = $1 # rubocop:disable Style/PerlBackrefs
        @virtualization_data[:role] = "guest"
      elsif cgroup_content =~ %r{^\d+:[^:]+:/(kubepods)/.+$}
        @virtualization_data[:system] = $1
        @virtualization_data[:role] = "guest"
      elsif /container=podman/.match?(file_read("/proc/1/environ"))
        @virtualization_data[:system] = "podman"
        @virtualization_data[:role] = "guest"
      elsif lxc_version_exists? && cgroup_content =~ %r{\d:[^:]+:/$}
        # lxc-version shouldn't be installed by default
        # Even so, it is likely we are on an LXC capable host that is not being used as such
        # So we're cautious here to not overwrite other existing values (OHAI-573)
        unless @virtualization_data[:system] && @virtualization_data[:role]
          @virtualization_data[:system] = "lxc"
          @virtualization_data[:role] = "host"
        end
      else
        return false
      end
      true
    end

    def detect_docker
      return false unless inspec.file("/.dockerenv").exist? || inspec.file("/.dockerinit").exist?

      @virtualization_data[:system] = "docker"
      @virtualization_data[:role] = "guest"
      # TODO: needs to support host
      true
    end

    # Detect LXD
    # See https://github.com/lxc/lxd/blob/master/doc/dev-lxd.md
    def detect_lxd
      if inspec.file("/dev/lxd/sock").exist?
        @virtualization_data[:system] = "lxd"
        @virtualization_data[:role] = "guest"
      elsif inspec.file("/var/lib/lxd/devlxd").exist?
        @virtualization_data[:system] = "lxd"
        @virtualization_data[:role] = "host"
      else
        return false
      end
      true
    end

    # Detect VMware
    def detect_vmware
      return false unless inspec.file("/sys/devices/virtual/dmi/id/product_name").exist?

      product_name = inspec.file("/sys/devices/virtual/dmi/id/product_name").content

      if product_name =~ /^VMware/
        @virtualization_data[:system] = "vmware"
        @virtualization_data[:role] = "guest"
      else
        return false
      end

      true
    end

    # Detect Hyper-V
    # @see https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
    def detect_hyperv
      return false unless inspec.file("/sys/devices/virtual/dmi/id/product_name").exist?

      product_name = inspec.file("/sys/devices/virtual/dmi/id/product_name").content

      if product_name.rstrip == "Virtual Machine"
        @virtualization_data[:system] = "hyper-v"
        @virtualization_data[:role] = "guest"
      else
        return false
      end

      true
    end

    def collect_data_linux
      # This avoids doing multiple detections in a single test
      return unless @virtualization_data.empty?

      # each detect method will return true if it matched and was successfully
      # able to populate @virtualization_data with stuff.
      return if detect_xen
      return if detect_docker
      return if detect_virtualbox
      return if detect_lxd
      return if detect_container
      return if detect_linux_vserver
      return if detect_kvm_from_cpuinfo
      return if detect_kvm_from_sys
      return if detect_openvz
      return if detect_openstack
      return if detect_parallels
      return if detect_vmware
      return if detect_hyperv
    end

    def windows_computer_system
      script = "Get-WmiObject -Class Win32_ComputerSystem -ErrorAction Stop | ConvertTo-Json"
      cmd = inspec.powershell(script)

      JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      nil
    end

    def collect_data_windows
      # This avoids doing multiple detections in a single test
      return unless @virtualization_data.empty?

      case windows_computer_system["Model"]
      when "Virtual Machine"
        @virtualization_data[:system] = "hyper-v"
      when /^VMware/
        @virtualization_data[:system] = "vmware"
      when "VirtualBox"
        @virtualization_data[:system] = "virtualbox"
      end

      case windows_computer_system[:manufacturer]
      when "Xen"
        @virtualization_data[:system] = "xen"
      when "QEMU"
        @virtualization_data[:system] = "kvm"
      end

      @virtualization_data[:role] = "guest" if @virtualization_data[:system]
    end
  end
end
