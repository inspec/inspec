module Inspec::Resources
  class Mongodb < Inspec.resource(1)
    name "mongodb"
    supports platform: "unix"
    supports platform: "windows"

    desc "The 'mongodb' resource is a helper for the 'mongodb_conf' & 'mongodb_session' resources.  Please use those instead."

    attr_reader :conf_path

    def initialize
      case inspec.os[:family]
      when "debian", "fedora", "redhat", "linux", "suse"
        init_linux
      when "darwin"
        init_macos
      when "windows"
        init_windows
      end
    end

    def to_s
      "MongoDB"
    end

    private

    def init_linux
      @conf_path = "/etc/mongod.conf"
    end

    def init_macos
      @conf_path = "/usr/local/etc/mongod.conf"
    end

    def init_windows
      dir = "C:\\Program Files\\MongoDB\\Server"
      @version = version_from_dir(dir)
      unless @version.to_s.empty?
        @conf_path = "#{dir}\\#{@version}\\bin\\mongod.cfg"
      end
    end

    def version_from_dir(dir)
      dirs = inspec.command("Get-ChildItem -Path \"#{dir}\" -Name").stdout
      entries = dirs.lines.count
      case entries
      when 0
        warn "Could not determine version of installed MongoDB by inspecting #{dir}"
        nil
      when 1
        warn "Using #{dirs}: #{dir_to_version(dirs)}"
        dir_to_version(dirs)
      else
        warn "Multiple versions of MongoDB installed or incorrect base dir #{dir}"
        first = dir_to_version(dirs.lines.first)
        warn "Using the first version found: #{first}"
        first
      end
    end

    def dir_to_version(dir)
      dir.chomp.split("/").last
    end
  end
end
