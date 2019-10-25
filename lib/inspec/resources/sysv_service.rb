require "inspec/resources/service"

module Inspec::Resources
  class SysVService < Service
    name "sysv_service"
    supports platform: "unix"
    desc "Use the sysv_service InSpec audit resource to test if the named service (controlled by SysV) is installed, running and/or enabled."
    example <<~EXAMPLE
      # to override service mgmt auto-detection
      describe sysv_service('service_name') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end

      # to set a non-standard service path
      describe sysv_service('service_name', '/path/to/service') do
        it { should be_running }
      end
    EXAMPLE

    def select_service_mgmt
      SysV.new(inspec, service_ctl)
    end
  end

  class SysV < ServiceManager
    RUNLEVELS = { 0 => false, 1 => false, 2 => false, 3 => false, 4 => false, 5 => false, 6 => false }.freeze

    def initialize(service_name, service_ctl = nil)
      @service_ctl = service_ctl || "service"
      super
    end

    def info(service_name)
      # check if service is installed
      # read all available services via ls /etc/init.d/
      srvlist = inspec.command("ls -1 /etc/init.d/")
      return nil if srvlist.exit_status != 0

      # check if the service is in list
      service = srvlist.stdout.split("\n").select { |srv| srv == service_name }

      # abort if we could not find any service
      return nil if service.empty?

      # read all enabled services from runlevel
      # on rhel via: 'chkconfig --list', is not installed by default
      # bash: for i in `find /etc/rc*.d -name S*`; do basename $i | sed -r 's/^S[0-9]+//'; done | sort | uniq
      enabled_services_cmd = inspec.command('find /etc/rc*.d /etc/init.d/rc*.d -name "S*"').stdout
      service_line = %r{rc(?<runlevel>[0-6])\.d/S[^/]*?#{Regexp.escape service_name}$}
      all_services = enabled_services_cmd.split("\n").map do |line|
        service_line.match(line)
      end.compact
      enabled = !all_services.empty?

      # Determine a list of runlevels which this service is activated for
      runlevels = RUNLEVELS.dup
      all_services.each { |x| runlevels[x[:runlevel].to_i] = true }

      # check if service is really running
      # service throws an exit code if the service is not installed or
      # not enabled

      cmd = inspec.command("#{service_ctl} #{service_name} status")
      running = cmd.exit_status == 0
      {
        name: service_name,
        description: nil,
        installed: true,
        running: running,
        enabled: enabled,
        runlevels: runlevels,
        type: "sysv",
      }
    end
  end
end
