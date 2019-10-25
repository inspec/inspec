require "inspec/resources/service"

module Inspec::Resources
  class UpstartService < Service
    name "upstart_service"
    supports platform: "unix"
    desc "Use the upstart_service InSpec audit resource to test if the named service (controlled by upstart) is installed, running and/or enabled."
    example <<~EXAMPLE
      # to override service mgmt auto-detection
      describe upstart_service('service_name') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end

      # to set a non-standard initctl path
      describe upstart_service('service_name', '/path/to/initctl') do
        it { should be_running }
      end
    EXAMPLE

    def select_service_mgmt
      Upstart.new(inspec, service_ctl)
    end
  end

  # @see: http://upstart.ubuntu.com
  class Upstart < ServiceManager
    include FileReader

    def initialize(service_name, service_ctl = nil)
      @service_ctl = service_ctl || "initctl"
      super
    end

    def info(service_name)
      # get the status of upstart service
      status = inspec.command("#{service_ctl} status #{service_name}")

      # fallback for systemv services, those are not handled via `initctl`
      return SysV.new(inspec).info(service_name) if status.exit_status.to_i != 0 || status.stdout == ""

      # @see: http://upstart.ubuntu.com/cookbook/#job-states
      # grep for running to indicate the service is there
      running = !status.stdout[%r{start/running}].nil?
      enabled = info_enabled(service_name)

      {
        name: service_name,
        description: nil,
        installed: true,
        running: running,
        enabled: enabled,
        type: "upstart",
      }
    end

    private

    def info_enabled(service_name)
      # check if a service is enabled
      config = read_file_content("/etc/init/#{service_name}.conf", allow_empty: true)

      !config.match(/^\s*start on/).nil?
    end

    def version
      @version ||= begin
        out = inspec.command("#{service_ctl} --version").stdout
        Gem::Version.new(out[/\(upstart ([^\)]+)\)/, 1])
      end
    end
  end
end
