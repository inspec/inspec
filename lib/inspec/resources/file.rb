# copyright: 2015, Vulcano Security GmbH

require 'shellwords'

module Inspec::Resources
  module FilePermissionsSelector
    def select_file_perms_style(os)
      if os.unix?
        UnixFilePermissions.new(inspec)
      elsif os.windows?
        WindowsFilePermissions.new(inspec)
      end
    end
  end

  class FileResource < Inspec.resource(1)
    include FilePermissionsSelector
    include LinuxMountParser

    name 'file'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the file InSpec audit resource to test all system file types, including files, directories, symbolic links, named pipes, sockets, character devices, block devices, and doors.'
    example <<~EXAMPLE
      describe file('path') do
        it { should exist }
        it { should be_file }
        it { should be_readable }
        it { should be_writable }
        it { should be_executable.by_user('root') }
        it { should be_owned_by 'root' }
        its('mode') { should cmp '0644' }
      end
    EXAMPLE

    attr_reader :file, :mount_options
    def initialize(path)
      # select permissions style
      @perms_provider = select_file_perms_style(inspec.os)
      @file = inspec.backend.file(path)
    end

    %w{
      type exist? file? block_device? character_device? socket? directory?
      symlink? pipe? mode mode? owner owned_by? group grouped_into?
      link_path shallow_link_path linked_to? mtime size selinux_label immutable?
      product_version file_version version? md5sum sha256sum
      path basename source source_path uid gid
    }.each do |m|
      define_method m do |*args|
        file.send(m, *args)
      end
    end

    def content
      res = file.content
      return nil if res.nil?
      res.force_encoding('utf-8')
    end

    def contain(*_)
      raise 'Contain is not supported. Please use standard RSpec matchers.'
    end

    def readable?(by_usergroup, by_specific_user)
      return false unless exist?
      return skip_resource '`readable?` is not supported on your OS yet.' if @perms_provider.nil?

      file_permission_granted?('read', by_usergroup, by_specific_user)
    end

    def writable?(by_usergroup, by_specific_user)
      return false unless exist?
      return skip_resource '`writable?` is not supported on your OS yet.' if @perms_provider.nil?

      file_permission_granted?('write', by_usergroup, by_specific_user)
    end

    def executable?(by_usergroup, by_specific_user)
      return false unless exist?
      return skip_resource '`executable?` is not supported on your OS yet.' if @perms_provider.nil?

      file_permission_granted?('execute', by_usergroup, by_specific_user)
    end

    def allowed?(permission, opts = {})
      return false unless exist?
      return skip_resource '`allowed?` is not supported on your OS yet.' if @perms_provider.nil?

      file_permission_granted?(permission, opts[:by], opts[:by_user])
    end

    def mounted?(expected_options = nil, identical = false)
      mounted = file.mounted

      # return if no additional parameters have been provided
      return file.mounted? if expected_options.nil?

      # deprecation warning, this functionality will be removed in future version
      Inspec.deprecate(:file_resource_be_mounted_matchers, 'The file resource `be_mounted.with` and `be_mounted.only_with` matchers are deprecated. Please use the `mount` resource instead')

      # we cannot read mount data on non-Linux systems
      return nil if !inspec.os.linux?

      # parse content if we are on linux
      @mount_options ||= parse_mount_options(mounted.stdout, true)

      if identical
        # check if the options should be identical
        @mount_options == expected_options
      else
        # otherwise compare the selected values
        @mount_options.contains(expected_options)
      end
    end

    def suid
      (mode & 04000) > 0
    end

    alias setuid? suid

    def sgid
      (mode & 02000) > 0
    end

    alias setgid? sgid

    def sticky
      (mode & 01000) > 0
    end

    alias sticky? sticky

    def more_permissive_than?(max_mode = nil)
      raise Inspec::Exceptions::ResourceFailed, 'The file' + file.path + 'doesn\'t seem to exist' unless exist?
      raise ArgumentError, 'You must proivde a value for the `maximum allowable permission` for the file.' if max_mode.nil?
      raise ArgumentError, 'You must proivde the `maximum permission target` as a `String`, you provided: ' + max_mode.class.to_s unless max_mode.is_a?(String)
      raise ArgumentError, 'The value of the `maximum permission target` should be a valid file mode in 4-ditgit octal format: for example, `0644` or `0777`' unless /(0)?([0-7])([0-7])([0-7])/.match?(max_mode)

      # Using the files mode and a few bit-wise calculations we can ensure a
      # file is no more permisive than desired.
      #
      # 1. Calculate the inverse of the desired mode (e.g., 0644) by XOR it with
      # 0777 (all 1s). We are interested in the bits that are currently 0 since
      # it indicates that the actual mode is more permissive than the desired mode.
      # Conversely, we dont care about the bits that are currently 1 because they
      # cannot be any more permissive and we can safely ignore them.
      #
      # 2. Calculate the above result of ANDing the actual mode and the inverse
      # mode. This will determine if any of the bits that would indicate a more
      # permissive mode are set in the actual mode.
      #
      # 3. If the result is 0000, the files mode is equal
      # to or less permissive than the desired mode (PASS). Otherwise, the files
      # mode is more permissive than the desired mode (FAIL).

      max_mode = max_mode.to_i(8)
      inv_mode = 0777 ^ max_mode

      inv_mode & file.mode != 0
    end

    def to_s
      "File #{source_path}"
    end

    private

    def file_permission_granted?(access_type, by_usergroup, by_specific_user)
      raise '`file_permission_granted?` is not supported on your OS' if @perms_provider.nil?
      if by_specific_user.nil? || by_specific_user.empty?
        @perms_provider.check_file_permission_by_mask(file, access_type, by_usergroup, by_specific_user)
      else
        @perms_provider.check_file_permission_by_user(access_type, by_specific_user, source_path)
      end
    end
  end

  class FilePermissions
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  class UnixFilePermissions < FilePermissions
    def permission_flag(access_type)
      case access_type
      when 'read'
        'r'
      when 'write'
        'w'
      when 'execute'
        'x'
      else
        raise 'Invalid access_type provided'
      end
    end

    def usergroup_for(usergroup, specific_user)
      if usergroup == 'others'
        'other'
      elsif (usergroup.nil? || usergroup.empty?) && specific_user.nil?
        'all'
      else
        usergroup
      end
    end

    def check_file_permission_by_mask(file, access_type, usergroup, specific_user)
      usergroup = usergroup_for(usergroup, specific_user)
      flag = permission_flag(access_type)
      mask = file.unix_mode_mask(usergroup, flag)
      raise 'Invalid usergroup/owner provided' if mask.nil?
      (file.mode & mask) != 0
    end

    def check_file_permission_by_user(access_type, user, path)
      flag = permission_flag(access_type)
      if inspec.os.linux?
        perm_cmd = "su -s /bin/sh -c \"test -#{flag} #{path}\" #{user}"
      elsif inspec.os.bsd? || inspec.os.solaris?
        perm_cmd = "sudo -u #{user} test -#{flag} #{path}"
      elsif inspec.os.aix?
        perm_cmd = "su #{user} -c test -#{flag} #{path}"
      elsif inspec.os.hpux?
        perm_cmd = "su #{user} -c \"test -#{flag} #{path}\""
      else
        return skip_resource 'The `file` resource does not support `by_user` on your OS.'
      end

      cmd = inspec.command(perm_cmd)
      cmd.exit_status == 0 ? true : false
    end
  end

  class WindowsFilePermissions < FilePermissions
    def check_file_permission_by_mask(_file, _access_type, _usergroup, _specific_user)
      raise '`check_file_permission_by_mask` is not supported on Windows'
    end

    def more_permissive_than?(*)
      raise Inspec::Exceptions::ResourceSkipped, 'The `more_permissive_than?` matcher is not supported on your OS yet.'
    end

    def check_file_permission_by_user(access_type, user, path)
      access_rule = translate_perm_names(access_type)
      access_rule = convert_to_powershell_array(access_rule)

      cmd = inspec.command("@(@((Get-Acl '#{path}').access | Where-Object {$_.AccessControlType -eq 'Allow' -and $_.IdentityReference -eq '#{user}' }) | Where-Object {($_.FileSystemRights.ToString().Split(',') | % {$_.trim()} | ? {#{access_rule} -contains $_}) -ne $null}) | measure | % { $_.Count }")
      cmd.stdout.chomp == '0' ? false : true
    end

    private

    def convert_to_powershell_array(arr)
      if arr.empty?
        '@()'
      else
        %{@('#{arr.join("', '")}')}
      end
    end

    # Translates a developer-friendly string into a list of acceptable
    # FileSystemRights that match it, because Windows has a fun heirarchy
    # of permissions that are able to be noted in multiple ways.
    #
    # See also: https://www.codeproject.com/Reference/871338/AccessControl-FileSystemRights-Permissions-Table
    def translate_perm_names(access_type)
      names = translate_common_perms(access_type)
      names ||= translate_granular_perms(access_type)
      names ||= translate_uncommon_perms(access_type)
      raise 'Invalid access_type provided' unless names

      names
    end

    def translate_common_perms(access_type)
      case access_type
      when 'full-control'
        %w{FullControl}
      when 'modify'
        translate_perm_names('full-control') + %w{Modify}
      when 'read'
        translate_perm_names('modify') + %w{ReadAndExecute Read}
      when 'write'
        translate_perm_names('modify') + %w{Write}
      when 'execute'
        translate_perm_names('modify') + %w{ReadAndExecute ExecuteFile Traverse}
      when 'delete'
        translate_perm_names('modify') + %w{Delete}
      end
    end

    def translate_uncommon_perms(access_type)
      case access_type
      when 'delete-subdirectories-and-files'
        translate_perm_names('full-control') + %w{DeleteSubdirectoriesAndFiles}
      when 'change-permissions'
        translate_perm_names('full-control') + %w{ChangePermissions}
      when 'take-ownership'
        translate_perm_names('full-control') + %w{TakeOwnership}
      when 'synchronize'
        translate_perm_names('full-control') + %w{Synchronize}
      end
    end

    def translate_granular_perms(access_type)
      case access_type
      when 'write-data', 'create-files'
        translate_perm_names('write') + %w{WriteData CreateFiles}
      when 'append-data', 'create-directories'
        translate_perm_names('write') + %w{CreateDirectories AppendData}
      when 'write-extended-attributes'
        translate_perm_names('write') + %w{WriteExtendedAttributes}
      when 'write-attributes'
        translate_perm_names('write') + %w{WriteAttributes}
      when 'read-data', 'list-directory'
        translate_perm_names('read') + %w{ReadData ListDirectory}
      when 'read-attributes'
        translate_perm_names('read') + %w{ReadAttributes}
      when 'read-extended-attributes'
        translate_perm_names('read') + %w{ReadExtendedAttributes}
      when 'read-permissions'
        translate_perm_names('read') + %w{ReadPermissions}
      end
    end
  end
end
