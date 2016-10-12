# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

require 'shellwords'

module Inspec::Resources
  module FilePermsSelector
    def select_file_perms_style(os)
      if os.unix?
        @perms_provider = UnixPermission.new(inspec)
      elsif os.windows?
        @perms_provider = WindowsPermission.new(inspec)
      end
    end
  end

  class FileResource < Inspec.resource(1)
    include FilePermsSelector

    name 'file'
    desc 'Use the file InSpec audit resource to test all system file types, including files, directories, symbolic links, named pipes, sockets, character devices, block devices, and doors.'
    example "
      describe file('path') do
        it { should exist }
        it { should be_file }
        it { should be_readable }
        it { should be_writable }
        it { should be_owned_by 'root' }
        its('mode') { should cmp '0644' }
      end
    "
    include MountParser

    attr_reader :file, :mount_options
    def initialize(path)
      # select permissions style
      @perms_provider = select_file_perms_style(inspec.os)
      @file = inspec.backend.file(path)
      return skip_resource 'The `file` resource is not supported on your OS yet.' if @perms_provider.nil?
    end

    %w{
      type exist? file? block_device? character_device? socket? directory?
      symlink? pipe? mode mode? owner owned_by? group grouped_into?
      link_path linked_to? mtime size selinux_label immutable?
      product_version file_version version? md5sum sha256sum
      path basename source source_path uid gid
    }.each do |m|
      define_method m.to_sym do |*args|
        file.method(m.to_sym).call(*args)
      end
    end

    def content
      res = file.content
      return nil if res.nil?
      res.force_encoding('utf-8')
    end

    def contain(*_)
      fail 'Contain is not supported. Please use standard RSpec matchers.'
    end

    def readable?(by_usergroup, by_specific_user)
      return false unless exist?

      file_permission_granted?('read', by_usergroup, by_specific_user)
    end

    def writable?(by_usergroup, by_specific_user)
      return false unless exist?

      file_permission_granted?('write', by_usergroup, by_specific_user)
    end

    def executable?(by_usergroup, by_specific_user)
      return false unless exist?

      file_permission_granted?('execute', by_usergroup, by_specific_user)
    end

    def mounted?(expected_options = nil, identical = false)
      mounted = file.mounted

      # return if no additional parameters have been provided
      return file.mounted? if expected_options.nil?

      # deprecation warning, this functionality will be removed in future version
      warn "[DEPRECATION] `be_mounted.with and be_mounted.only_with` are deprecated.  Please use `mount('#{source_path}')` instead."

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

    def sgid
      (mode & 02000) > 0
    end

    def sticky
      (mode & 01000) > 0
    end

    def to_s
      "File #{source_path}"
    end

    private

    def file_permission_granted?(access, by_usergroup, by_specific_user)
      return nil if @perms_provider.nil?
      if by_specific_user.nil? || by_specific_user.empty?
        return nil if !inspec.os.unix?
        usergroup = usergroup_for(by_usergroup, by_specific_user)
        check_file_permission_by_mask(usergroup, access)
      else
        @perms_provider.check_file_permission_by_user(by_specific_user, access, source_path)
      end
    end

    def check_file_permission_by_mask(usergroup, flag)
      mask = file.unix_mode_mask(usergroup, flag)
      fail 'Invalid usergroup/owner provided' if mask.nil?

      (file.mode & mask) != 0
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
  end

  class FilePermission
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  class UnixPermission < FilePermission
    def check_file_permission_by_user(user, access_type, path)
      flag = case access_type
             when 'read'
               'r'
             when 'write'
               'w'
             when 'execute'
               'x'
             end
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

  class WindowsPermission < FilePermission
    def check_file_permission_by_user(user, access_type, path)
      access_rule = case access_type
                    when 'read'
                      '@(\'FullControl\', \'Modify\', \'ReadAndExecute\', \'Read\', \'ListDirectory\')'
                    when 'write'
                      '@(\'FullControl\', \'Modify\', \'Write\')'
                    when 'execute'
                      '@(\'FullControl\', \'Modify\', \'ReadAndExecute\', \'ExecuteFile\')'
                    end
      cmd = inspec.command("@(@((Get-Acl #{path}).access | Where-Object {$_.AccessControlType -eq 'Allow' -and $_.IdentityReference -eq '#{user}' }) | Where-Object {($_.FileSystemRights.ToString().Split(',') | % {$_.trim()} | ? {#{access_rule} -contains $_}) -ne $null}) | measure | % { $_.Count }")
      cmd.stdout.chomp == '0' ? false : true
    end
  end
end
