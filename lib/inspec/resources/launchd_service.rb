require "inspec/resources/service"

module Inspec::Resources
  class LaunchdService < Service
    name "launchd_service"
    supports platform: "unix"
    desc "Use the launchd_service InSpec audit resource to test if the named service (controlled by launchd) is installed, running and/or enabled."
    example <<~EXAMPLE
      # to override service mgmt auto-detection
      describe launchd_service('service_name') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end

      # to set a non-standard launchctl path
      describe launchd_service('service_name', '/path/to/launchctl') do
        it { should be_running }
      end
    EXAMPLE

    def select_service_mgmt
      LaunchCtl.new(inspec, service_ctl)
    end
  end

  # MacOS / Darwin
  # new launctl on macos 10.10
  class LaunchCtl < ServiceManager
    def initialize(service_name, service_ctl = nil)
      @service_ctl = service_ctl || "launchctl"
      super
    end

    def info(service_name)
      # get the status of upstart service
      cmd = inspec.command("#{service_ctl} list")
      return nil if cmd.exit_status != 0

      # search for the service
      srv = /(^.*#{service_name}.*)/.match(cmd.stdout)
      return nil if srv.nil? || srv[0].nil?

      # extract values from service
      parsed_srv = /^(?<pid>[0-9-]+)\t(?<exit>[0-9]+)\t(?<name>\S*)$/.match(srv[0])
      enabled = !parsed_srv["name"].nil? # it's in the list

      # check if the service is running
      pid = parsed_srv["pid"]
      running = pid != "-"

      # extract service label
      srv = parsed_srv["name"] || service_name

      {
        name: srv,
        description: nil,
        installed: true,
        running: running,
        enabled: enabled,
        type: "darwin",
      }
    end
  end
end
