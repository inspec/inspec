require "inspec/utils/parser"
require "inspec/utils/convert"
require "inspec/utils/filter"
require "inspec/utils/simpleconfig"
require "inspec/resources/powershell"
require "date"

module Inspec::Resources
  # This file contains two resources, the `user` and `users` resource.
  # The `user` resource is optimized for requests that verify specific users
  # that you know upfront for testing. If you need to query all users or search
  # specific users with certain properties, use the `users` resource.
  module UserManagementSelector
    # select user provider based on the operating system
    # returns nil, if no user manager was found for the operating system
    def select_user_manager(os)
      if os.linux?
        LinuxUser.new(inspec)
      elsif os.windows?
        WindowsUser.new(inspec)
      elsif ["darwin"].include?(os[:family])
        DarwinUser.new(inspec)
      elsif ["bsd"].include?(os[:family])
        FreeBSDUser.new(inspec)
      elsif ["aix"].include?(os[:family])
        AixUser.new(inspec)
      elsif os.solaris?
        SolarisUser.new(inspec)
      elsif ["hpux"].include?(os[:family])
        HpuxUser.new(inspec)
      end
    end
  end

  # The InSpec users resources looksup all local users available on a system.
  # TODO: the current version of the users resource will use eg. /etc/passwd
  # on Linux to parse all usernames. Therefore the resource may not return
  # users managed on other systems like LDAP/ActiveDirectory. Please open
  # a feature request at https://github.com/chef/inspec if you need that
  # functionality
  #
  # This resource allows complex filter mechanisms
  #
  # describe users.where(uid: 0).entries do
  #   it { should eq ['root'] }
  #   its('uids') { should eq [1234] }
  #   its('gids') { should eq [1234] }
  # end
  #
  # describe users.where { uid =~ /S\-1\-5\-21\-\d+\-\d+\-\d+\-500/ } do
  #   it { should exist }
  # end
  class Users < Inspec.resource(1)
    include UserManagementSelector

    name "users"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the users InSpec audit resource to test local user profiles. Users can be filtered by groups to which they belong, the frequency of required password changes, the directory paths to home and shell."
    example <<~EXAMPLE
      describe users.where { uid == 0 }.entries do
        it { should eq ['root'] }
        its('uids') { should eq [1234] }
        its('gids') { should eq [1234] }
      end
    EXAMPLE
    def initialize
      # select user provider
      @user_provider = select_user_manager(inspec.os)
      return skip_resource "The `users` resource is not supported on your OS yet." if @user_provider.nil?
    end

    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:usernames, field: :username)
      .register_column(:uids,      field: :uid)
      .register_column(:gids,      field: :gid)
      .register_column(:groupnames, field: :groupname)
      .register_column(:groups,    field: :groups)
      .register_column(:homes,     field: :home)
      .register_column(:shells,    field: :shell)
      .register_column(:mindays,   field: :mindays)
      .register_column(:maxdays,   field: :maxdays)
      .register_column(:warndays,  field: :warndays)
      .register_column(:disabled,  field: :disabled)
      .register_custom_matcher(:disabled?) { |x| x.where { disabled == false }.entries.empty? }
      .register_custom_matcher(:enabled?) { |x| x.where { disabled == true }.entries.empty? }
    filter.install_filter_methods_on_resource(self, :collect_user_details)

    def to_s
      "Users"
    end

    private

    # method to get all available users
    def list_users
      @username_cache ||= @user_provider.list_users unless @user_provider.nil?
    end

    # collects information about every user
    def collect_user_details
      @users_cache ||= @user_provider.collect_user_details unless @user_provider.nil?
    end
  end

  # The `user` resource handles the special case where only one resource is required
  #
  # describe user('root') do
  #   it { should exist }
  #   its('uid') { should eq 0 }
  #   its('gid') { should eq 0 }
  #   its('group') { should eq 'root' }
  #   its('groups') { should eq ['root', 'wheel']}
  #   its('home') { should eq '/root' }
  #   its('shell') { should eq '/bin/bash' }
  #   its('mindays') { should eq 0 }
  #   its('maxdays') { should eq 99 }
  #   its('warndays') { should eq 5 }
  #   its('passwordage') { should be >= 0 }
  #   its('maxbadpasswords') { should eq nil } // not yet supported on linux
  #   its('badpasswordattempts') { should eq 0 }
  # end
  # describe user('Administrator') do
  #   it { should exist }
  #   its('uid') { should eq "S-1-5-21-1759981009-4135989804-1844563890-500" }
  #   its('gid') { should eq nil } // not supported on Windows
  #   its('group') { should eq nil } // not supported on Windows
  #   its('groups') { should eq ['Administrators', 'Users']}
  #   its('home') { should eq '' }
  #   its('shell') { should eq nil } // not supported on Windows
  #   its('mindays') { should eq 0 }
  #   its('maxdays') { should eq 42 }
  #   its('warndays') { should eq nil }
  #   its('passwordage') { should eq 355 }
  #   its('maxbadpasswords') { should eq 0 }
  #   its('badpasswordattempts') { should eq 0 }
  # end
  #
  # The following  Serverspec  matchers were deprecated in favor for direct value access
  # but are made available as part of Serverspec compatibility in March, 2022.
  #
  # describe user('root') do
  #   it { should belong_to_group 'root' }
  #   it { should belong_to_primary_group 'root' }
  #   it { should have_uid 0 }
  #   it { should have_home_directory '/root' }
  #   it { should have_login_shell '/bin/bash' }
  #   its('minimum_days_between_password_change') { should eq 0 }
  #   its('maximum_days_between_password_change') { should eq 99 }
  #   it { should have_authorized_key 'ssh-rsa ADg54...3434 user@example.local' }
  #   its(:encrypted_password) { should eq 1234 }
  # end
  class User < Inspec.resource(1)
    include UserManagementSelector
    name "user"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the user InSpec audit resource to test user profiles, including the groups to which they belong, the frequency of required password changes, the directory paths to home and shell."
    example <<~EXAMPLE
      describe user('root') do
        it { should exist }
        its('uid') { should eq 1234 }
        its('gid') { should eq 1234 }
      end
    EXAMPLE
    def initialize(username = nil)
      @username = username
      # select user provider
      @user_provider = select_user_manager(inspec.os)
      return skip_resource "The `user` resource is not supported on your OS yet." if @user_provider.nil?
    end

    def exists?
      !identity.nil? && !identity[:username].nil?
    end

    def disabled?
      identity[:disabled] == true unless identity.nil?
    end

    def enabled?
      identity[:disabled] == false unless identity.nil?
    end

    def username
      identity[:username] unless identity.nil?
    end

    def uid
      identity[:uid] unless identity.nil?
    end

    def gid
      identity[:gid] unless identity.nil?
    end

    def groupname
      identity[:groupname] unless identity.nil?
    end
    alias group groupname

    def groups
      unless identity.nil?
        inspec.os.windows? ? UserGroups.new(identity[:groups]) : identity[:groups]
      end
    end

    def home
      meta_info[:home] unless meta_info.nil?
    end

    def shell
      meta_info[:shell] unless meta_info.nil?
    end

    def domain
      meta_info[:domain] unless meta_info.nil?
    end

    def userflags
      meta_info[:userflags] unless meta_info.nil?
    end

    def lastlogin
      meta_info[:lastlogin] unless meta_info.nil?
    end

    # returns the minimum days between password changes
    def mindays
      credentials[:mindays] unless credentials.nil?
    end

    # returns the maximum days between password changes
    def maxdays
      credentials[:maxdays] unless credentials.nil?
    end

    # returns the days for password change warning
    def warndays
      credentials[:warndays] unless credentials.nil?
    end

    def badpasswordattempts
      credentials[:badpasswordattempts] unless credentials.nil?
    end

    def maxbadpasswords
      credentials[:maxbadpasswords] unless credentials.nil?
    end

    def passwordage
      credentials[:passwordage] unless credentials.nil?
    end

    # implement 'mindays' method to be compatible with serverspec
    def minimum_days_between_password_change
      mindays
    end

    # implement 'maxdays' method to be compatible with serverspec
    def maximum_days_between_password_change
      maxdays
    end

    # implements rspec has matcher, to be compatible with serverspec
    # @see: https://github.com/rspec/rspec-expectations/blob/master/lib/rspec/matchers/built_in/has.rb
    # has_uid matcher: compatibility with serverspec
    def has_uid?(compare_uid)
      uid == compare_uid
    end

    # has_home_directory matcher: compatibility with serverspec
    def has_home_directory?(compare_home)
      home == compare_home
    end

    # has_login_shell matcher: compatibility with serverspec
    def has_login_shell?(compare_shell)
      shell == compare_shell
    end

    # has_authorized_key matcher: compatibility with serverspec
    def has_authorized_key?(compare_key)
      # get_authorized_keys returns the list of key, check if given key is included.
      get_authorized_keys.include?(compare_key)
    end

    # belongs_to_primary_group matcher: compatibility with serverspec
    def belongs_to_primary_group?(group_name)
      groupname == group_name
    end

    # belongs_to_group matcher: compatibility with serverspec
    def belongs_to_group?(group_name)
      groups.include?(group_name)
    end

    # encrypted_password property: compatibility with serverspec
    # it allows to run test against the hashed passwords of the given user
    # applicable for unix/linux systems with getent utility.
    def encrypted_password
      raise Inspec::Exceptions::ResourceSkipped, "encrypted_password property is not applicable for your system" if inspec.os.windows? || inspec.os.darwin?

      # shadow_information returns array of the information from the shadow file
      # the value at 1st index is the encrypted_password information
      shadow_information[1]
    end

    def resource_id
      @username || "User"
    end

    def to_s
      "User #{@username}"
    end

    private

    # returns the iden
    def identity
      return @id_cache if defined?(@id_cache)

      @id_cache = @user_provider.identity(@username) unless @user_provider.nil?
    end

    def meta_info
      return @meta_cache if defined?(@meta_cache)

      @meta_cache = @user_provider.meta_info(@username) unless @user_provider.nil?
    end

    def credentials
      return @cred_cache if defined?(@cred_cache)

      @cred_cache = @user_provider.credentials(@username) unless @user_provider.nil?
    end

    # helper method for has_authorized_key matcher
    # get_authorized_keys return the key/keys stored in the authorized_keys path
    def get_authorized_keys
      # cat is used in unix system to display content of file; similarly type is used for windows
      bin = inspec.os.windows? ? "type" : "cat"

      # auth_path gets assigned with the valid path for authorized_keys
      auth_path = ""

      # possible paths where authorized_keys are stored
      # inspec.command is used over inspec.file because inspec.file requires absolute path
      %w{~/.ssh/authorized_keys ~/.ssh/authorized_keys2}.each do |path|
        if inspec.command("#{bin} #{path}").exit_status == 0
          auth_path = path
          break
        end
      end

      # if auth_path is empty, no valid path was found, hence raise exception
      raise Inspec::Exceptions::ResourceSkipped, "Can't find any valid path for authorized_keys" if auth_path.empty?

      # authorized_keys are obtained in the standard output;
      # split keys on newline if more than one keys are part of authorized_keys
      inspec.command("#{bin} #{auth_path}").stdout.split("\n").map(&:strip)
    end

    # Helper method for encrypted_password property
    def shadow_information
      # check if getent is available on the system
      bin = find_getent_utility

      # fetch details of the passwd file for the current user using getent
      cmd = inspec.command("#{bin} shadow #{@username}")
      raise Inspec::Exceptions::ResourceFailed, "Executing #{bin} shadow #{@username} failed: #{cmd.stderr}" if cmd.exit_status.to_i != 0

      # shadow information are : separated values, split and return
      cmd.stdout.split(":").map(&:strip)
    end

    # check if getent exist in the system
    def find_getent_utility
      %w{/usr/bin/getent /bin/getent getent}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `getent` on your system."
    end
  end

  # Class defined to compare for groups without case-sensitivity
  class UserGroups < Array
    def initialize(user_groups)
      @user_groups = user_groups
      super
    end

    def include?(group)
      !(@user_groups.select { |user_group| user_group.casecmp?(group) }.empty?)
    end
  end

  # This is an abstract class that every user provoider has to implement.
  # A user provider implements a system abstracts and helps the InSpec resource
  # hand-over system specific behavior to those providers
  class UserInfo
    include Converter

    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end

    # returns a hash with user-specific values:
    # {
    #   uid: '',
    #   user: '',
    #   gid: '',
    #   group: '',
    #   groups: '',
    # }
    def identity(_username)
      raise "user provider must implement the `identity` method"
    end

    # returns optional information about a user, eg shell
    def meta_info(_username)
      nil
    end

    # returns a hash with meta-data about user credentials
    # {
    #   mindays: 1,
    #   maxdays: 1,
    #   warndays: 1,
    # }
    # this method is optional and may not be implemented by each provider
    def credentials(_username)
      nil
    end

    # returns an array with users
    def list_users
      raise "user provider must implement the `list_users` method"
    end

    # retuns all aspects of the user as one hash
    def user_details(username)
      item = {}
      id = identity(username)
      item.merge!(id) unless id.nil?
      meta = meta_info(username)
      item.merge!(meta) unless meta.nil?
      cred = credentials(username)
      item.merge!(cred) unless cred.nil?
      item
    end

    # returns the full information list for a user
    def collect_user_details
      list_users.map do |username|
        user_details(username.chomp)
      end
    end
  end

  # implements generic unix id handling
  class UnixUser < UserInfo
    attr_reader :inspec, :id_cmd, :list_users_cmd
    def initialize(inspec)
      @inspec = inspec
      @id_cmd ||= "id"
      @list_users_cmd ||= 'cut -d: -f1 /etc/passwd | grep -v "^#"'
      super
    end

    # returns a list of all local users on a system
    def list_users
      cmd = inspec.command(list_users_cmd)
      return [] if cmd.exit_status != 0

      cmd.stdout.chomp.lines
    end

    # parse one id entry like '0(wheel)''
    def parse_value(line)
      SimpleConfig.new(
        line,
        line_separator: ",",
        assignment_regex: /^\s*([^\(]*?)\s*\(\s*(.*?)\)*$/,
        group_re: nil,
        multiple_values: false
      ).params
    end

    # extracts the identity
    def identity(username)
      cmd = inspec.command("#{id_cmd} #{username}")
      return nil if cmd.exit_status != 0

      # parse words
      params = SimpleConfig.new(
        parse_id_entries(cmd.stdout.chomp),
        assignment_regex: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
        group_re: nil,
        multiple_values: false
      ).params

      {
        uid: convert_to_i(parse_value(params["uid"]).keys[0]),
        username: parse_value(params["uid"]).values[0],
        gid: convert_to_i(parse_value(params["gid"]).keys[0]),
        groupname: parse_value(params["gid"]).values[0],
        groups: parse_value(params["groups"]).values,
      }
    end

    # splits the results of id into seperate lines
    def parse_id_entries(raw)
      data = []
      until (index = raw.index(/\)\s{1}/)).nil?
        data.push(raw[0, index + 1]) # inclue closing )
        raw = raw[index + 2, raw.length - index - 2]
      end
      data.push(raw) unless raw.nil?
      data.join("\n")
    end
  end

  class LinuxUser < UnixUser
    include Inspec::Utils::PasswdParser
    include Inspec::Utils::CommentParser

    def meta_info(username)
      cmd = inspec.command("getent passwd #{username}")
      return nil if cmd.exit_status != 0

      # returns: root:x:0:0:root:/root:/bin/bash
      passwd = parse_passwd_line(cmd.stdout.chomp)
      {
        home: passwd["home"],
        shell: passwd["shell"],
      }
    end

    def credentials(username)
      cmd = inspec.command("chage -l #{username}")
      return nil if cmd.exit_status != 0

      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        group_re: nil,
        multiple_values: false
      ).params

      last_change = params["Last password change"]
      dparse = Date.parse "#{last_change}" rescue nil
      dayslastset = (Date.today - dparse).to_i if dparse
      cmd = inspec.command("lastb -w -a | grep #{username} | wc -l")
      badpasswordattempts = convert_to_i(cmd.stdout.chomp) if cmd.exit_status == 0

      {
        mindays: convert_to_i(params["Minimum number of days between password change"]),
        maxdays: convert_to_i(params["Maximum number of days between password change"]),
        warndays: convert_to_i(params["Number of days of warning before password expires"]),
        passwordage: dayslastset,
        badpasswordattempts: badpasswordattempts,
      }
    end
  end

  class SolarisUser < LinuxUser
    def initialize(inspec)
      @inspec = inspec
      @id_cmd ||= "id -a"
      super
    end
  end

  class AixUser < UnixUser
    def identity(username)
      id = super(username)
      return nil if id.nil?

      # AIX 'id' command doesn't include the primary group in the supplementary
      # yet it can be somewhere in the supplementary list if someone added root
      # to a groups list in /etc/group
      # we rearrange to expected list if that is the case
      if id[:groups].first != id[:group]
        id[:groups].reject! { |i| i == id[:group] } if id[:groups].include?(id[:group])
        id[:groups].unshift(id[:group])
      end

      id
    end

    def meta_info(username)
      lsuser = inspec.command("lsuser -C -a home shell #{username}")
      return nil if lsuser.exit_status != 0

      user = lsuser.stdout.chomp.split("\n").last.split(":")
      {
        home: user[1],
        shell: user[2],
      }
    end

    def credentials(username)
      cmd = inspec.command(
        "lssec -c -f /etc/security/user -s #{username} -a minage -a maxage -a pwdwarntime"
      )
      return nil if cmd.exit_status != 0

      user_sec = cmd.stdout.chomp.split("\n").last.split(":")

      {
        mindays: user_sec[1].to_i * 7,
        maxdays: user_sec[2].to_i * 7,
        warndays: user_sec[3].to_i,
        passwordage: nil,
        badpasswordattempts: nil,
      }
    end
  end

  class HpuxUser < UnixUser
    def meta_info(username)
      hpuxuser = inspec.command("logins -x -l #{username}")
      return nil if hpuxuser.exit_status != 0

      user = hpuxuser.stdout.chomp.split(" ")
      {
        home: user[4],
        shell: user[5],
      }
    end
  end

  # we do not use 'finger' for MacOS, because it is harder to parse data with it
  # @see https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/fingerd.8.html
  # instead we use 'dscl' to request user data
  # @see https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/dscl.1.html
  # @see http://superuser.com/questions/592921/mac-osx-users-vs-dscl-command-to-list-user
  class DarwinUser < UnixUser
    def initialize(inspec)
      @list_users_cmd ||= "dscl . list /Users"
      super
    end

    def meta_info(username)
      cmd = inspec.command("dscl -q . -read /Users/#{username} NFSHomeDirectory PrimaryGroupID RecordName UniqueID UserShell")
      return nil if cmd.exit_status != 0

      params = SimpleConfig.new(
        cmd.stdout.chomp,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        group_re: nil,
        multiple_values: false
      ).params

      {
        home: params["NFSHomeDirectory"],
        shell: params["UserShell"],
      }
    end
  end

  # FreeBSD recommends to use the 'pw' command for user management
  # @see: https://www.freebsd.org/doc/handbook/users-synopsis.html
  # @see: https://www.freebsd.org/cgi/man.cgi?pw(8)
  # It offers the following commands:
  # - adduser(8) The recommended command-line application for adding new users.
  # - rmuser(8)  The recommended command-line application for removing users.
  # - chpass(1)  A flexible tool for changing user database information.
  # - passwd(1)  The command-line tool to change user passwords.
  class FreeBSDUser < UnixUser
    include Inspec::Utils::PasswdParser

    def meta_info(username)
      cmd = inspec.command("pw usershow #{username} -7")
      return nil if cmd.exit_status != 0

      # returns: root:*:0:0:Charlie &:/root:/bin/csh
      passwd = parse_passwd_line(cmd.stdout.chomp)
      {
        home: passwd["home"],
        shell: passwd["shell"],
      }
    end
  end

  # This optimization was inspired by
  # @see https://mcpmag.com/articles/2015/04/15/reporting-on-local-accounts.aspx
  # Alternative solutions are WMI Win32_UserAccount
  # @see https://msdn.microsoft.com/en-us/library/aa394507(v=vs.85).aspx
  # @see https://msdn.microsoft.com/en-us/library/aa394153(v=vs.85).aspx
  class WindowsUser < UserInfo
    def parse_windows_account(username)
      account = username.split("\\")
      name = account.pop
      domain = account.pop unless account.empty?
      [name, domain]
    end

    def identity(username)
      # TODO: we look for local users only at this point
      name, _domain = parse_windows_account(username)
      return if collect_user_details.nil?

      res = collect_user_details.select { |user| user[:username].casecmp? name }
      res[0] unless res.empty?
    end

    def meta_info(username)
      res = identity(username)

      return if res.nil?

      {
        home: res[:home],
        shell: res[:shell],
        domain: res[:domain],
        userflags: res[:userflags],
        lastlogin: res[:lastlogin],
      }
    end

    def credentials(username)
      res = identity(username)

      return if res.nil?

      {
        mindays: res[:mindays],
        maxdays: res[:maxdays],
        warndays: res[:warndays],
        badpasswordattempts: res[:badpasswordattempts],
        maxbadpasswords: res[:maxbadpasswords],
        minpasswordlength: res[:minpasswordlength],
        passwordage: res[:passwordage],
      }
    end

    def list_users
      collect_user_details.map { |user| user[:username] }
    end

    # https://msdn.microsoft.com/en-us/library/aa746340(v=vs.85).aspx
    def collect_user_details # rubocop:disable Metrics/MethodLength
      return @users_cache if defined?(@users_cache)

      script = <<~EOH
        Function ConvertTo-SID { Param([byte[]]$BinarySID)
          (New-Object System.Security.Principal.SecurityIdentifier($BinarySID,0)).Value
        }

        Function Convert-UserFlag { Param  ($UserFlag)
          $List = @()
          Switch ($UserFlag) {
            ($UserFlag -BOR 0x0001) { $List += 'SCRIPT' }
            ($UserFlag -BOR 0x0002) { $List += 'ACCOUNTDISABLE' }
            ($UserFlag -BOR 0x0008) { $List += 'HOMEDIR_REQUIRED' }
            ($UserFlag -BOR 0x0010) { $List += 'LOCKOUT' }
            ($UserFlag -BOR 0x0020) { $List += 'PASSWD_NOTREQD' }
            ($UserFlag -BOR 0x0040) { $List += 'PASSWD_CANT_CHANGE' }
            ($UserFlag -BOR 0x0080) { $List += 'ENCRYPTED_TEXT_PWD_ALLOWED' }
            ($UserFlag -BOR 0x0100) { $List += 'TEMP_DUPLICATE_ACCOUNT' }
            ($UserFlag -BOR 0x0200) { $List += 'NORMAL_ACCOUNT' }
            ($UserFlag -BOR 0x0800) { $List += 'INTERDOMAIN_TRUST_ACCOUNT' }
            ($UserFlag -BOR 0x1000) { $List += 'WORKSTATION_TRUST_ACCOUNT' }
            ($UserFlag -BOR 0x2000) { $List += 'SERVER_TRUST_ACCOUNT' }
            ($UserFlag -BOR 0x10000) { $List += 'DONT_EXPIRE_PASSWORD' }
            ($UserFlag -BOR 0x20000) { $List += 'MNS_LOGON_ACCOUNT' }
            ($UserFlag -BOR 0x40000) { $List += 'SMARTCARD_REQUIRED' }
            ($UserFlag -BOR 0x80000) { $List += 'TRUSTED_FOR_DELEGATION' }
            ($UserFlag -BOR 0x100000) { $List += 'NOT_DELEGATED' }
            ($UserFlag -BOR 0x200000) { $List += 'USE_DES_KEY_ONLY' }
            ($UserFlag -BOR 0x400000) { $List += 'DONT_REQ_PREAUTH' }
            ($UserFlag -BOR 0x800000) { $List += 'PASSWORD_EXPIRED' }
            ($UserFlag -BOR 0x1000000) { $List += 'TRUSTED_TO_AUTH_FOR_DELEGATION' }
            ($UserFlag -BOR 0x04000000) { $List += 'PARTIAL_SECRETS_ACCOUNT' }
          }
          $List
        }

        $Computername = $Env:Computername
        $adsi = [ADSI]"WinNT://$Computername"
        $adsi.Children | where {$_.SchemaClassName -eq 'user'} | ForEach {
          New-Object PSObject -property @{
            uid = ConvertTo-SID -BinarySID $_.ObjectSID[0]
            username = $_.Name[0]
            description = $_.Description[0]
            disabled = $_.AccountDisabled[0]
            userflags = Convert-UserFlag  -UserFlag $_.UserFlags[0]
            passwordage = [math]::Round($_.PasswordAge[0]/86400)
            minpasswordlength = $_.MinPasswordLength[0]
            mindays = [math]::Round($_.MinPasswordAge[0]/86400)
            maxdays = [math]::Round($_.MaxPasswordAge[0]/86400)
            warndays = $null
            badpasswordattempts = $_.BadPasswordAttempts[0]
            maxbadpasswords = $_.MaxBadPasswordsAllowed[0]
            gid = $null
            group = $null
            groups = @($_.Groups() | Foreach-Object { $_.GetType().InvokeMember('Name', 'GetProperty', $null, $_, $null) })
            home = $_.HomeDirectory[0]
            shell = $null
            domain = $Computername
            lastlogin = if($_.lastlogin.getType().Tostring() -eq "System.Management.Automation.PSMethod" ){ $null }else{[String]$_.lastlogin}
          }
        } | ConvertTo-Json
      EOH
      cmd = inspec.powershell(script)
      # cannot rely on exit code for now, successful command returns exit code 1
      # return nil if cmd.exit_status != 0, try to parse json
      begin
        users = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      # ensure we have an array of groups
      users = [users] unless users.is_a?(Array)
      # convert keys to symbols
      @users_cache = users.map { |user| user.each_with_object({}) { |(k, v), h| h[k.to_sym] = v } }
    end
  end
end
