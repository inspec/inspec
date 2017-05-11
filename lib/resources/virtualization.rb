require 'hashie/mash'

module Inspec::Resources
  class Virtualization < Inspec.resource(1)
    name 'virtualization'
    desc 'Use the virtualization InSpec audit resource to test the virtualization platform on which the system is running'
    example "
      describe virtualization[:system] do
        it { should eq 'docker' }
      end

      describe virtualization[:role] do
        it { should eq 'guest' }
      end

      describe virtualization[:systems][:docker] do
        it { should eq 'guest' }
      end
    "

    def initialize()
      unless inspec.os.linux?
        skip_resource 'The `virtualization` resource is not supported on your OS yet.'
      end
    end

    def [](name)
      # convert string to symbol
      name = name.to_sym if name.is_a? String
      data = self.params
      data[name]
    end

    def params
      collect_data_linux
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

    def collect_data_linux
      virtualization = Hashie::Mash.new unless virtualization
      virtualization[:systems] = Hashie::Mash.new unless virtualization[:systems]

      ## Xen
      # /proc/xen is an empty dir for EL6 + Linode Guests + Paravirt EC2 instances
      if inspec.file("/proc/xen").exist?
        virtualization[:system] = "xen"
        # Assume guest
        virtualization[:role] = "guest"
        virtualization[:systems][:xen] = "guest"

        # This file should exist on most Xen systems, normally empty for guests
        if inspec.file("/proc/xen/capabilities").exist?
          if File.read("/proc/xen/capabilities") =~ /control_d/i
            virtualization[:role] = "host"
            virtualization[:systems][:xen] = "host"
          end
        end
      end

      # Xen Notes:
      # - cpuid of guests, if we could get it, would also be a clue
      # - may be able to determine if under paravirt from /dev/xen/evtchn (See OHAI-253)
      # - Additional edge cases likely should not change the above assumptions
      #   but rather be additive - btm

      # Detect Virtualbox from kernel module
      file = inspec.file("/proc/modules")
      if file.exist?
        modules = file.content
        if modules =~ /^vboxdrv/
          Inspec::Log.debug("Plugin Virtualization: /proc/modules contains vboxdrv. Detecting as vbox host")
          virtualization[:system] = "vbox"
          virtualization[:role] = "host"
          virtualization[:systems][:vbox] = "host"
        elsif modules =~ /^vboxguest/
          Inspec::Log.debug("Plugin Virtualization: /proc/modules contains vboxguest. Detecting as vbox guest")
          virtualization[:system] = "vbox"
          virtualization[:role] = "guest"
          virtualization[:systems][:vbox] = "guest"
        end
      end

      # if nova binary is present we're on an openstack host
      if nova_exists?
        virtualization[:system] = "openstack"
        virtualization[:role] = "host"
        virtualization[:systems][:openstack] = "host"
      end

      # Detect paravirt KVM/QEMU from cpuinfo, report as KVM
      file = inspec.file("/proc/cpuinfo")
      if file.exist?
        if file.content =~ /QEMU Virtual CPU|Common KVM processor|Common 32-bit KVM processor/
          virtualization[:system] = "kvm"
          virtualization[:role] = "guest"
          virtualization[:systems][:kvm] = "guest"
        end
      end

      # Detect KVM systems via /sys
      # guests will have the hypervisor cpu feature that hosts don't have
      if inspec.file("/sys/devices/virtual/misc/kvm").exist?
        virtualization[:system] = "kvm"
        file = inspec.file("/proc/cpuinfo")
        if file.content =~ /hypervisor/
          virtualization[:role] = "guest"
          virtualization[:systems][:kvm] = "guest"
        else
          virtualization[:role] = "host"
          virtualization[:systems][:kvm] = "host"
        end
      end

      # Detect OpenVZ / Virtuozzo.
      # http://wiki.openvz.org/BC_proc_entries
      if inspec.file("/proc/bc/0").exist?
        virtualization[:system] = "openvz"
        virtualization[:role] = "host"
        virtualization[:systems][:openvz] = "host"
      elsif inspec.file("/proc/vz").exist?
        virtualization[:system] = "openvz"
        virtualization[:role] = "guest"
        virtualization[:systems][:openvz] = "guest"
      end

      # Detect Parallels virtual machine from pci devices
      file = inspec.file("/proc/bus/pci/devices")
      if file.exist?
        if file.content =~ /1ab84000/
          virtualization[:system] = "parallels"
          virtualization[:role] = "guest"
          virtualization[:systems][:parallels] = "guest"
        end
      end

      # Detect Linux-VServer
      file = inspec.file("/proc/self/status")
      if file.exist?
        proc_self_status = file.content
        vxid = proc_self_status.match(/^(s_context|VxID):\s*(\d+)$/)
        if vxid && vxid[2]
          virtualization[:system] = "linux-vserver"
          if vxid[2] == "0"
            virtualization[:role] = "host"
            virtualization[:systems]["linux-vserver"] = "host"
          else
            virtualization[:role] = "guest"
            virtualization[:systems]["linux-vserver"] = "guest"
          end
        end
      end

      # Detect LXC/Docker
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
      file = inspec.file("/proc/self/cgroup")
      if file.exist?
        cgroup_content = file.content
        if cgroup_content =~ %r{^\d+:[^:]+:/(lxc|docker)/.+$} ||
            cgroup_content =~ %r{^\d+:[^:]+:/[^/]+/(lxc|docker)-.+$}
          virtualization[:system] = $1
          virtualization[:role] = "guest"
          virtualization[:systems][$1.to_sym] = "guest"
        elsif lxc_version_exists? && cgroup_content =~ %r{\d:[^:]+:/$}
          # lxc-version shouldn't be installed by default
          # Even so, it is likely we are on an LXC capable host that is not being used as such
          # So we're cautious here to not overwrite other existing values (OHAI-573)
          unless virtualization[:system] && virtualization[:role]
            virtualization[:system] = "lxc"
            virtualization[:role] = "host"
          end
          # In general, the 'systems' framework from OHAI-182 is less susceptible to conflicts
          # But, this could overwrite virtualization[:systems][:lxc] = "guest"
          # If so, we may need to look further for a differentiator (OHAI-573)
          virtualization[:systems][:lxc] = "host"
        end
      elsif inspec.file("/.dockerenv").exist? || inspec.file("/.dockerinit").exist?
        virtualization[:system] = "docker"
        virtualization[:role] = "guest"
        virtualization[:systems][:docker] = "guest"
      end

      # Detect LXD
      # See https://github.com/lxc/lxd/blob/master/doc/dev-lxd.md
      if inspec.file("/dev/lxd/sock").exist?
        virtualization[:system] = "lxd"
        virtualization[:role] = "guest"
      elsif inspec.file("/var/lib/lxd/devlxd").exist?
        virtualization[:system] = "lxd"
        virtualization[:role] = "host"
      end

      virtualization
    end

    def to_s
      'Virtualization Detection'
    end
  end
end
