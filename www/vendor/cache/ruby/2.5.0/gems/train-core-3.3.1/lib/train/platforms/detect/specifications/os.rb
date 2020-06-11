# rubocop:disable Style/ParenthesesAroundCondition

module Train::Platforms::Detect::Specifications
  class OS
    def self.load
      load_toplevel
      load_windows
      load_unix
      load_other
    end

    def self.load_toplevel
      plat.family("os").detect { true }
    end

    def self.load_windows
      declare_category("windows", "os") do
        (winrm? ||
         local_windows? ||
         detect_windows) # ssh
      end

      declare_family("windows", "windows") do
        detect_windows
      end
    end

    def self.load_unix
      declare_category("unix", "os") do
        # we want to catch a special case here where cisco commands
        # don't return an exit status and still print to stdout
        uname = unix_uname_s
        unless (uname.empty? ||
                uname.start_with?("Line has invalid autocommand") ||
                uname.start_with?("The command you have entered"))
          @platform[:arch] = unix_uname_m
          true
        end
      end

      load_linux
      load_other_unix
      load_bsd
    end

    def self.load_linux
      declare_category("linux", "unix") do
        unix_uname_s =~ /linux/i
      end

      declare_category("debian", "linux") do
        unix_file_exist?("/etc/debian_version")
      end

      declare_lsb("ubuntu", "Ubuntu Linux", "debian", /ubuntu/i)

      declare_lsb("linuxmint", "LinuxMint", "debian", /linuxmint/i)

      declare_instance("kali", "Kali Linux", "debian") do
        l_o_r = linux_os_release
        if l_o_r && l_o_r["ID"] == "kali"
          @platform[:release] = l_o_r["VERSION"]
          true
        end
      end

      declare_instance("raspbian", "Raspbian Linux", "debian") do
        rel = linux_os_release
        if (rel && rel["NAME"] =~ /raspbian/i) ||
            unix_file_exist?("/usr/bin/raspi-config")
          @platform[:release] = unix_file_contents("/etc/debian_version").chomp

          true
        end
      end

      declare_instance("debian", "Debian Linux", "debian") do
        # if we get this far we have to be some type of debian
        @platform[:release] = unix_file_contents("/etc/debian_version").chomp

        true
      end

      declare_category("fedora", "linux") do
        rel = linux_os_release
        rel && rel["NAME"] =~ /fedora/i
      end

      declare_instance("fedora", "Fedora", "fedora") do
        @platform[:release] = linux_os_release["VERSION_ID"]
        true
      end

      # must come before redhat as it uses fedora under the hood
      plat.family("arista_eos").title("Arista EOS Family").in_family("linux")
        .detect do
          true
        end

      declare_instance("arista_eos_bash", "Arista EOS Bash Shell", "arista_eos") do
        # this checks for the arista bash shell
        if unix_file_exist?("/usr/bin/FastCli")
          # TODO: no tests
          json_cmd('FastCli -p 15 -c "show version | json"')
        end
      end

      declare_category("redhat", "linux") do
        true
      end

      declare_instance("centos", "Centos Linux", "redhat") do
        lsb = read_linux_lsb
        if lsb && lsb[:id] =~ /centos/i
          # TODO: no tests
          @platform[:release] = lsb[:release]
          true
        elsif (rel = linux_os_release) && rel["NAME"] =~ /centos/i
          @platform[:release] = redhatish_version(unix_file_contents("/etc/redhat-release"))
          true
        end
      end

      declare_instance("oracle", "Oracle Linux", "redhat") do
        (redhatish("/etc/oracle-release") ||
         redhatish("/etc/enterprise-release"))
      end

      declare_lsb("scientific", "Scientific Linux", "redhat", /scientific/i)

      declare_lsb("xenserver", "Xenserer Linux", "redhat", /xenserver/i)

      declare_instance("parallels-release", "Parallels Linux", "redhat") do
        if (raw = unix_file_contents("/etc/parallels-release"))
          @platform[:name] = redhatish_platform(raw)
          @platform[:release] = raw[/(\d\.\d\.\d)/, 1]
          # TODO: no tests
          true
        end
      end

      declare_instance("wrlinux", "Wind River Linux", "redhat") do
        rel = linux_os_release
        if rel && rel["ID_LIKE"] =~ /wrlinux/i
          @platform[:release] = rel["VERSION"]
          true
        end
      end

      declare_lsb_or_content("amazon", "Amazon Linux", "redhat", "/etc/system-release", /amazon/i)

      declare_lsb_or_content("cloudlinux", "CloudLinux", "redhat", "/etc/redhat-release", /cloudlinux/i)

      # keep redhat at the end as a fallback for anything with a redhat-release
      declare_lsb_or_content("redhat", "Red Hat Linux", "redhat", "/etc/redhat-release", /redhat/i, /./)

      declare_category("suse", "linux") do
        rel = linux_os_release
        if rel && rel["ID_LIKE"] =~ /suse/i
          @platform[:release] = rel["VERSION"]
          true
        elsif (suse = unix_file_contents("/etc/SuSE-release"))
          # https://rubular.com/r/UKaYWolCYFMfp1
          version = suse.scan(/VERSION = (\d+)\nPATCHLEVEL = (\d+)/).flatten.join(".")
          # https://rubular.com/r/b5PN3hZDxa5amV
          version = suse[/VERSION\s?=\s?"?([\d\.]{2,})"?/, 1] if version == ""
          @platform[:release] = version
          true
        end
      end

      declare_os_or_file("opensuse", "OpenSUSE Linux", "suse", "/etc/SuSE-release", /^opensuse/i)

      declare_os_or_file("suse",     "Suse Linux",     "suse", "/etc/SuSE-release", /^sles/i, /suse/i)

      declare_path_and_uname("arch", "Arch Linux", "linux", "/etc/arch-release")

      declare_file_content("slackware", "Slackware Linux", "linux", "/etc/slackware-version")

      declare_file_content("gentoo", "Gentoo Linux", "linux", "/etc/gentoo-release")

      declare_path_and_uname("exherbo", "Exherbo Linux", "linux", "/etc/exherbo-release")

      # TODO: try using declare_path
      declare_instance("alpine", "Alpine Linux", "linux") do
        if (raw = unix_file_contents("/etc/alpine-release"))
          @platform[:release] = raw.strip
          # TODO: no tests
          true
        end
      end

      declare_instance("coreos", "CoreOS Linux", "linux") do
        if unix_file_exist?("/etc/coreos/update.conf")
          lsb = read_linux_lsb
          @platform[:release] = lsb[:release]
          true
        end
      end

      declare_category("yocto", "linux") do
        # /etc/issue isn't specific to yocto, but it's the only way to detect
        # the platform because there are no other identifying files
        issue = unix_file_contents("/etc/issue")

        issue && issue.match?(/Poky|balenaOS/)
      end

      declare_instance("yocto", "Yocto Project Linux", "yocto") do
        issue = unix_file_contents("/etc/issue")
        if issue.match?("Poky")
          # assuming the Poky version is preferred over the /etc/version build
          @platform[:release] = issue[/\d+(\.\d+)+/]
          true
        end
      end

      declare_instance("balenaos", "balenaOS Linux", "yocto") do
        # balenaOS does have the /etc/os-release file
        issue = unix_file_contents("/etc/issue")
        if issue.match?("balenaOS") && linux_os_release["NAME"] =~ /balenaos/i
          @platform[:release] = linux_os_release["META_BALENA_VERSION"]
          true
        end
      end

      # brocade family detected here if device responds to 'uname' command,
      # happens when logging in as root
      plat.family("brocade").title("Brocade Family").in_family("linux")
        .detect do
          # TODO: no tests
          brocade_version
        end

      # this should always be last in the linux family list
      declare_instance("linux", "Generic Linux", "linux") do
        true
      end
    end

    def self.load_other_unix
      declare_instance("openvms", "OpenVMS", "unix") do
        if unix_uname_s =~ /unrecognized command verb/i
          # TODO: no tests
          cmd = @backend.run_command("show system/noprocess")

          if cmd.exit_status == 0 && !cmd.stdout.empty?
            # TODO: no tests
            @platform[:name] = cmd.stdout.downcase.split(" ")[0]
            cmd = @backend.run_command('write sys$output f$getsyi("VERSION")')
            @platform[:release] = cmd.stdout.downcase.split("\n")[1][1..-1]
            cmd = @backend.run_command('write sys$output f$getsyi("ARCH_NAME")')
            @platform[:arch] = cmd.stdout.downcase.split("\n")[1]
            true
          end
        end
      end

      declare_category("aix", "unix") do
        unix_uname_s =~ /aix/i
      end

      declare_instance("aix", "Aix", "aix") do
        out = @backend.run_command("uname -rvp").stdout
        if out =~ /(\d+)\s+(\d+)\s+(.*)/
          # TODO: no tests
          @platform[:release] = "#{$2}.#{$1}"
          @platform[:arch] = "#{$3}"
        end
        true
      end

      declare_category("solaris", "unix") do
        if unix_uname_s =~ /sunos/i
          # TODO: no tests

          @platform[:release] = $1 if unix_uname_r =~ /^5\.(\d+)$/

          arch = @backend.run_command("uname -p")
          @platform[:arch] = arch.stdout.chomp if arch.exit_status == 0
          true
        end
      end

      # TODO: these regexps are probably needlessly wasteful
      declare_path_regexp("smartos", "SmartOS", "solaris", "/etc/release", /^.*(SmartOS).*$/)

      declare_path("omnios", "Omnios", "solaris", "/etc/release", /^\s*OmniOS.*r(\d+).*$/)
      declare_path("openindiana", "Openindiana", "solaris", "/etc/release", /^\s*OpenIndiana.*oi_(\d+).*$/)

      declare_path("opensolaris", "Open Solaris", "solaris", "/etc/release", /^\s*OpenSolaris.*snv_(\d+).*$/)

      # TODO: these regexps are probably needlessly wasteful
      declare_path_regexp("nexentacore", "Nexentacore", "solaris", "/etc/release", /^\s*(NexentaCore)\s.*$/)

      declare_instance("solaris", "Solaris", "solaris") do
        rel = unix_file_contents("/etc/release")
        if rel =~ /Oracle Solaris (\d+)/
          @platform[:release] = $1
          # TODO: no tests
          true
        elsif rel =~ /^\s*(Solaris)\s.*$/
          # TODO: no tests
          true
        end

        # TODO: no tests

        # must be some unknown solaris
        true
      end

      declare_category("hpux", "unix") do
        unix_uname_s =~ /hp-ux/i
      end

      declare_instance("hpux", "Hpux", "hpux") do
        @platform[:release] = unix_uname_r.lines[0].chomp
        # TODO: no tests
        true
      end

      declare_category("qnx", "unix") do
        unix_uname_s =~ /qnx/i
      end

      declare_instance("qnx", "QNX", "qnx") do
        # TODO: refactor these uname patterns
        @platform[:name] = unix_uname_s.lines[0].chomp.downcase
        @platform[:release] = unix_uname_r.lines[0].chomp
        @platform[:arch] = unix_uname_m
        true
      end
    end

    def self.load_bsd
      declare_category("bsd", "unix") do
        # we need a better way to determine this family
        # for now we are going to just try each platform
        true
      end

      declare_category("darwin", "bsd") do
        # rubocop:disable Layout/ExtraSpacing
        # rubocop:disable Layout/SpaceAroundOperators
        if unix_uname_s =~ /darwin/i
          @platform[:release] ||= unix_uname_r.lines[0].chomp
          @platform[:arch]      = unix_uname_m
          cmd = @backend.run_command("sw_vers -buildVersion")
          @platform[:build]     = cmd.stdout.chomp if cmd.exit_status == 0
          true
        end
        # rubocop:enable Layout/ExtraSpacing
        # rubocop:enable Layout/SpaceAroundOperators
      end

      declare_instance("mac_os_x", "macOS X", "darwin") do
        cmd = unix_file_contents("/System/Library/CoreServices/SystemVersion.plist")
        @platform[:uuid_command] = "system_profiler SPHardwareDataType | awk '/UUID/ { print $3; }'"
        cmd =~ /Mac OS X/i
      end

      declare_instance("darwin", "Darwin", "darwin") do
        # must be some other type of darwin
        @platform[:name] = unix_uname_s.lines[0].chomp
        true
      end

      declare_bsd("freebsd", "Freebsd", "bsd", /freebsd/i)
      declare_bsd("openbsd", "Openbsd", "bsd", /openbsd/i)
      declare_bsd("netbsd", "Netbsd", "bsd", /netbsd/i)
    end

    def self.load_other
      plat.family("arista_eos").title("Arista EOS Family").in_family("os")
        .detect do
          true
        end

      declare_instance("arista_eos", "Arista EOS", "arista_eos") do
        json_cmd("show version | json")
      end

      plat.family("esx").title("ESXi Family").in_family("os")
        .detect do
          unix_uname_s =~ /vmkernel/i
        end

      plat.name("vmkernel").in_family("esx")
        .detect do
          # TODO: no tests
          set_from_uname
        end

      plat.family("cisco").title("Cisco Family").in_family("os")
        .detect do
          cisco_show_version
        end

      declare_cisco("cisco_ios", "Cisco IOS", "cisco", :cisco_show_version, "ios")
      declare_cisco("cisco_ios_xe", "Cisco IOS XE", "cisco", :cisco_show_version, "ios-xe")
      declare_cisco("cisco_nexus", "Cisco Nexus", "cisco", :cisco_show_version, "nexus", "show version | include Processor")

      plat.family("brocade").title("Brocade Family").in_family("os")
        .detect do
          brocade_version
        end

      declare_cisco("brocade_fos", "Brocade FOS", "brocade", :brocade_version, "fos")
    end

    ######################################################################
    # Helpers (keep these sorted)

    def self.plat
      Train::Platforms
    end

    def self.declare_category(family, parent, &block)
      plat.family(family).in_family(parent).detect(&block)
    end

    def self.declare_family(name, title = nil, family, &block)
      thingy = plat.name(name).in_family(family)
      thingy.title(title) if title
      thingy.detect(&block)
    end

    def self.declare_instance(name, title, family, &block)
      plat.name(name).title(title).in_family(family).detect(&block)
    end

    def self.declare_bsd(name, title, family, regexp)
      declare_instance(name, title, family) do
        # TODO: no tests
        set_from_uname if unix_uname_s =~ regexp
      end
    end

    def self.declare_cisco(name, title, family, detect, type, uuid = nil)
      declare_instance(name, title, family) do
        v = send(detect)

        next unless v[:type] == type

        @platform[:release] = v[:version]
        @platform[:arch] = nil
        @platform[:uuid_command] = uuid if uuid
        true
      end
    end

    def self.declare_file_content(name, title, family, path)
      declare_instance(name, title, family) do
        if (raw = unix_file_contents(path))
          # TODO: no tests
          @platform[:release] = raw.scan(/[\d.]+/).join
          true
        end
      end
    end

    def self.declare_lsb(name, title, family, regexp)
      declare_lsb_or_content(name, title, family, nil, regexp)
    end

    def self.declare_lsb_or_content(name, title, family, path, regexp1, regexp2 = regexp1)
      declare_instance(name, title, family) do
        lsb = read_linux_lsb
        if lsb && lsb[:id] =~ regexp1
          @platform[:release] = lsb[:release]
          true
        elsif path && (raw = unix_file_contents(path)) =~ regexp2
          @platform[:name] = redhatish_platform(raw)
          @platform[:release] = redhatish_version(raw)
          true
        end
      end
    end

    def self.declare_os_or_file(name, title, family, path, regexp1, regexp2 = regexp1)
      declare_instance(name, title, family) do
        rel = linux_os_release
        (rel && rel["NAME"] =~ regexp1) ||
          unix_file_contents(path) =~ regexp2
      end
    end

    def self.declare_path(name, title, family, path, regexp)
      declare_instance(name, title, family) do
        rel = unix_file_contents(path)
        if rel =~ regexp
          # TODO: no tests
          @platform[:release] = $1
          true
        end
      end
    end

    def self.declare_path_and_uname(name, title, family, path)
      declare_instance(name, title, family) do
        if unix_file_exist?(path)
          # Because this is a rolling release distribution,
          # use the kernel release, ex. 4.1.6-1-ARCH
          # TODO: unix_uname_r.lines[0].chomp ? -- no tests for /etc/exherbo-release or /etc/arch-release
          @platform[:release] = unix_uname_r
          true
        end
      end
    end

    def self.declare_path_regexp(name, title, family, path, regexp)
      declare_instance(name, title, family) do
        # TODO: no tests
        regexp =~ unix_file_contents(path)
      end
    end
  end
end
