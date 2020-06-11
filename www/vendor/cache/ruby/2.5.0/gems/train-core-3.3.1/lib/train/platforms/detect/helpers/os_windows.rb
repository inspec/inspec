module Train::Platforms::Detect::Helpers
  module Windows
    def detect_windows
      check_cmd || check_powershell
    end

    def check_cmd
      # try to detect windows, use cmd.exe to also support Microsoft OpenSSH
      res = @backend.run_command("cmd.exe /c ver")

      return false if (res.exit_status != 0) || res.stdout.empty?

      # if the ver contains `Windows`, we know its a Windows system
      version = res.stdout.strip
      return false unless version.downcase =~ /windows/

      @platform[:family] = "windows"

      # try to extract release from eg. `Microsoft Windows [Version 6.3.9600]`
      release = /\[(?<name>.*)\]/.match(version)
      if release[:name]
        # release is 6.3.9600 now
        @platform[:release] = release[:name].downcase.gsub("version", "").strip
        # fallback, if we are not able to extract the name from wmic later
        @platform[:name] = "Windows #{@platform[:release]}"
      end

      read_wmic
      true
    end

    def check_powershell
      command = @backend.run_command(
        "Get-WmiObject Win32_OperatingSystem | Select Caption,Version | ConvertTo-Json"
      )
      return false if (command.exit_status != 0) || command.stdout.empty?

      payload = JSON.parse(command.stdout)
      @platform[:family] = "windows"
      @platform[:release] = payload["Version"]
      @platform[:name] = payload["Caption"]

      read_wmic
      true
    end

    def local_windows?
      @backend.class.to_s == "Train::Transports::Local::Connection" &&
        ruby_host_os(/mswin|mingw32|windows/)
    end

    # reads os name and version from wmic
    # @see https://msdn.microsoft.com/en-us/library/bb742610.aspx#EEAA
    # Thanks to Matt Wrock (https://github.com/mwrock) for this hint
    def read_wmic
      res = @backend.run_command("wmic os get * /format:list")
      if res.exit_status == 0
        sys_info = {}
        res.stdout.lines.each do |line|
          m = /^\s*([^=]*?)\s*=\s*(.*?)\s*$/.match(line)
          sys_info[m[1].to_sym] = m[2] unless m.nil? || m[1].nil?
        end

        @platform[:release] = sys_info[:Version]
        # additional info on windows
        @platform[:build] = sys_info[:BuildNumber]
        @platform[:name] = sys_info[:Caption]
        @platform[:name] = @platform[:name].gsub("Microsoft", "").strip unless @platform[:name].empty?
        @platform[:arch] = read_wmic_cpu
      end
    end

    # `OSArchitecture` from `read_wmic` does not match a normal standard
    # For example, `x86_64` shows as `64-bit`
    def read_wmic_cpu
      res = @backend.run_command("wmic cpu get architecture /format:list")
      if res.exit_status == 0
        sys_info = {}
        res.stdout.lines.each do |line|
          m = /^\s*([^=]*?)\s*=\s*(.*?)\s*$/.match(line)
          sys_info[m[1].to_sym] = m[2] unless m.nil? || m[1].nil?
        end
      end

      # This converts `wmic os get architecture` output to a normal standard
      # https://msdn.microsoft.com/en-us/library/aa394373(VS.85).aspx
      arch_map = {
        0 => "i386",
        1 => "mips",
        2 => "alpha",
        3 => "powerpc",
        5 => "arm",
        6 => "ia64",
        9 => "x86_64",
      }

      # The value of `wmic cpu get architecture` is always a number between 0-9
      arch_number = sys_info[:Architecture].to_i
      arch_map[arch_number]
    end

    # This method scans the target os for a unique uuid to use
    def windows_uuid
      uuid = windows_uuid_from_chef
      uuid = windows_uuid_from_machine_file if uuid.nil?
      uuid = windows_uuid_from_wmic if uuid.nil?
      uuid = windows_uuid_from_registry if uuid.nil?
      raise Train::TransportError, "Cannot find a UUID for your node." if uuid.nil?

      uuid
    end

    def windows_uuid_from_machine_file
      %W{
        #{ENV["SYSTEMDRIVE"]}\\chef\\chef_guid
        #{ENV["HOMEDRIVE"]}#{ENV["HOMEPATH"]}\\.chef\\chef_guid
      }.each do |path|
        file = @backend.file(path)
        return file.content.chomp if file.exist? && file.size != 0
      end
      nil
    end

    def windows_uuid_from_chef
      file = @backend.file("#{ENV["SYSTEMDRIVE"]}\\chef\\cache\\data_collector_metadata.json")
      return if !file.exist? || file.size == 0

      json = JSON.parse(file.content)
      json["node_uuid"] if json["node_uuid"]
    end

    def windows_uuid_from_wmic
      result = @backend.run_command("wmic csproduct get UUID")
      return unless result.exit_status == 0

      result.stdout.split("\r\n")[-1].strip
    end

    def windows_uuid_from_registry
      cmd = '(Get-ItemProperty "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography" -Name "MachineGuid")."MachineGuid"'
      result = @backend.run_command(cmd)
      return unless result.exit_status == 0

      result.stdout.chomp
    end
  end
end
