# encoding: utf-8
# author: Christoph Hartmann

# Usage:
#
# describe user('root') do
#   it { should exist }
#   its(:uid) { should eq 0 }
#   its(:gid) { should eq 0 }
#   its(:group) { should eq 'root' }
#   its(:groups) { should eq ['root', 'wheel']}
#   its(:home) { should eq '/root' }
#   its(:shell) { should eq '/bin/bash' }
#   its(:mindays) { should eq 0 }
#   its(:maxdays) { should eq 99 }
#   its(:warndays) { should eq 5 }
# end
#
# The following  Serverspec  matchers are deprecated in favor for direct value access
#
# describe user('root') do
#   it { should belong_to_group 'root' }
#   it { should have_uid 0 }
#   it { should have_home_directory '/root' }
#   it { should have_login_shell '/bin/bash' }
#   its(:minimum_days_between_password_change) { should eq 0 }
#   its(:maximum_days_between_password_change) { should eq 99 }
# end

# ServerSpec tests that are not supported:
#
# describe user('root') do
#   it { should have_authorized_key 'ssh-rsa ADg54...3434 user@example.local' }
#   its(:encrypted_password) { should eq 1234 }
# end

require 'utils/parser'

class User < Vulcano.resource(1)
  name 'user'

  def initialize(user)
    @user = user

    # select package manager
    @user_provider = nil
    case vulcano.os[:family]
    when 'ubuntu', 'debian', 'redhat', 'fedora', 'arch'
      @user_provider = LinuxUser.new(vulcano)
    when 'windows'
      @user_provider = WindowsUser.new(vulcano)
    when 'darwin'
      @user_provider = DarwinUser.new(vulcano)
    when 'freebsd'
      @user_provider = FreeBSDUser.new(vulcano)
    else
      return skip_resource 'The `package` resource is not supported on your OS yet.'
    end
  end

  def exists?
    !@user_provider.identity(@user).nil? && !@user_provider.identity(@user)[:user].nil?
  end

  def uid
    id = @user_provider.identity(@user)
    id.nil? ? nil : id[:uid]
  end

  def gid
    id = @user_provider.identity(@user)
    id.nil? ? nil : id[:gid]
  end

  def group
    id = @user_provider.identity(@user)
    id.nil? ? nil : id[:group]
  end

  def groups
    id = @user_provider.identity(@user)
    id.nil? ? nil : id[:groups]
  end

  def home
    meta = @user_provider.meta_info(@user)
    meta.nil? ? nil : meta[:home]
  end

  def shell
    meta = @user_provider.meta_info(@user)
    meta.nil? ? nil : meta[:shell]
  end

  # returns the minimum days between password changes
  def mindays
    nil
  end

  # returns the maximum days between password changes
  def maxdays
    nil
  end

  # returns the days for password change warning
  def warndays
    nil
  end

  # implement 'mindays' method to be compatible with serverspec
  def minimum_days_between_password_change
    deprecated('minimum_days_between_password_change', "Please use 'its(:mindays)'")
    mindays
  end

  # implement 'maxdays' method to be compatible with serverspec
  def maximum_days_between_password_change
    deprecated('maximum_days_between_password_change', "Please use 'its(:maxdays)'")
    maxdays
  end

  # implements rspec has matcher, to be compatible with serverspec
  # @see: https://github.com/rspec/rspec-expectations/blob/master/lib/rspec/matchers/built_in/has.rb
  def has_uid?(compare_uid)
    deprecated('has_uid?')
    uid == compare_uid
  end

  def has_home_directory?(compare_home)
    deprecated('has_home_directory?', "Please use 'its(:home)'")
    home == compare_home
  end

  def has_login_shell?(compare_shell)
    deprecated('has_login_shell?', "Please use 'its(:shell)'")
    shell == compare_shell
  end

  def has_authorized_key?(_compare_key)
    deprecated('has_authorized_key?')
    fail NotImplementedError
  end

  def deprecated(name, alternative = nil)
    warn "[DEPRECATION] #{name} is deprecated. #{alternative}"
  end

  def to_s
    "user #{@user}"
  end
end

class UserInfo
  def initialize(vulcano)
    @vulcano = vulcano
  end
end

