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
require 'webmock/minitest'
require 'mocha/setup'
require 'fileutils'
require 'pathname'
require 'tempfile'
require 'tmpdir'
require 'zip'

require 'inspec/base_cli'
require 'inspec/version'
require 'inspec/exceptions'
require 'inspec/fetcher'
require 'inspec/source_reader'
require 'inspec/resource'
require 'inspec/backend'
require 'inspec/profile'
require 'inspec/runner'
require 'inspec/runner_mock'
require 'fetchers/mock'

require_relative '../lib/bundles/inspec-compliance'
require_relative '../lib/bundles/inspec-habitat'

require 'train'
CMD = Train.create('local').connection
TMP_CACHE = {}

Inspec::Log.logger = Logger.new(nil)

class MockLoader
  # collects emulation operating systems
  OPERATING_SYSTEMS = {
    arch:       { name: 'arch', family: 'arch', release: nil, arch: nil },
    centos5:    { name: 'centos', family: 'redhat', release: '5.11', arch: 'x86_64' },
    centos6:    { name: 'centos', family: 'redhat', release: '6.6', arch: 'x86_64' },
    centos7:    { name: 'centos', family: 'redhat', release: '7.1.1503', arch: 'x86_64' },
    coreos:     { name: 'coreos', family: 'coreos', release: '1437.0.0', arch: 'x86_64' },
    debian6:    { name: 'debian', family: 'debian', release: '6', arch: 'x86_64' },
    debian7:    { name: 'debian', family: 'debian', release: '7', arch: 'x86_64' },
    debian8:    { name: 'debian', family: 'debian', release: '8', arch: 'x86_64' },
    freebsd9:   { name: 'freebsd', family: 'freebsd', release: '9', arch: 'amd64' },
    freebsd10:  { name: 'freebsd', family: 'freebsd', release: '10', arch: 'amd64' },
    osx104:     { name: 'mac_os_x',family: 'darwin', release: '10.10.4', arch: nil },
    ubuntu1204: { name: 'ubuntu', family: 'debian', release: '12.04', arch: 'x86_64' },
    ubuntu1404: { name: 'ubuntu', family: 'debian', release: '14.04', arch: 'x86_64' },
    ubuntu1504: { name: 'ubuntu', family: 'debian', release: '15.04', arch: 'x86_64' },
    ubuntu1604: { name: 'ubuntu', family: 'debian', release: '16.04', arch: 'x86_64' },
    mint17:     { name: 'linuxmint', family: 'debian', release: '17.3', arch: 'x86_64' },
    mint18:     { name: 'linuxmint', family: 'debian', release: '18', arch: 'x86_64' },
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
    @backend = Inspec::Backend.create({ backend: :mock, verbose: true })
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
      '/etc/rabbitmq/rabbitmq.config' => mockfile.call('rabbitmq.config'),
      'kitchen.yml' => mockfile.call('kitchen.yml'),
      'example.csv' => mockfile.call('example.csv'),
      'policyfile.lock.json' => mockfile.call('policyfile.lock.json'),
      'nonexistent.json' => mockfile.call('nonexistent.json'),
      '/sys/class/net/br0/bridge' => mockdir.call(true),
      'rootwrap.conf' => mockfile.call('rootwrap.conf'),
      '/etc/apache2/apache2.conf' => mockfile.call('apache2.conf'),
      '/etc/apache2/ports.conf' => mockfile.call('ports.conf'),
      '/etc/httpd/conf/httpd.conf' => mockfile.call('httpd.conf'),
      '/etc/httpd/conf.d/ssl.conf' => mockfile.call('ssl.conf'),
      '/etc/httpd/mods-enabled/status.conf' => mockfile.call('status.conf'),
      '/etc/httpd/conf-enabled/security.conf' => mockfile.call('security.conf'),
      '/etc/apache2/conf-enabled/serve-cgi-bin.conf' => mockfile.call('serve-cgi-bin.conf'),
      '/etc/apache2/conf-enabled/security.conf' => mockfile.call('security.conf'),
      '/etc/nginx/failed.conf' => mockfile.call('nginx_failed.conf'),
      '/etc/nginx/nginx.conf' => mockfile.call('nginx.conf'),
      '/etc/nginx/proxy.conf' => mockfile.call('nginx_proxy.conf'),
      '/etc/nginx/conf/mime.types' => mockfile.call('nginx_mime.types'),
      '/etc/nginx/conf.d/foobar.conf' => mockfile.call('nginx_confd_foobar.conf'),
      '/etc/nginx/conf.d/multiple.conf' => mockfile.call('nginx_confd_multiple.conf'),
      '/etc/xinetd.conf' => mockfile.call('xinetd.conf'),
      '/etc/xinetd.d' => mockfile.call('xinetd.d'),
      '/etc/xinetd.d/chargen-stream' => mockfile.call('xinetd.d_chargen-stream'),
      '/etc/xinetd.d/chargen-dgram' => mockfile.call('xinetd.d_chargen-dgram'),
      '/etc/xinetd.d/echo' => mockfile.call('xinetd.d_echo'),
      '/etc/sysctl.conf' => mockfile.call('sysctl.conf'),
      '/etc/postgresql/9.4/main/postgresql.conf' => mockfile.call('postgresql.conf'),
      # Test certificate/key for x509_certificate using RSA keys in PEM format
      'test_certificate.rsa.crt.pem' => mockfile.call('test_certificate.rsa.crt.pem'),
      'test_certificate.rsa.key.pem' => mockfile.call('test_certificate.rsa.key.pem'),
      'test_ca_public.key.pem' => mockfile.call('test_ca_public.key.pem'),
      # Test DH parameters, 2048 bit long safe prime, generator 2 for dh_params in PEM format
      'dh_params.dh_pem' => mockfile.call('dh_params.dh_pem'),
      'default.toml' => mockfile.call('default.toml'),
      'default.xml' => mockfile.call('default.xml'),
      '/test/path/to/postgres/pg_hba.conf' => mockfile.call('pg_hba.conf'),
      '/etc/postgresql/9.5/main/pg_ident.conf' => mockfile.call('pg_ident.conf'),
      'C:/etc/postgresql/9.5/main/pg_ident.conf' => mockfile.call('pg_ident.conf'),
      '/etc/postgresql/9.5/main' => mockfile.call('9.5.main'),
      '/var/lib/postgresql/9.5/main' => mockfile.call('var.9.5.main'),
      '/etc/hosts' => mockfile.call('hosts'),
      'C:\windows\system32\drivers\etc\hosts' => mockfile.call('hosts'),
      '/etc/fstab' => mockfile.call('fstab'),
      'fstab_no_home' => mockfile.call('fstab_no_home'),
      'fstab_one_mount' => mockfile.call('fstab_one_mount'),
      '/etc/aide.conf' => mockfile.call('aide.conf'),
      '/var/lib/fake_rpmdb' => mockdir.call(true),
      '/var/lib/rpmdb_does_not_exist' => mockdir.call(false),
    }

    # create all mock commands
    cmd = lambda {|x|
      stdout = ::File.read(::File.join(scriptpath, '/unit/mock/cmd/'+x))
      mock.mock_command('', stdout, '', 0)
    }

    empty = lambda {
      mock.mock_command('', '', '', 0)
    }

    cmd_exit_1 = mock.mock_command('', '', '', 1)

    mock.commands = {
      'ps axo pid,pcpu,pmem,vsz,rss,tty,stat,start,time,user,command' => cmd.call('ps-axo'),
      'ps axo label,pid,pcpu,pmem,vsz,rss,tty,stat,start,time,user:32,command' => cmd.call('ps-axoZ'),
      'Get-Content win_secpol.cfg' => cmd.call('secedit-export'),
      'secedit /export /cfg win_secpol.cfg' => cmd.call('success'),
      'Remove-Item win_secpol.cfg' => cmd.call('success'),
      'env' => cmd.call('env'),
      '${Env:PATH}'  => cmd.call('$env-PATH'),
      # registry key test using winrm 2.0
      'bd15a11a4b07de0224c4d1ab16c49ad78dd6147650c6ef629152c7093a5ac95e' => cmd.call('reg_schedule'),
      'Auditpol /get /subcategory:\'User Account Management\' /r' => cmd.call('auditpol'),
      '/sbin/auditctl -l' => cmd.call('auditctl'),
      '/sbin/auditctl -s' => cmd.call('auditctl-s'),
      'yum -v repolist all'  => cmd.call('yum-repolist-all'),
      'dpkg -s curl' => cmd.call('dpkg-s-curl'),
      'dpkg -s held-package' => cmd.call('dpkg-s-held-package'),
      'rpm -qia curl' => cmd.call('rpm-qia-curl'),
      'rpm -qia --dbpath /var/lib/fake_rpmdb curl' => cmd.call('rpm-qia-curl'),
      'rpm -qia --dbpath /var/lib/rpmdb_does_not_exist curl' => cmd_exit_1,
      'pacman -Qi curl' => cmd.call('pacman-qi-curl'),
      'brew info --json=v1 curl' => cmd.call('brew-info--json-v1-curl'),
      '/usr/local/bin/brew info --json=v1 curl' => cmd.call('brew-info--json-v1-curl'),
      'gem list --local -a -q ^not-installed$' => cmd.call('gem-list-local-a-q-not-installed'),
      'gem list --local -a -q ^rubocop$' => cmd.call('gem-list-local-a-q-rubocop'),
      '/opt/ruby-2.3.1/embedded/bin/gem list --local -a -q ^pry$' => cmd.call('gem-list-local-a-q-pry'),
      '/opt/chef/embedded/bin/gem list --local -a -q ^chef-sugar$' => cmd.call('gem-list-local-a-q-chef-sugar'),
      'c:\opscode\chef\embedded\bin\gem.bat list --local -a -q ^json$' => cmd.call('gem-list-local-a-q-json'),
      '/opt/opscode/embedded/bin/gem list --local -a -q ^knife-backup$' => cmd.call('gem-list-local-a-q-knife-backup'),
      'npm ls -g --json bower' => cmd.call('npm-ls-g--json-bower'),
      'pip show jinja2' => cmd.call('pip-show-jinja2'),
      'pip show django' => cmd.call('pip-show-django'),
      '/test/path/pip show django' => cmd.call('pip-show-non-standard-django'),
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
      %{bash -c 'type "ss"'} => empty.call(), # allow the ss command to exist so the later mock is called
      'netstat -tulpen' => cmd.call('netstat-tulpen'),
      'ss -tulpen' => cmd.call('ss-tulpen'),
      # ports on freebsd
      'sockstat -46l' => cmd.call('sockstat'),
      # packages on windows
      '6785190b3df7291a7622b0b75b0217a9a78bd04690bc978df51ae17ec852a282' => cmd.call('get-item-property-package'),
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
      '27c6cda89fa5d196506251c0ed0d20468b378c5689711981dc1e1e683c7b02c1' => cmd.call('adsiusers'),
      # group info for windows
      'd8d5b3e3355650399e23857a526ee100b4e49e5c2404a0a5dbb7d85d7f4de5cc' => cmd.call('adsigroups'),
      # network interface
      'fddd70e8b8510f5fcc0413cfdc41598c55d6922bb2a0a4075e2118633a0bf422' => cmd.call('find-net-interface'),
      'c33821dece09c8b334e03a5bb9daefdf622007f73af4932605e758506584ec3f' => empty.call,
      'Get-NetAdapter | Select-Object -Property Name, InterfaceDescription, Status, State, MacAddress, LinkSpeed, ReceiveLinkSpeed, TransmitLinkSpeed, Virtual | ConvertTo-Json' => cmd.call('Get-NetAdapter'),
      # bridge on linux
      'ls -1 /sys/class/net/br0/brif/' => cmd.call('ls-sys-class-net-br'),
      # bridge on Windows
      'Get-NetAdapterBinding -ComponentID ms_bridge | Get-NetAdapter | Select-Object -Property Name, InterfaceDescription | ConvertTo-Json' => cmd.call('get-netadapter-binding-bridge'),
      # host for Windows
      'Resolve-DnsName –Type A microsoft.com | ConvertTo-Json' => cmd.call('Resolve-DnsName'),
      'Test-NetConnection -ComputerName microsoft.com -WarningAction SilentlyContinue| Select-Object -Property ComputerName, TcpTestSucceeded, PingSucceeded | ConvertTo-Json' => cmd.call('Test-NetConnection'),
      # host for Linux
      'getent ahosts example.com' => cmd.call('getent-ahosts-example.com'),
      'ping -w 1 -c 1 example.com' => cmd.call('ping-example.com'),
      # host for Darwin
      'host -t AAAA example.com' => cmd.call('host-AAAA-example.com'),
      'ping -W 1 -c 1 example.com' => cmd.call('ping-example.com'),
      # apt
      "find /etc/apt/ -name *.list -exec sh -c 'cat {} || echo -n' \\;" => cmd.call('etc-apt'),
      # iptables
      'iptables  -S' => cmd.call('iptables-s'),
      # apache_conf
      "sh -c 'find /etc/apache2/ports.conf -type f -maxdepth 1'" => cmd.call('find-apache2-ports-conf'),
      "sh -c 'find /etc/httpd/conf.d/*.conf -type f -maxdepth 1'" => cmd.call('find-httpd-ssl-conf'),
      "sh -c 'find /etc/httpd/mods-enabled/*.conf -type f -maxdepth 1'" => cmd.call('find-httpd-status-conf'),
      "sh -c 'find /etc/httpd/conf-enabled/*.conf -type l -maxdepth 1'" => cmd.call('find-httpd-conf-enabled-link'),
      "sh -c 'find /etc/apache2/conf-enabled/*.conf -type f -maxdepth 1'" => cmd.call('find-apache2-conf-enabled'),
      "sh -c 'find /etc/apache2/conf-enabled/*.conf -type l -maxdepth 1'" => cmd.call('find-apache2-conf-enabled-link'),
      "sh -c 'find /etc/nginx/nginx.conf'" => cmd.call('find-nginx-conf'),
      "sh -c 'find /etc/nginx/conf/mime.types'" => cmd.call('find-nginx-mime-types'),
      "sh -c 'find /etc/nginx/proxy.conf'" => cmd.call('find-nginx-proxy-conf'),
      "sh -c 'find /etc/nginx/conf.d/*.conf'" => cmd.call('find-nginx-confd-multiple-conf'),
      # mount
      "mount | grep -- ' on /'" => cmd.call("mount"),
      "mount | grep -- ' on /mnt/iso-disk'" => cmd.call("mount-multiple"),
      # solaris 10 package manager
      'pkginfo -l SUNWzfsr' => cmd.call('pkginfo-l-SUNWzfsr'),
      # solaris 11 package manager
      'pkg info system/file-system/zfs' => cmd.call('pkg-info-system-file-system-zfs'),
      # dpkg-query all packages
      "dpkg-query -W -f='${db:Status-Abbrev}  ${Package}  ${Version}\\n'" => cmd.call('dpkg-query-W'),
      # rpm query all packages
      "rpm -qa --queryformat '%{NAME}  %{VERSION}-%{RELEASE}\\n'" => cmd.call('rpm-qa-queryformat'),
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
      # windows_task doesnt exist
      "schtasks /query /v /fo csv /tn 'does-not-exist' | ConvertFrom-Csv | Select @{N='URI';E={$_.TaskName}},@{N='State';E={$_.Status.ToString()}},'Logon Mode','Last Result','Task To Run','Run As User','Scheduled Task State' | ConvertTo-Json -Compress"  => cmd.call('schtasks-error'),
      # windows_task exist
      "schtasks /query /v /fo csv /tn 'WeLovePizza' | ConvertFrom-Csv | Select @{N='URI';E={$_.TaskName}},@{N='State';E={$_.Status.ToString()}},'Logon Mode','Last Result','Task To Run','Run As User','Scheduled Task State' | ConvertTo-Json -Compress"  => cmd.call('schtasks-success'),
      'modinfo -F version dhcp' => cmd.call('modinfo-f-version-dhcp'),
      # crontab display for root / current user
      'crontab -l' => cmd.call('crontab-root'),
      # crontab display for non-current user
      'crontab -l -u foouser' => cmd.call('crontab-foouser'),
      # crontab display for special time strings
      'crontab -l -u special' => cmd.call('crontab-special'),
      # zfs output for dataset tank/tmp
      '/sbin/zfs get -Hp all tank/tmp' => cmd.call('zfs-get-all-tank-tmp'),
      # zfs output for pool tank
      '/sbin/zpool get -Hp all tank' => cmd.call('zpool-get-all-tank'),
      # docker
      "4f8e24022ea8b7d3b117041ec32e55d9bf08f11f4065c700e7c1dc606c84fd17" => cmd.call('docker-ps-a'),
      "docker version --format '{{ json . }}'"  => cmd.call('docker-version'),
      "docker info --format '{{ json . }}'" => cmd.call('docker-info'),
      "docker inspect 71b5df59442b" => cmd.call('docker-inspec'),
      # docker images
      "83c36bfade9375ae1feb91023cd1f7409b786fd992ad4013bf0f2259d33d6406" => cmd.call('docker-images'),
      # modprobe for kernel_module
      "modprobe --showconfig" => cmd.call('modprobe-config'),
      # get-process cmdlet for processes resource
      '$Proc = Get-Process -IncludeUserName | Where-Object {$_.Path -ne $null } | Select-Object PriorityClass,Id,CPU,PM,VirtualMemorySize,NPM,SessionId,Responding,StartTime,TotalProcessorTime,UserName,Path | ConvertTo-Csv -NoTypeInformation;$Proc.Replace("""","").Replace("`r`n","`n")' => cmd.call('get-process_processes'),
      # host resource: check to see if netcat is installed
      %{bash -c 'type "nc"'} => cmd.call('type-nc'),
      'type "nc"' => cmd.call('type-nc'),
      # host resource: netcat for TCP reachability check on linux
      'echo | nc -v -w 1 example.com 1234' => cmd.call('nc-example-com'),
      # host resource: netcat for TCP reachability check on darwin
      'nc -vz -G 1 example.com 1234' => cmd.call('nc-example-com'),
      # host resource: test-netconnection for reachability check on windows
      'Test-NetConnection -ComputerName microsoft.com -WarningAction SilentlyContinue -RemotePort 1234| Select-Object -Property ComputerName, TcpTestSucceeded, PingSucceeded | ConvertTo-Json' => cmd.call('Test-NetConnection'),
      # postgres tests
      %q(bash -c 'type "psql"') => cmd.call('bash -c type psql'),
      %q(psql --version | awk '{ print $NF }' | awk -F. '{ print $1"."$2 }') => cmd.call('psql-version'),
      # mssql tests
      "bash -c 'type \"sqlcmd\"'" => cmd.call('mssql-sqlcmd'),
      "4b550bb227058ac5851aa0bc946be794ee46489610f17842700136cf8bb5a0e9" => cmd.call('mssql-getdate'),
      "aeb859a4ae4288df230916075c0de28781a2b215f41d64ed1ea9c3fd633140fa" => cmd.call('mssql-result'),
      "5c2bc0f0568d11451d6cf83aff02ee3d47211265b52b6c5d45f8e57290b35082" => cmd.call('mssql-getdate'),
      # oracle
      "bash -c 'type \"sqlplus\"'" => cmd.call('oracle-cmd'),
      "ef04e5199abee80e662cc0dd1dd3bf3e0aaae9b4498217d241db00b413820911" => cmd.call('oracle-result'),
      # nginx mock cmd
      %{nginx -V 2>&1} => cmd.call('nginx-v'),
      %{/usr/sbin/nginx -V 2>&1} => cmd.call('nginx-v'),
      %{bash -c 'type "/usr/sbin/nginx"'} => cmd.call('bash-c-type-nginx'),
      # needed for two differnt inspec.command call formats
      # host resource: dig commands,
      'dig +short A example.com' => cmd.call('dig-A-example.com'),
      'dig +short AAAA example.com' => cmd.call('dig-AAAA-example.com'),
      'systemctl is-active sshd --quiet' => empty.call,
      'systemctl is-enabled sshd --quiet' => empty.call,
      'systemctl is-active dbus --quiet' => empty.call,
      'systemctl is-enabled dbus --quiet' => empty.call,
      '/path/to/systemctl is-active sshd --quiet' => empty.call,
      '/path/to/systemctl is-enabled sshd --quiet' => empty.call,
      '/usr/sbin/service sshd status' => empty.call,
      '/sbin/service sshd status' => empty.call,
      'type "lsof"' => empty.call,
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
    dst = "#{home}/mock/profiles/#{name}" unless (Pathname.new name).absolute?
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
