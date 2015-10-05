# encoding: utf-8

require 'minitest/autorun'
require 'minitest/spec'

require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
  add_group 'Resources', 'lib/resources'
  add_group 'Matchers', 'lib/matchers'
  add_group 'Backends', 'lib/vulcano/backend'
end

require 'vulcano/backend'
require 'vulcano/resource'

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
      undefined:  { family: nil, release: nil, arch: nil },
    }

    # selects operating system
    @os = @operating_systems[os || :ubuntu1404]
  end

  # loads a resource class and instantiates the class with the given arguments
  def load_resource(resource, *args)
    scriptpath = ::File.realpath(::File.dirname(__FILE__))

    # create mock backend
    conf = Vulcano::Backend.target_config()
    backend_class = Vulcano::Backend.registry['mock']
    @backend = backend_class.new(conf)

    # create all mock files
    local = Vulcano::Backend.registry['local'].new({})
    mockfile = lambda { |x|
      path = ::File.join(scriptpath, '/unit/mock/files', x)
      local.file(path)
    }
    @backend.files = {
      '/proc/net/bonding/bond0' => mockfile.call('bond0'),
      '/etc/ssh/ssh_config' => mockfile.call('ssh_config'),
      '/etc/ssh/sshd_config' => mockfile.call('sshd_config'),
      '/etc/passwd' => mockfile.call('passwd'),
      '/etc/ntp.conf' => mockfile.call('ntp.conf'),
      '/etc/login.defs' => mockfile.call('login.defs'),
      '/etc/security/limits.conf' => mockfile.call('limits.conf'),
      '/etc/inetd.conf' => mockfile.call('inetd.conf'),
      '/etc/group' => mockfile.call('group'),
      '/etc/audit/auditd.conf' => mockfile.call('auditd.conf'),
      '/etc/mysql/my.cnf' => mockfile.call('mysql.conf'),
      '/etc/mysql/mysql2.conf' => mockfile.call('mysql2.conf'),
      'kitchen.yml' => mockfile.call('kitchen.yml'),
      'example.csv' => mockfile.call('example.csv'),
      'policyfile.lock.json' => mockfile.call('policyfile.lock.json'),
    }

    # create all mock commands
    cmd = lambda {|x|
      stdout = ::File.read(::File.join(scriptpath, '/unit/mock/cmd/'+x))
      @backend.mock_command(stdout, '', 0)
    }
    @backend.commands = {
      'ps aux' => cmd.call('ps-aux'),
      'type win_secpol.cfg' => cmd.call('secedit-export'),
      'secedit /export /cfg win_secpol.cfg' => cmd.call('success'),
      'del win_secpol.cfg' => cmd.call('success'),
      'su - root -c \'echo $PATH\'' => cmd.call('PATH'),
      '(Get-Item \'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule\').GetValue(\'Start\')' => cmd.call('reg_schedule'),
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
      'find /etc/rc*.d -name S*'  => cmd.call('find-etc-rc-d-name-S'),
      'ls -1 /etc/init.d/' => cmd.call('ls-1-etc-init.d'),
      # user information for linux
      'id root' => cmd.call('id-root'),
      'getent passwd root' => cmd.call('getent-passwd-root'),
      'chage -l root'  => cmd.call('chage-l-root'),
      # user info for mac
      'id chartmann' => cmd.call('id-chartmann'),
      'dscl -q . -read /Users/chartmann NFSHomeDirectory PrimaryGroupID RecordName UniqueID UserShell' => cmd.call('dscl'),
      # user info for freebsd
      'pw usershow root -7' => cmd.call('pw-usershow-root-7'),
      # user info for windows
      '650b6b72a66316418b25421a54afe21a230704558082914c54711904bb10e370' => cmd.call('GetUserAccount'),
    }

    # set os emulation
    @backend.os = @os

    # load resource
    @rclass = Vulcano::Resource.registry[resource]

    # merge arguments
    args = [@backend] | args

    # initialize resource with backend and parameters
    @resource = @rclass.new(*args)
  end
end

def load_resource(*args)
  m = MockLoader.new(:ubuntu1404)
  m.send('load_resource', *args)
end
