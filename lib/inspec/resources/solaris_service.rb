require "inspec/resources/service"

module Inspec::Resources
  # Solaris services
  class Svcs < ServiceManager
    def initialize(service_name, service_ctl = nil)
      @service_ctl = service_ctl || "svcs"
      super
    end

    def info(service_name)
      # get the status of runit service
      cmd = inspec.command("#{service_ctl} -l #{service_name}")
      return nil if cmd.exit_status != 0

      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^(\w+)\s*(.*)$/,
        multiple_values: false
      ).params

      installed = cmd.exit_status == 0
      running = installed && (params["state"] == "online")
      enabled = installed && (params["enabled"] == "true")

      {
        name: service_name,
        description: params["name"],
        installed: installed,
        running: running,
        enabled: enabled,
        type: "svcs",
      }
    end
  end
end
