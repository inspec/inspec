# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

module Inspec::Resources
  class File < Inspec.resource(1)
    name 'file'

    attr_reader :path
    def initialize(path)
      @path = path
      @file = inspec.backend.file(@path)
    end

    %w{
      type exist? file? block_device? character_device? socket? directory?
      symlink? pipe? mode mode? owner owned_by? group grouped_into? link_target
      link_path linked_to? content mtime size selinux_label mounted? immutable?
      product_version file_version version? md5sum sha256sum
    }.each do |m|
      define_method m.to_sym do |*args|
        @file.method(m.to_sym).call(*args)
      end
    end

    def contain(*_)
      fail 'Contain is not supported. Please use standard RSpec matchers.'
    end

    def readable?(by_owner, by_user)
      by_owner, by_user = check_preconditions(by_owner, by_user)

      if by_user.nil?
        m = @file.unix_mode_mask(by_owner, 'r') ||
            fail("#{by_owner} is not a valid unix owner.")
        (@file.mode & m) != 0
      else
        check_user_access(by_user, @path, 'r')
      end
    end

    def writable?(by_owner, by_user)
      by_owner, by_user = check_preconditions(by_owner, by_user)

      if by_user.nil?
        m = @file.unix_mode_mask(by_owner, 'w') ||
            fail("#{by_owner} is not a valid unix owner.")
        (@file.mode & m) != 0
      else
        check_user_access(by_user, @path, 'w')
      end
    end

    def executable?(by_owner, by_user)
      by_owner, by_user = check_preconditions(by_owner, by_user)

      if by_user.nil?
        m = @file.unix_mode_mask(by_owner, 'x') ||
            fail("#{by_owner} is not a valid unix owner.")
        (@file.mode & m) != 0
      else
        check_user_access(by_user, @path, 'x')
      end
    end

    def to_s
      "File #{@path}"
    end

    private

    def check_preconditions(by_owner, by_user)
      by_owner = 'other' if by_owner == 'others'
      by_owner = 'all' if (by_owner.nil? || by_owner.empty?) && (by_user.nil?)
      [by_owner, by_user]
    end

    # check permissions on linux
    def check_user_access(user, file, flag)
      if inspec.os.linux? == true
        # use sh on linux
        perm_cmd = "su -s /bin/sh -c \"test -#{flag} #{file}\" #{user}"
      elsif inspec.os[:family] == 'freebsd'
        # use sudo on freebsd
        perm_cmd = "sudo -u #{user} test -#{flag} #{file}"
      end

      if !perm_cmd.nil?
        cmd = inspec.command(perm_cmd)
        cmd.exit_status == 0 ? true : false
      else
        return skip_resource 'The `file` resource does not support `by_user` on your OS.'
      end
    end
  end
end
