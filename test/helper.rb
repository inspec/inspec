# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/setup'

require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
  add_group 'Resources', 'lib/resources'
  add_group 'Matchers', 'lib/matchers'
  add_group 'Backends', 'lib/inspec/backend'
end

require 'inspec/resource'
require 'inspec/backend'
require 'inspec/profile'
require 'inspec/targets'
require 'inspec/targets/zip'

class MockLoader
  # pass the os identifier to emulate a specific operating system
  def initialize(os = nil)
    # collects emulation operating systems
    @operating_systems = {
      arch:       { family: 'arch', release: nil, arch: nil },
      centos5:    { family: 'redhat', release: '5.11', arch: 'x86_64' },
      centos6:    { family: 'redhat', release: '6.6', arch: 'x86_64' },
      centos7:    { family: 'redhat', release: '7.1.1503', arch: 'x86_64' },
      debian6:    { family: 'debian', release: '6', arch: 'x86_64' },
      debian7:    { family: 'debian', release: '7', arch: 'x86_64' },
      debian8:    { family: 'debian', release: '8', arch: 'x86_64' },
      freebsd9:   { family: 'freebsd', release: '9', arch: 'amd64' },
      freebsd10:  { family: 'freebsd', release: '10', arch: 'amd64' },
      osx104:     { family: 'darwin', release: '10.10.4', arch: nil, name: 'mac_os_x' },
      ubuntu1204: { family: 'ubuntu', release: '12.04', arch: 'x86_64' },
      ubuntu1404: { family: 'ubuntu', release: '14.04', arch: 'x86_64' },
      ubuntu1504: { family: 'ubuntu', release: '15.04', arch: 'x86_64' },
      windows:    { family: 'windows', release: nil, arch: nil },
      wrlinux:    { family: 'wrlinux', release: '7.0(3)I2(2)', arch: 'x86_64' },
      undefined:  { family: nil, release: nil, arch: nil },
    }

    # selects operating system
    @os = @operating_systems[os || :ubuntu1404]
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
      '/etc/ntp.conf' => mockfile.call('ntp.conf'),
      '/etc/login.defs' => mockfile.call('login.defs'),
      '/etc/security/limits.conf' => mockfile.call('limits.conf'),
      '/etc/inetd.conf' => mockfile.call('inetd.conf'),
      '/etc/group' => mockfile.call('etcgroup'),
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
      '/etc/apache2/conf-enabled/serve-cgi-bin.conf' => mockfile.call('serve-cgi-bin.conf'),
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
      'Get-Content win_secpol.cfg' => cmd.call('secedit-export'),
      'secedit /export /cfg win_secpol.cfg' => cmd.call('success'),
      'Remove-Item win_secpol.cfg' => cmd.call('success'),
      'env' => cmd.call('env'),
      '$Env:PATH'  => cmd.call('$env-PATH'),
      # registry key test
      '2790db1e88204a073ed7fd3493f5445e5ce531afd0d2724a0e36c17110c535e6' => cmd.call('reg_schedule'),
      'Auditpol /get /subcategory:\'User Account Management\' /r' => cmd.call('auditpol'),
      '/sbin/auditctl -l' => cmd.call('auditctl'),
      'yum -v repolist all'  => cmd.call('yum-repolist-all'),
      'dpkg -s curl' => cmd.call('dpkg-s-curl'),
      'rpm -qia curl' => cmd.call('rpm-qia-curl'),
      'pacman -Qi curl' => cmd.call('pacman-qi-curl'),
      'gem list --local -a -q ^rubocop$' => cmd.call('gem-list-local-a-q-rubocop'),
      'npm ls -g --json bower' => cmd.call('npm-ls-g--json-bower'),
      'pip show jinja2' => cmd.call('pip-show-jinja2'),
      "Get-Package -Name 'Mozilla Firefox' | ConvertTo-Json" => cmd.call('get-package-firefox'),
      "Get-Package -Name 'Ruby 2.1.6-p336-x64' | ConvertTo-Json" => cmd.call('get-package-ruby'),
      "New-Object -Type PSObject | Add-Member -MemberType NoteProperty -Name Service -Value (Get-Service -Name dhcp| Select-Object -Property Name, DisplayName, Status) -PassThru | Add-Member -MemberType NoteProperty -Name WMI -Value (Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq 'dhcp' -or $_.DisplayName -eq 'dhcp'} | Select-Object -Property StartMode) -PassThru | ConvertTo-Json" => cmd.call('get-service-dhcp'),
      "Get-WindowsFeature | Where-Object {$_.Name -eq 'dhcp' -or $_.DisplayName -eq 'dhcp'} | Select-Object -Property Name,DisplayName,Description,Installed,InstallState | ConvertTo-Json" => cmd.call('get-windows-feature'),
      'lsmod' => cmd.call('lsmod'),
      '/sbin/sysctl -q -n net.ipv4.conf.all.forwarding' => cmd.call('sbin_sysctl'),
      # ports on windows
      'Get-NetTCPConnection | Select-Object -Property State, Caption, Description, LocalAddress, LocalPort, RemoteAddress, RemotePort, DisplayName, Status | ConvertTo-Json' => cmd.call('get-net-tcpconnection'),
      # ports on mac
      'lsof -nP -iTCP -iUDP -sTCP:LISTEN' => cmd.call('lsof-np-itcp'),
      # ports on linux
      'netstat -tulpen' => cmd.call('netstat-tulpen'),
      # ports on freebsd
      'sockstat -46l' => cmd.call('sockstat'),
      # packages on windows
      "Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq 'Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161'} | Select-Object -Property Name,Version,Vendor,PackageCode,Caption,Description | ConvertTo-Json" => cmd.call('win32_product'),
      # service status upstart on ubuntu
      'initctl status ssh' => cmd.call('initctl-status-ssh'),
      # service config for upstart on ubuntu
      'initctl show-config ssh' => cmd.call('initctl-show-config-ssh'),
      # show ssh service Centos 7
      'systemctl show --all sshd' => cmd.call('systemctl-show-all-sshd'),
      # services on macos
      'launchctl list' => cmd.call('launchctl-list'),
      # services on freebsd 10
      'service -e' => cmd.call('service-e'),
      'service sendmail onestatus' => cmd.call('service-sendmail-onestatus'),
      # services for system 5 e.g. centos6, debian 6
      'service sshd status' => cmd.call('service-sshd-status'),
      'find /etc/rc*.d -name S*' => cmd.call('find-etc-rc-d-name-S'),
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
      # user info for windows
      '650b6b72a66316418b25421a54afe21a230704558082914c54711904bb10e370' => cmd.call('GetUserAccount'),
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
      'find /etc/apache2/conf-enabled/*.conf -maxdepth 1 -type f' => cmd.call('find-apache2-conf-enabled'),
      # mount
      "mount | grep -- ' on /'" => cmd.call("mount"),
      "mount | grep -- ' on /mnt/iso-disk'" => cmd.call("mount-multiple"),
    }

    @backend
  end

  # loads a resource class and instantiates the class with the given arguments
  def load_resource(resource, *args)
    # initialize resource with backend and parameters
    @resource_class = Inspec::Resource.registry[resource]
    @resource = @resource_class.new(backend, resource, *args)
  end
end

def load_resource(*args)
  m = MockLoader.new(:ubuntu1404)
  m.send('load_resource', *args)
end
