# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
  add_group 'Resources', 'lib/resources'
  add_group 'Matchers', 'lib/matchers'
  add_group 'Backends', 'lib/inspec/backend'
end

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/setup'
require 'fileutils'
require 'pathname'
require 'tempfile'
require 'tmpdir'
require 'zip'

require 'inspec/base_cli'
require 'inspec/version'
require 'inspec/fetcher'
require 'inspec/source_reader'
require 'inspec/resource'
require 'inspec/backend'
require 'inspec/profile'
require 'inspec/runner'
require 'inspec/runner_mock'
require 'fetchers/mock'

require 'train'
CMD = Train.create('local').connection
TMP_CACHE = {}

class MockLoader
  # collects emulation operating systems
  OPERATING_SYSTEMS = {
    arch:       { name: 'arch', family: 'arch', release: nil, arch: nil },
    centos5:    { name: 'centos', family: 'redhat', release: '5.11', arch: 'x86_64' },
    centos6:    { name: 'centos', family: 'redhat', release: '6.6', arch: 'x86_64' },
    centos7:    { name: 'centos', family: 'redhat', release: '7.1.1503', arch: 'x86_64' },
    debian6:    { name: 'debian', family: 'debian', release: '6', arch: 'x86_64' },
    debian7:    { name: 'debian', family: 'debian', release: '7', arch: 'x86_64' },
    debian8:    { name: 'debian', family: 'debian', release: '8', arch: 'x86_64' },
    freebsd9:   { name: 'freebsd', family: 'freebsd', release: '9', arch: 'amd64' },
    freebsd10:  { name: 'freebsd', family: 'freebsd', release: '10', arch: 'amd64' },
    osx104:     { name: 'mac_os_x',family: 'darwin', release: '10.10.4', arch: nil },
    ubuntu1204: { name: 'ubuntu', family: 'debian', release: '12.04', arch: 'x86_64' },
    ubuntu1404: { name: 'ubuntu', family: 'debian', release: '14.04', arch: 'x86_64' },
    ubuntu1504: { name: 'ubuntu', family: 'debian', release: '15.04', arch: 'x86_64' },
    windows:    { name: 'windows', family: 'windows', release: '6.2.9200', arch: 'x86_64' },
    wrlinux:    { name: 'wrlinux', family: 'redhat', release: '7.0(3)I2(2)', arch: 'x86_64' },
    solaris11:  { name: "solaris", family: 'solaris', release: '11', arch: 'i386'},
    solaris10:  { name: "solaris", family: 'solaris', release: '10', arch: 'i386'},
    hpux:       { name: 'hpux', family: 'hpux', release: 'B.11.31', arch: 'ia64'},
    undefined:  { name: nil, family: nil, release: nil, arch: nil },
  }

  # pass the os identifier to emulate a specific operating system
  def initialize(os = nil)
    # selects operating system
    @os = OPERATING_SYSTEMS[os || :ubuntu1404]
  end

  def backend
    return @backend if defined?(@backend)
    scriptpath = ::File.realpath(::File.dirname(__FILE__))

    # create mock backend
    @backend = Inspec::Backend.create({ backend: :mock })
    mock = @backend.backend

    # set os emulation
    mock.mock_os(@os)

    # create all mock files
    local = Train.create('local').connection
    mockfile = lambda { |x|
      path = ::File.join(scriptpath, '/unit/mock/files', x)
      local.file(path)
    }
    mockdir = lambda { |x|
      md = Object.new

      class << md
        attr_accessor :isdir
      end
      md.isdir = x

      def md.directory?
        isdir
      end
      md
    }

    mock.files = {
      '/proc/net/bonding/bond0' => mockfile.call('bond0'),
      '/etc/ssh/ssh_config' => mockfile.call('ssh_config'),
      '/etc/ssh/sshd_config' => mockfile.call('sshd_config'),
      '/etc/passwd' => mockfile.call('passwd'),
      '/etc/shadow' => mockfile.call('shadow'),
      '/etc/ntp.conf' => mockfile.call('ntp.conf'),
      '/etc/login.defs' => mockfile.call('login.defs'),
      '/etc/security/limits.conf' => mockfile.call('limits.conf'),
      '/etc/inetd.conf' => mockfile.call('inetd.conf'),
      '/etc/group' => mockfile.call('etcgroup'),
      '/etc/grub.conf' => mockfile.call('grub.conf'),
      '/etc/audit/auditd.conf' => mockfile.call('auditd.conf'),
      '/etc/mysql/my.cnf' => mockfile.call('mysql.conf'),
      '/etc/mysql/mysql2.conf' => mockfile.call('mysql2.conf'),
      'kitchen.yml' => mockfile.call('kitchen.yml'),
      'example.csv' => mockfile.call('example.csv'),
      'policyfile.lock.json' => mockfile.call('policyfile.lock.json'),
      '/sys/class/net/br0/bridge' => mockdir.call(true),
      'rootwrap.conf' => mockfile.call('rootwrap.conf'),
      '/etc/apache2/apache2.conf' => mockfile.call('apache2.conf'),
      '/etc/apache2/ports.conf' => mockfile.call('ports.conf'),
      '/etc/httpd/conf/httpd.conf' => mockfile.call('httpd.conf'),
      '/etc/httpd/conf.d/ssl.conf' => mockfile.call('ssl.conf'),
      '/etc/httpd/mods-enabled/status.conf' => mockfile.call('status.conf'),
      '/etc/apache2/conf-enabled/serve-cgi-bin.conf' => mockfile.call('serve-cgi-bin.conf'),
      '/etc/xinetd.conf' => mockfile.call('xinetd.conf'),
      '/etc/xinetd.d' => mockfile.call('xinetd.d'),
      '/etc/xinetd.d/chargen-stream' => mockfile.call('xinetd.d_chargen-stream'),
      '/etc/xinetd.d/chargen-dgram' => mockfile.call('xinetd.d_chargen-dgram'),
      '/etc/sysctl.conf' => mockfile.call('sysctl.conf'),
    }

    # create all mock commands
    cmd = lambda {|x|
      stdout = ::File.read(::File.join(scriptpath, '/unit/mock/cmd/'+x))
      mock.mock_command('', stdout, '', 0)
    }

    empty = lambda {
      mock.mock_command('', '', '', 0)
    }

    mock.commands = {
      'ps aux' => cmd.call('ps-aux'),
      'ps auxZ' => cmd.call('ps-auxZ'),
      'Get-Content win_secpol.cfg' => cmd.call('secedit-export'),
      'secedit /export /cfg win_secpol.cfg' => cmd.call('success'),
      'Remove-Item win_secpol.cfg' => cmd.call('success'),
      'env' => cmd.call('env'),
      '${Env:PATH}'  => cmd.call('$env-PATH'),
      # registry key test using winrm 2.0
      '2376c7b3d81de9382303356e1efdea99385effb84788562c3e697032d51bf942' => cmd.call('reg_schedule'),
      'F2376c7b3d81de9382303356e1efdea99385effb84788562c3e697032d51bf942' => cmd.call('reg_schedule'),
      'Auditpol /get /subcategory:\'User Account Management\' /r' => cmd.call('auditpol'),
      '/sbin/auditctl -l' => cmd.call('auditctl'),
      '/sbin/auditctl -s' => cmd.call('auditctl-s'),
      'yum -v repolist all'  => cmd.call('yum-repolist-all'),
      'dpkg -s curl' => cmd.call('dpkg-s-curl'),
      'rpm -qia curl' => cmd.call('rpm-qia-curl'),
      'pacman -Qi curl' => cmd.call('pacman-qi-curl'),
      'gem list --local -a -q ^rubocop$' => cmd.call('gem-list-local-a-q-rubocop'),
      'npm ls -g --json bower' => cmd.call('npm-ls-g--json-bower'),
      'pip show jinja2' => cmd.call('pip-show-jinja2'),
      "Get-Package -Name 'Mozilla Firefox' | ConvertTo-Json" => cmd.call('get-package-firefox'),
      "Get-Package -Name 'Ruby 2.1.6-p336-x64' | ConvertTo-Json" => cmd.call('get-package-ruby'),
      "New-Object -Type PSObject | Add-Member -MemberType NoteProperty -Name Service -Value (Get-Service -Name 'dhcp'| Select-Object -Property Name, DisplayName, Status) -PassThru | Add-Member -MemberType NoteProperty -Name WMI -Value (Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq 'dhcp' -or $_.DisplayName -eq 'dhcp'} | Select-Object -Property StartMode) -PassThru | ConvertTo-Json" => cmd.call('get-service-dhcp'),
      "Get-WindowsFeature | Where-Object {$_.Name -eq 'dhcp' -or $_.DisplayName -eq 'dhcp'} | Select-Object -Property Name,DisplayName,Description,Installed,InstallState | ConvertTo-Json" => cmd.call('get-windows-feature'),
      'lsmod' => cmd.call('lsmod'),
      '/sbin/sysctl -q -n net.ipv4.conf.all.forwarding' => cmd.call('sbin_sysctl'),
      # ports on windows
      'Get-NetTCPConnection -state Listen | Select-Object -Property State, Caption, Description, LocalAddress, LocalPort, RemoteAddress, RemotePort, DisplayName, Status | ConvertTo-Json' => cmd.call('get-net-tcpconnection'),
      'netstat -anbo | Select-String  -CaseSensitive -pattern "^\s+UDP|\s+LISTENING\s+\d+$" -context 0,1' => cmd.call('netstat-anbo-pipe-select-string-pattern.utf8'),
      # lsof formatted list of ports (should be quite cross platform)
      'lsof -nP -i -FpctPn' => cmd.call('lsof-nP-i-FpctPn'),
      # ports on linux
      'netstat -tulpen' => cmd.call('netstat-tulpen'),
      # ports on freebsd
      'sockstat -46l' => cmd.call('sockstat'),
      # packages on windows
      'f18912b2e36924b367a110c31da6b835a1c217cd10014c7312b7435bf79a601c' => cmd.call('get-item-property-package'),
      # service status upstart on ubuntu
      'initctl status ssh' => cmd.call('initctl-status-ssh'),
      # service config for upstart on ubuntu
      'initctl show-config ssh' => cmd.call('initctl-show-config-ssh'),
      # upstart version on ubuntu
      'initctl --version' => cmd.call('initctl--version'),
      # show ssh service Centos 7
      'systemctl show --all sshd' => cmd.call('systemctl-show-all-sshd'),
      '/path/to/systemctl show --all sshd' => cmd.call('systemctl-show-all-sshd'),
      'systemctl show --all dbus' => cmd.call('systemctl-show-all-dbus'),
      '/path/to/systemctl show --all dbus' => cmd.call('systemctl-show-all-dbus'),
      # services on macos
      'launchctl list' => cmd.call('launchctl-list'),
      # services on freebsd 10
      'service -e' => cmd.call('service-e'),
      'service sendmail onestatus' => cmd.call('service-sendmail-onestatus'),
      # services for system 5 e.g. centos6, debian 6
      'service sshd status' => cmd.call('service-sshd-status'),
      'find /etc/rc*.d /etc/init.d/rc*.d -name S*' => cmd.call('find-etc-rc-d-name-S'),
      'ls -1 /etc/init.d/' => cmd.call('ls-1-etc-init.d'),
      # user information for linux
      'id root' => cmd.call('id-root'),
      'getent passwd root' => cmd.call('getent-passwd-root'),
      'chage -l root' => cmd.call('chage-l-root'),
      # user information for ldap test
      'id jfolmer' => cmd.call('id-jfolmer'),
      'getent passwd jfolmer' => cmd.call('getent-passwd-jfolmer'),
      'chage -l jfolmer' => cmd.call('chage-l-root'),
      # user info for mac
      'id chartmann' => cmd.call('id-chartmann'),
      'dscl -q . -read /Users/chartmann NFSHomeDirectory PrimaryGroupID RecordName UniqueID UserShell' => cmd.call('dscl'),
      # user info for freebsd
      'pw usershow root -7' => cmd.call('pw-usershow-root-7'),
      # user info for windows (winrm 1.6.0, 1.6.1)
      '942eeec2b290bda610229d4bd29981ee945ed27b0f4ce7cca099aabe38af6386' => cmd.call('GetUserAccount'),
      # group info for windows
      'Get-WmiObject Win32_Group | Select-Object -Property Caption, Domain, Name, SID, LocalAccount | ConvertTo-Json' => cmd.call('GetWin32Group'),
      # network interface
      '9e80f048a1af5a0f6ab8a465e46ea5ed5ba6587e9b5e54a7a0c0a1a02bb6f663' => cmd.call('find-net-interface'),
      'c33821dece09c8b334e03a5bb9daefdf622007f73af4932605e758506584ec3f' => empty.call,
      'Get-NetAdapter | Select-Object -Property Name, InterfaceDescription, Status, State, MacAddress, LinkSpeed, ReceiveLinkSpeed, TransmitLinkSpeed, Virtual | ConvertTo-Json' => cmd.call('Get-NetAdapter'),
      # bridge on linux
      'ls -1 /sys/class/net/br0/brif/' => cmd.call('ls-sys-class-net-br'),
      # bridge on Windows
      'Get-NetAdapterBinding -ComponentID ms_bridge | Get-NetAdapter | Select-Object -Property Name, InterfaceDescription | ConvertTo-Json' => cmd.call('get-netadapter-binding-bridge'),
      # host for Windows
      'Resolve-DnsName –Type A microsoft.com | ConvertTo-Json' => cmd.call('Resolve-DnsName'),
      'Test-NetConnection -ComputerName microsoft.com | Select-Object -Property ComputerName, PingSucceeded | ConvertTo-Json' => cmd.call('Test-NetConnection'),
      # host for Linux
      'getent hosts example.com' => cmd.call('getent-hosts-example.com'),
      'ping -w 1 -c 1 example.com' => cmd.call('ping-example.com'),
      # apt
      "find /etc/apt/ -name *.list -exec sh -c 'cat {} || echo -n' \\;" => cmd.call('etc-apt'),
      # iptables
      'iptables  -S' => cmd.call('iptables-s'),
      # apache_conf
      'find /etc/apache2/ports.conf -maxdepth 1 -type f' => cmd.call('find-apache2-ports-conf'),
      'find /etc/httpd/conf.d/*.conf -maxdepth 1 -type f' => cmd.call('find-httpd-ssl-conf'),
      'find /etc/httpd/mods-enabled/*.conf -maxdepth 1 -type f' => cmd.call('find-httpd-status-conf'),
      'find /etc/apache2/conf-enabled/*.conf -maxdepth 1 -type f' => cmd.call('find-apache2-conf-enabled'),
      # mount
      "mount | grep -- ' on /'" => cmd.call("mount"),
      "mount | grep -- ' on /mnt/iso-disk'" => cmd.call("mount-multiple"),
      # solaris 10 package manager
      'pkginfo -l SUNWzfsr' => cmd.call('pkginfo-l-SUNWzfsr'),
      # solaris 11 package manager
      'pkg info system/file-system/zfs' => cmd.call('pkg-info-system-file-system-zfs'),
      # port netstat on solaris 10 & 11
      'netstat -an -f inet -f inet6' => cmd.call('s11-netstat-an-finet-finet6'),
      # xinetd configuration
      'find /etc/xinetd.d -type f' => cmd.call('find-xinetd.d'),
      # wmi test
      "2979ebeb80a475107d85411f109209a580ccf569071b3dc7acff030b8635c6b9" => cmd.call('get-wmiobject'),
      #user info on hpux
      "logins -x -l root" => cmd.call('logins-x'),
      #packages on hpux
      "swlist -l product | grep vim" => cmd.call('swlist-l-product'),
      # ipv4 ports on hpux
      'netstat -an -f inet' => cmd.call('hpux-netstat-inet'),
      #ipv6 ports on hpux
      'netstat -an -f inet6' => cmd.call('hpux-netstat-inet6'),
      # hostname linux
      'hostname' => cmd.call('hostname'),
      # hostname windows
      '$env:computername' => cmd.call('$env-computername'),
    }

    @backend
  end

  # loads a resource class and instantiates the class with the given arguments
  def load_resource(resource, *args)
    # initialize resource with backend and parameters
    @resource_class = Inspec::Resource.registry[resource]
    @resource = @resource_class.new(backend, resource, *args)
  end

  def self.mock_os(resource, name)
    osinfo = OPERATING_SYSTEMS[name] ||
             fail("Can't find operating system to mock: #{name}")
    resource.inspec.backend.mock_os(osinfo)
  end

  def self.mock_command(resource, cmd, res = {})
    resource.inspec.backend
            .mock_command(cmd, res[:stdout], res[:stderr], res[:exit_status])
  end

  def self.home
    File.join(File.dirname(__FILE__), 'unit')
  end

  def self.profile_path(name)
    dst = name
    dst = "#{home}/mock/profiles/#{name}" unless name.start_with?(home)
    dst
  end

  def self.load_profile(name, opts = {})
    opts[:test_collector] = Inspec::RunnerMock.new
    opts[:backend] = Inspec::Backend.create(opts)
    Inspec::Profile.for_target(profile_path(name), opts)
  end

  def self.profile_tgz(name)
    path = File.join(home, 'mock', 'profiles', name)
    dst = File.join(Dir.tmpdir, Dir::Tmpname.make_tmpname(name, '.tar.gz'))

    # generate relative paths
    files = Dir.glob("#{path}/**/*")
    relatives = files.map { |e| Pathname.new(e).relative_path_from(Pathname.new(path)).to_s }

    require 'inspec/archive/tar'
    tag = Inspec::Archive::TarArchiveGenerator.new
    tag.archive(path, relatives, dst)

    dst
  end

  def self.profile_zip(name, opts = {})
    path = File.join(home, 'mock', 'profiles', name)
    dst = File.join(Dir.tmpdir, Dir::Tmpname.make_tmpname(name, '.zip'))

    # rubyzip only works relative paths
    files = Dir.glob("#{path}/**/*")
    relatives = files.map { |e| Pathname.new(e).relative_path_from(Pathname.new(path)).to_s }

    require 'inspec/archive/zip'
    zag = Inspec::Archive::ZipArchiveGenerator.new
    zag.archive(path, relatives, dst)

    dst
  end
end

def load_resource(*args)
  m = MockLoader.new(:ubuntu1404)
  m.send('load_resource', *args)
end
