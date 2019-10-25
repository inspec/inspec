require "inspec/resources/service"

module Inspec::Resources
  class BSDService < Service
    name "bsd_service"
    supports platform: "unix"
    desc "Use the bsd_service InSpec audit resource to test if the named service (controlled by BSD init) is installed, running and/or enabled."
    example <<~EXAMPLE
      # to override service mgmt auto-detection
      describe bsd_service('service_name') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end

      # to set a non-standard service path
      describe bsd_service('service_name', '/path/to/service') do
        it { should be_running }
      end
    EXAMPLE

    def select_service_mgmt
      BSDInit.new(inspec, service_ctl)
    end
  end
  # @see: https://www.freebsd.org/doc/en/articles/linux-users/startup.html
  # @see: https://www.freebsd.org/cgi/man.cgi?query=rc.conf&sektion=5
  class BSDInit < ServiceManager
    def initialize(service_name, service_ctl = nil)
      @service_ctl = service_ctl || "service"
      super
    end

    def info(service_name)
      # check if service is enabled
      # services are enabled in /etc/rc.conf and /etc/defaults/rc.conf
      # via #{service_name}_enable="YES"
      # service SERVICE status returns the following result if not activated:
      #   Cannot 'status' sshd. Set sshd_enable to YES in /etc/rc.conf or use 'onestatus' instead of 'status'.
      # gather all enabled services
      cmd = inspec.command("#{service_ctl} -e")
      return nil if cmd.exit_status != 0

      # search for the service
      srv = /(^.*#{service_name}$)/.match(cmd.stdout)
      return nil if srv.nil? || srv[0].nil?

      enabled = true

      # check if the service is running
      # if the service is not available or not running, we always get an error code
      cmd = inspec.command("#{service_ctl} #{service_name} onestatus")
      running = cmd.exit_status == 0

      {
        name: service_name,
        description: nil,
        installed: true,
        running: running,
        enabled: enabled,
        type: "bsd-init",
      }
    end
  end
end
