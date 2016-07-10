# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

require 'shellwords'

module Inspec::Resources
  class FileResource < Inspec.resource(1) # rubocop:disable Metrics/ClassLength
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
      @file = inspec.backend.file(path)
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

      file_permission_granted?('r', by_usergroup, by_specific_user)
    end

    def writable?(by_usergroup, by_specific_user)
      return false unless exist?

      file_permission_granted?('w', by_usergroup, by_specific_user)
    end

    def executable?(by_usergroup, by_specific_user)
      return false unless exist?

      file_permission_granted?('x', by_usergroup, by_specific_user)
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

    def file_permission_granted?(flag, by_usergroup, by_specific_user)
      unless inspec.os.unix?
        fail 'Checking file permissions is not supported on your os'
      end

      if by_specific_user.nil? || by_specific_user.empty?
        usergroup = usergroup_for(by_usergroup, by_specific_user)
        check_file_permission_by_mask(usergroup, flag)
      else
        check_file_permission_by_user(by_specific_user, flag)
      end
    end

    def check_file_permission_by_mask(usergroup, flag)
      mask = file.unix_mode_mask(usergroup, flag)
      fail 'Invalid usergroup/owner provided' if mask.nil?

      (file.mode & mask) != 0
    end

    def check_file_permission_by_user(user, flag)
      if inspec.os.linux?
        perm_cmd = "su -s /bin/sh -c \"test -#{flag} #{source_path}\" #{user}"
      elsif inspec.os.bsd? || inspec.os.solaris?
        perm_cmd = "sudo -u #{user} test -#{flag} #{source_path}"
      elsif inspec.os.aix?
        perm_cmd = "su #{user} -c test -#{flag} #{source_path}"
      elsif inspec.os.hpux?
        perm_cmd = "su #{user} -c \"test -#{flag} #{source_path}\""
      else
        return skip_resource 'The `file` resource does not support `by_user` on your OS.'
      end

      cmd = inspec.command(perm_cmd)
      cmd.exit_status == 0 ? true : false
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
end
