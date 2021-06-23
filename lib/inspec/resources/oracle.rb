# copyright: 2015, Vulcano Security GmbH

require "inspec/resources/powershell"

module Inspec::Resources
  class Oracle < Inspec.resource(1)
    name "oracle"
    supports platform: "unix"
    supports platform: "windows"

    desc "The 'oracle' resource is a helper for the 'oracle_listener_conf'"

    attr_reader :conf_path

    def initialize
      case inspec.os[:family]
      when "debian", "redhat", "linux", "suse"
        determine_conf_dir_and_path_in_linux
      when "windows"
        determine_conf_dir_and_path_in_windows
      end
    end

    def to_s
      "OracleDB"
    end

    private

    def determine_conf_dir_and_path_in_linux
      conf_files = inspec.command("sudo find / -type f -wholename '*network/admin/listener.ora'").stdout.lines
      if conf_files.empty?
        warn "No oracle listener settings found in $ORACLE_HOME/network/admin"
        nil
      else
        first = conf_files.first.chomp
        warn "Multiple oracle listener settings found" if conf_files.count > 1
        @conf_path = first
      end
    rescue => e
      fail_resource "Errors reading listener settings: #{e}"
    end

    def determine_conf_dir_and_path_in_windows
      conf_files = inspec.command("Get-ChildItem C:\\ -Filter *listener.ora -Recurse | % { $_.FullName }").stdout.lines
      if conf_files.empty?
        warn "No oracle listener settings found in $ORACLE_HOME\\network\\admin"
        nil
      else
        first = conf_files.select { |line| line.include? "network\\admin\\listener.ora" }.first&.chomp
        warn "Multiple oracle listener settings found" if conf_files.count > 1
        @conf_path = first
      end
    rescue => e
      fail_resource "Errors reading listener settings: #{e}"
    end
  end
end
