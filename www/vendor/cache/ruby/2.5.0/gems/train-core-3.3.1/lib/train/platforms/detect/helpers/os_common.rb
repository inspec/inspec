require_relative "os_linux"
require_relative "os_windows"
require "rbconfig"

module Train::Platforms::Detect::Helpers
  module OSCommon
    include Train::Platforms::Detect::Helpers::Linux
    include Train::Platforms::Detect::Helpers::Windows

    def ruby_host_os(regex)
      ::RbConfig::CONFIG["host_os"] =~ regex
    end

    def winrm?
      backend_name == "TrainPlugins::WinRM::Connection"
    end

    def backend_name
      @backend.class.name
    end

    def unix_file_contents(path)
      # keep a log of files incase multiple checks call the same one
      return @files[path] if @files.key?(path)

      res = @backend.run_command("test -f #{path} && cat #{path}")
      # ignore files that can't be read
      @files[path] = res.exit_status == 0 ? res.stdout : nil
      @files[path]
    end

    def unix_file_exist?(path)
      @backend.run_command("test -f #{path}").exit_status == 0
    end

    def command_output(cmd)
      res = @backend.run_command(cmd).stdout
      # When you try to execute command using ssh connction as root user and you have provided ssh user identity file
      # it gives standard output to login as authorised user other than root. To show this standard ouput as an error
      # to user we are matching the string of stdout and raising the error here so that user gets exact information.
      if @backend.class.to_s == "Train::Transports::SSH::Connection" && res =~ /Please login as the user/
        raise Train::UserError, "SSH failed: #{res}"
      end

      res.strip! unless res.nil?
      res
    end

    def unix_uname_s
      return @uname[:s] if @uname.key?(:s)

      @uname[:s] = command_output("uname -s")
    end

    def unix_uname_r
      return @uname[:r] if @uname.key?(:r)

      @uname[:r] = command_output("uname -r")
    end

    def unix_uname_m
      return @uname[:m] if @uname.key?(:m)

      @uname[:m] = command_output("uname -m")
    end

    def brocade_version
      return @cache[:brocade] if @cache.key?(:brocade)

      res = command_output("version")

      m = res.match(/^Fabric OS:\s+v(\S+)$/)

      @cache[:brocade] = m && { version: m[1], type: "fos" }
    end

    def cisco_show_version
      return @cache[:cisco] if @cache.key?(:cisco)

      res = command_output("show version")

      m = res.match(/Cisco IOS Software, [^,]+? \(([^,]+?)\), Version (\d+\.\d+)/)
      unless m.nil?
        return @cache[:cisco] = { version: m[2], model: m[1], type: "ios" }
      end

      m = res.match(/Cisco IOS Software, IOS-XE Software, [^,]+? \(([^,]+?)\), Version (\d+\.\d+\.\d+[A-Z]*)/)
      unless m.nil?
        return @cache[:cisco] = { version: m[2], model: m[1], type: "ios-xe" }
      end

      m = res.match(/Cisco Nexus Operating System \(NX-OS\) Software/)
      unless m.nil?
        v = res[/^\s*system:\s+version (\d+\.\d+)/, 1]
        return @cache[:cisco] = { version: v, type: "nexus" }
      end

      @cache[:cisco] = nil
    end

    def unix_uuid
      (unix_uuid_from_chef         ||
       unix_uuid_from_machine_file ||
       uuid_from_command           ||
       raise(Train::TransportError, "Cannot find a UUID for your node."))
    end

    def unix_uuid_from_chef
      file = @backend.file("/var/chef/cache/data_collector_metadata.json")
      if file.exist? && file.size != 0
        json = ::JSON.parse(file.content)
        return json["node_uuid"] if json["node_uuid"]
      end
    end

    def unix_uuid_from_machine_file
      # require 'pry';binding.pry
      %W{
        /etc/chef/chef_guid
        #{ENV["HOME"]}/.chef/chef_guid
        /etc/machine-id
        /var/lib/dbus/machine-id
        /var/db/dbus/machine-id
      }.each do |path|
        file = @backend.file(path)
        next unless file.exist? && file.size != 0
        return file.content.chomp if path =~ /guid/

        return uuid_from_string(file.content.chomp)
      end
      nil
    end

    # This takes a command from the platform detect block to run.
    # We expect the command to return a unique identifier which
    # we turn into a UUID.
    def uuid_from_command
      return unless @platform[:uuid_command]

      result = @backend.run_command(@platform[:uuid_command])
      uuid_from_string(result.stdout.chomp) if result.exit_status == 0 && !result.stdout.empty?
    end

    # This hashes the passed string into SHA1.
    # Then it downgrades the 160bit SHA1 to a 128bit
    # then we format it as a valid UUIDv5.
    def uuid_from_string(string)
      hash = Digest::SHA1.new
      hash.update(string)
      ary = hash.digest.unpack("NnnnnN")
      ary[2] = (ary[2] & 0x0FFF) | (5 << 12)
      ary[3] = (ary[3] & 0x3FFF) | 0x8000
      # rubocop:disable Style/FormatString
      "%08x-%04x-%04x-%04x-%04x%08x" % ary
    end

    def json_cmd(cmd)
      cmd = @backend.run_command(cmd)
      if cmd.exit_status == 0 && !cmd.stdout.empty?
        require "json"
        eos_ver = JSON.parse(cmd.stdout)
        @platform[:release] = eos_ver["version"]
        @platform[:arch] = eos_ver["architecture"]
        true
      end
    rescue JSON::ParserError
      nil
    end

    def set_from_uname
      @platform[:name]    = unix_uname_s.lines.first.chomp
      @platform[:release] = unix_uname_r.lines.first.chomp
      true
    end
  end
end
