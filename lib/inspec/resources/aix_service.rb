require "inspec/resources/service"

module Inspec::Resources
  # AIX services
  class SrcMstr < ServiceManager
    attr_reader :name

    def info(service_name)
      @name = service_name
      running = status?
      return nil if running.nil?

      {
        name: service_name,
        description: nil,
        installed: true,
        running: running,
        enabled: enabled?,
        type: "srcmstr",
      }
    end

    private

    def status?
      status_cmd = inspec.command("lssrc -s #{@name}")
      return nil if status_cmd.exit_status.to_i != 0

      status_cmd.stdout.split(/\n/).last.chomp =~ /active$/ ? true : false
    end

    def enabled?
      enabled_rc_tcpip? || enabled_inittab?
    end

    def enabled_rc_tcpip?
      inspec.command(
        "grep -v ^# /etc/rc.tcpip | grep 'start ' | grep -Eq '(/{0,1}| )#{name} '"
      ).exit_status == 0
    end

    def enabled_inittab?
      inspec.command("lsitab #{name}").exit_status == 0
    end
  end
end
