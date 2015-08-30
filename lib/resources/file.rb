# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'digest'

module Vulcano::Resources
  class File < Vulcano.resource(1)
    name 'file'

    def initialize(path)
      @path = path
      @file = @vulcano.file(@path)
    end

    %w{
      type exists? file? block_device? character_device? socket?
        directory? symlink? pipe?
      mode owner group link content mtime ctime size selinux_label
      readable? writable? executable? mounted? immutable?
    }.each do |name|
      define_method name.to_sym do |*args|
        @file.method(name.to_sym).call(*args)
      end
    end

    def contain(pattern, from, to)
      raise ' not yet implemented '
    end

    def mode?(mode)
      @file.mode == mode
    end

    def owned_by?(owner)
      @file.owner == owner
    end

    def grouped_into?(group)
      @file.group == group
    end

    def linked_to?(dst)
      @file.linkk == dst
    end

    def md5sum
      if @file.respond_to?(:md5sum)
        @file.md5sum
      else
        res = Digest::MD5.new
        res.update(@file.content)
        res.hexdigest
      end
    end

    def sha256sum
      if @file.respond_to?(:sha256sum)
        @file.sha256sum
      else
        res = Digest::SHA256.new
        res.update(@file.content)
        res.hexdigest
      end
    end

    def to_s
      'Path "#{@path}"'
    end
  end
end
