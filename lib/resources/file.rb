# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

module Vulcano::Resources
  class File < Vulcano.resource(1)
    name 'file'

    attr_reader :path
    def initialize(path)
      @path = path
      @file = vulcano.backend.file(@path)
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
      fail ' not yet implemented '
    end

    def readable?(by_owner, by_user)
      if by_user.nil?
        m = unix_mode_mask(by_owner, 'r') ||
            fail("#{by_owner} is not a valid unix owner.")
        (@file.mask & m) != 0
      else
        # TODO: REMOVE THIS FALLBACK
        Specinfra::Runner.check_file_is_accessible_by_user(@path, by_user, 'r')
      end
    end

    def writable?(by_owner, by_user)
      if by_user.nil?
        m = unix_mode_mask(by_owner, 'w') ||
            fail("#{by_owner} is not a valid unix owner.")
        (@file.mask & m) != 0
      else
        # TODO: REMOVE THIS FALLBACK
        Specinfra::Runner.check_file_is_accessible_by_user(@path, by_user, 'w')
      end
    end

    def executable?(by_owner, by_user)
      if by_user.nil?
        m = unix_mode_mask(by_owner, 'x') ||
            fail("#{by_owner} is not a valid unix owner.")
        (@file.mask & m) != 0
      else
        # TODO: REMOVE THIS FALLBACK
        Specinfra::Runner.check_file_is_accessible_by_user(@path, by_user, 'x')
      end
    end

    def to_s
      "Path '#{@path}'"
    end
  end
end
