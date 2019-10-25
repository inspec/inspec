require "inspec/resources/service"

# @see: http://www.freedesktop.org/software/systemd/man/systemctl.html
# @see: http://www.freedesktop.org/software/systemd/man/systemd-system.conf.html
module Inspec::Resources
  class SystemdService < Service
    name "systemd_service"
    supports platform: "unix"
    desc "Use the systemd_service InSpec audit resource to test if the named service (controlled by systemd) is installed, running and/or enabled."
    example <<~EXAMPLE
      # to override service mgmt auto-detection
      describe systemd_service('service_name') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end

      # to set a non-standard systemctl path
      describe systemd_service('service_name', '/path/to/systemctl') do
        it { should be_running }
      end
    EXAMPLE

    def select_service_mgmt
      Systemd.new(inspec, service_ctl)
    end
  end

  class Systemd < ServiceManager
    def initialize(inspec, service_ctl = nil)
      @service_ctl = service_ctl || "systemctl"
      super
    end

    def is_enabled?(service_name)
      result = inspec.command("#{service_ctl} is-enabled #{service_name} --quiet")
      return true if result.exit_status == 0

      # Some systems may not have a `.service` file for a particular service
      # which causes the `systemctl is-enabled` check to fail despite the
      # service being enabled. In that event we fallback to `sysv_service`.
      if result.stderr =~ /Failed to get.*No such file or directory/
        return inspec.sysv_service(service_name).enabled?
      end

      false
    end

    def is_active?(service_name)
      inspec.command("#{service_ctl} is-active #{service_name} --quiet").exit_status == 0
    end

    def info(service_name)
      cmd = inspec.command("#{service_ctl} show --no-pager --all #{service_name}")
      return nil if cmd.exit_status.to_i != 0

      # parse data
      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
        multiple_values: false
      ).params

      # LoadState values eg. loaded, not-found
      installed = params["LoadState"] == "loaded"

      {
        name: params["Id"],
        description: params["Description"],
        installed: installed,
        running: is_active?(service_name),
        enabled: is_enabled?(service_name),
        type: "systemd",
        params: params,
      }
    end
  end
end