# implements generic unix id handling
class UnixUser < UserInfo
  # parse one id entry like '0(wheel)''
  def parse_value(line)
    SimpleConfig.new(
      line,
      line_separator: ',',
      assignment_re: /^\s*([^\(]*?)\s*\(\s*(.*?)\)*$/,
      group_re: nil,
      multiple_values: false,
    ).params
  end

  # convert the value to an integer if we have numbers only
  # otherwise we return the string
  def convert_to_i(val)
    val = val.to_i if val.match(/^\d+$/)
    val
  end

  # extracts the identity
  def identity(username)
    # TODO: catch errors, where we do not get data
    cmd = @vulcano.run_command("id #{username}")
    return nil if cmd.exit_status != 0

    # parse words
    params = SimpleConfig.new(
      cmd.stdout.chomp,
      line_separator: ' ',
      assignment_re: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
      group_re: nil,
      multiple_values: false,
    ).params

    {
      uid: convert_to_i(parse_value(params['uid']).keys[0]),
      user: parse_value(params['uid']).values[0],
      gid: convert_to_i(parse_value(params['gid']).keys[0]),
      group: parse_value(params['gid']).values[0],
      groups: parse_value(params['groups']).values,
    }
  end
end

class LinuxUser < UnixUser
  include ContentParser

  def meta_info(username)
    cmd = @vulcano.run_command("getent passwd #{username}")
    return nil if cmd.exit_status != 0
    # returns: root:x:0:0:root:/root:/bin/bash
    passwd = parse_passwd_line(cmd.stdout.chomp)
    {
      home: passwd['home'],
      shell: passwd['shell'],
    }
  end
end

# we do not use 'finger' for MacOS, because it is harder to parse data with it
# @see https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/fingerd.8.html
# instead we use 'dscl' to request user data
# @see https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/dscl.1.html
# @see http://superuser.com/questions/592921/mac-osx-users-vs-dscl-command-to-list-user
class DarwinUser < UnixUser
  def meta_info(username)
    cmd = @vulcano.run_command("dscl -q . -read /Users/#{username} NFSHomeDirectory PrimaryGroupID RecordName UniqueID UserShell")
    return nil if cmd.exit_status != 0

    # TODO: catch cases where user does not exists
    params = SimpleConfig.new(
      cmd.stdout.chomp,
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      group_re: nil,
      multiple_values: false,
    ).params

    {
      home: params['NFSHomeDirectory'],
      shell: params['UserShell'],
    }
  end
end

# FreeBSD recommends to use the 'pw' command for user management
# @see: https://www.freebsd.org/doc/handbook/users-synopsis.html
# @see: https://www.freebsd.org/cgi/man.cgi?pw(8)
# It offers the following commands:
# - adduser(8)	The recommended command-line application for adding new users.
# - rmuser(8)	The recommended command-line application for removing users.
# - chpass(1)	A flexible tool for changing user database information.
# - passwd(1)	The command-line tool to change user passwords.
class FreeBSDUser < UnixUser
  include ContentParser

  def meta_info(username)
    cmd = @vulcano.run_command("pw #{username} -7")
    return nil if cmd.exit_status != 0
    # returns: root:*:0:0:Charlie &:/root:/bin/csh
    passwd = parse_passwd_line(cmd.stdout.chomp)
    {
      home: passwd['home'],
      shell: passwd['shell'],
    }
  end
end

# For now, we stick with WMI Win32_UserAccount
# @see https://msdn.microsoft.com/en-us/library/aa394507(v=vs.85).aspx
# @see https://msdn.microsoft.com/en-us/library/aa394153(v=vs.85).aspx
#
# using Get-AdUser would be the best command for domain machines, but it will not be installed
# on client machines by default
# @see https://technet.microsoft.com/en-us/library/ee617241.aspx
# @see https://technet.microsoft.com/en-us/library/hh509016(v=WS.10).aspx
# @see http://woshub.com/get-aduser-getting-active-directory-users-data-via-powershell/
# @see http://stackoverflow.com/questions/17548523/the-term-get-aduser-is-not-recognized-as-the-name-of-a-cmdlet
#
# Just for reference, we could also use ADSI (Active Directory Service Interfaces)
# @see https://mcpmag.com/articles/2015/04/15/reporting-on-local-accounts.aspx
class WindowsUser < UserInfo
  # parse windows account name
  def parse_windows_account(username)
    account = username.split('\\')
    name = account.pop
    domain = account.pop if account.size > 0
    [name, domain]
  end

  def identity(username)
    # extract domain/user information
    user, domain = parse_windows_account(username)

    # TODO: escape content
    if !domain.nil?
      filter = "Name = '#{user}' and Domain = '#{domain}'"
    else
      filter = "Name = '#{user}' and LocalAccount = true"
    end

    script = <<-EOH
      # find user
      $user = Get-WmiObject Win32_UserAccount -filter "#{filter}"
      # get related groups
      $groups = $user.GetRelated('Win32_Group') | Select-Object -Property Caption, Domain, Name, LocalAccount, SID, SIDType, Status
      # filter user information
      $user = $user | Select-Object -Property Caption, Description, Domain, Name, LocalAccount, Lockout, PasswordChangeable, PasswordExpires, PasswordRequired, SID, SIDType, Status
      # build response object
      New-Object -Type PSObject | `
      Add-Member -MemberType NoteProperty -Name User -Value ($user) -PassThru | `
      Add-Member -MemberType NoteProperty -Name Groups -Value ($groups) -PassThru | `
      ConvertTo-Json
    EOH

    # TODO: move to winrm backend
    require 'winrm'
    script = WinRM::PowershellScript.new(script)
    cmd = @vulcano.run_command("powershell -encodedCommand #{script.encoded}")

    # cannot rely on exit code for now, successful command returns exit code 1
    # return nil if cmd.exit_status != 0, try to parse json
    begin
      params = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      return @cache
    end

    user = params['User']['Caption'] unless params['User'].nil?
    groups = params['Groups'].map { |grp| grp['Caption'] } unless params['Groups'].nil?

    {
      uid: nil,
      user: user,
      gid: nil,
      group: nil,
      groups: groups,
    }
  end

  def meta_info(_username)
    {
      home: nil,
      shell: nil,
    }
  end
end
