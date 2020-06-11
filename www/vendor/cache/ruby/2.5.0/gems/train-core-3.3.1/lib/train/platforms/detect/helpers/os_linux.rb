# encoding: utf-8

module Train::Platforms::Detect::Helpers
  module Linux
    def redhatish_platform(conf)
      conf =~ /^red hat/i ? "redhat" : /(\w+)/i.match(conf)[1].downcase
    end

    def redhatish_version(conf)
      case conf
      when /rawhide/i
        /((\d+) \(Rawhide\))/i.match(conf)[1].downcase
      when /Amazon Linux/i
        /([\d\.]+)/.match(conf)[1]
      when /derived from .*linux|amazon/i
        /Linux ((\d+|\.)+)/i.match(conf)[1]
      else
        /release ([\d\.]+)/.match(conf)[1]
      end
    end

    def redhatish(path)
      if (raw = unix_file_contents(path))
        @platform[:release] = redhatish_version(raw)
        true
      end
    end

    def linux_os_release
      data = unix_file_contents("/etc/os-release")
      return if data.nil?

      os_info = parse_os_release_info(data)
      cisco_info_file = os_info["CISCO_RELEASE_INFO"]
      if cisco_info_file
        os_info.merge!(parse_os_release_info(unix_file_contents(cisco_info_file)))
      end

      os_info
    end

    def parse_os_release_info(raw)
      return {} if raw.nil?

      raw.lines.each_with_object({}) do |line, memo|
        line.strip!
        next if line.nil? || line.empty?
        next if line.start_with?("#")

        key, value = line.split("=", 2)
        memo[key] = value.gsub(/\A"|"\Z/, "") unless value.nil? || value.empty?
      end
    end

    def lsb_config(content)
      id = /^DISTRIB_ID=["']?(.+?)["']?$/.match(content)
      release = /^DISTRIB_RELEASE=["']?(.+?)["']?$/.match(content)
      codename = /^DISTRIB_CODENAME=["']?(.+?)["']?$/.match(content)
      {
        id: id.nil? ? nil : id[1],
        release: release.nil? ? nil : release[1],
        codename: codename.nil? ? nil : codename[1],
      }
    end

    def lsb_release(content)
      id = /^Distributor ID:\s+(.+)$/.match(content)
      release = /^Release:\s+(.+)$/.match(content)
      codename = /^Codename:\s+(.+)$/.match(content)
      {
        id: id.nil? ? nil : id[1],
        release: release.nil? ? nil : release[1],
        codename: codename.nil? ? nil : codename[1],
      }
    end

    def read_linux_lsb
      return @lsb unless @lsb.empty?

      if !(raw = unix_file_contents("/etc/lsb-release")).nil?
        @lsb = lsb_config(raw)
      elsif !(raw = unix_file_contents("/usr/bin/lsb-release")).nil?
        @lsb = lsb_release(raw)
      end
    end
  end
end
