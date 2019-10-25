require "inspec/resources/service"

module Inspec::Resources
  class RunitService < Service
    name "runit_service"
    supports platform: "unix"
    desc "Use the runit_service InSpec audit resource to test if the named service (controlled by runit) is installed, running and/or enabled."
    example <<~EXAMPLE
      # to override service mgmt auto-detection
      describe runit_service('service_name') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end

      # to set a non-standard sv path
      describe runit_service('service_name', '/path/to/sv') do
        it { should be_running }
      end
    EXAMPLE

    def select_service_mgmt
      Runit.new(inspec, service_ctl)
    end
  end

  class Runit < ServiceManager
    def initialize(service_name, service_ctl = nil)
      @service_ctl = service_ctl || "sv"
      super
    end

    # rubocop:disable Style/DoubleNegation
    def info(service_name)
      # get the status of runit service
      cmd = inspec.command("#{service_ctl} status #{service_name}")
      # return nil unless cmd.exit_status == 0 # NOTE(sr) why do we do this?

      installed = cmd.exit_status == 0
      running = installed && !!(cmd.stdout =~ /^run:/)
      enabled = installed && (running || !!(cmd.stdout =~ /normally up/) || !!(cmd.stdout =~ /want up/))

      {
        name: service_name,
        description: nil,
        installed: installed,
        running: running,
        enabled: enabled,
        type: "runit",
      }
    end
  end
end
