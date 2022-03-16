require "inspec/resources/command"
module Inspec::Resources
  class Cgroup < Inspec.resource(1)
    name "cgroup"
    # Restrict to only run on the below platform
    supports platform: "linux"
    desc "Use the cgroup InSpec audit resource to test cgroup subsytem's parameters."

    example <<~EXAMPLE
      describe cgroup("foo") do
        its("cpuset.cpus") { should eq 0 }
        its("memory.limit_in_bytes") { should eq 499712 }
      end
      describe cgroup("bar") do
        its("cpuset.cpus") { should eq 1 }
        its("memory.limit_in_bytes") { should be <= 500000 }
      end
    EXAMPLE

    # Obnoxious list obtained using `cgget -a lxc.pivot | grep ':' | cut -f1 -d: | sort | grep -v lxc.pivot`
    VALID_QUERIES = %w{
blkio.throttle.io_service_bytes
blkio.throttle.io_service_bytes_recursive
blkio.throttle.io_serviced
blkio.throttle.io_serviced_recursive
blkio.throttle.read_bps_device
blkio.throttle.read_iops_device
blkio.throttle.write_bps_device
blkio.throttle.write_iops_device
cpu.cfs_period_us
cpu.cfs_quota_us
cpu.shares
cpu.stat
cpu.uclamp.max
cpu.uclamp.min
cpuacct.stat
cpuacct.usage
cpuacct.usage_all
cpuacct.usage_percpu
cpuacct.usage_percpu_sys
cpuacct.usage_percpu_user
cpuacct.usage_sys
cpuacct.usage_user
cpuset.cpu_exclusive
cpuset.cpus
cpuset.effective_cpus
cpuset.effective_mems
cpuset.mem_exclusive
cpuset.mem_hardwall
cpuset.memory_migrate
cpuset.memory_pressure
cpuset.memory_spread_page
cpuset.memory_spread_slab
cpuset.mems
cpuset.sched_load_balance
cpuset.sched_relax_domain_level
devices.list
freezer.parent_freezing
freezer.self_freezing
freezer.state
hugetlb.2MB.failcnt
hugetlb.2MB.limit_in_bytes
hugetlb.2MB.max_usage_in_bytes
hugetlb.2MB.rsvd.failcnt
hugetlb.2MB.rsvd.limit_in_bytes
hugetlb.2MB.rsvd.max_usage_in_bytes
hugetlb.2MB.rsvd.usage_in_bytes
hugetlb.2MB.usage_in_bytes
memory.failcnt
memory.kmem.failcnt
memory.kmem.limit_in_bytes
memory.kmem.max_usage_in_bytes
memory.kmem.slabinfo
memory.kmem.tcp.failcnt
memory.kmem.tcp.limit_in_bytes
memory.kmem.tcp.max_usage_in_bytes
memory.kmem.tcp.usage_in_bytes
memory.kmem.usage_in_bytes
memory.limit_in_bytes
memory.max_usage_in_bytes
memory.memsw.failcnt
memory.memsw.limit_in_bytes
memory.memsw.max_usage_in_bytes
memory.memsw.usage_in_bytes
memory.move_charge_at_immigrate
memory.numa_stat
memory.oom_control
memory.soft_limit_in_bytes
memory.stat
memory.swappiness
memory.usage_in_bytes
memory.use_hierarchy
net_cls.classid
net_prio.ifpriomap
net_prio.prioidx
pids.current
pids.events
pids.max
rdma.current
rdma.max
    }

    # Resource initialization.
    def initialize(cgroup_name)
      @cgroup_name = cgroup_name

      # Used to track the method calls in an "its" query
      @cgroup_info_query = []

      return if inspec.os.linux?

      @unsupported_os = true
      skip_resource "The `cgroup` resource is not supported on your OS yet."
    end

    def resource_id
      @cgroup_name
    end

    def to_s
      "cgroup #{resource_id}"
    end

    def method_missing(param)
      return skip_resource "The `cgroup` resource is not supported on your OS yet." if @unsupported_os

      # Add the latest thing we've seen to the list.
      @cgroup_info_query << param.to_s
      query = @cgroup_info_query.join(".")

      if VALID_QUERIES.include?(query)
        @cgroup_info_query = []
        find_cgroup_info(query)
      elsif @cgroup_info_query.length > 3
        # Presumably an error.
        raise Inspec::Exceptions::ResourceFailed, "The query #{query} does not appear to be valid."
      else
        # Else return self for chaining. There are other error conditions here, though!
        self
      end
    end

    private

    # Method to find cgget
    def find_cgget_or_error
      %w{/usr/sbin/cgget /sbin/cgget cgget}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `cgget`"
    end

    def find_cgroup_info(query)
      bin = find_cgget_or_error
      cgget_cmd = "#{bin} -n -r #{query} #{@cgroup_name}"
      cmd = inspec.command(cgget_cmd)
      raise Inspec::Exceptions::ResourceFailed, "Executing cgget failed: #{cmd.stderr}" if cmd.exit_status.to_i != 0

      # TODO: some queries have complex returns, like cpu.stat
      # This assumes we are splitting on whitespace and taking the second value.
      param_value = cmd.stdout.split(/\s/)[1]&.strip
      return nil if param_value.nil? || param_value.empty?

      param_value.match(/^\d+$/) ? param_value.to_i : param_value
    end
  end
end
