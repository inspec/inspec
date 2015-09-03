# encoding: utf-8

require 'digest'

module Vulcano::Plugins

  class Backend
    def self.name( name )
      Vulcano::Plugins::Backend.__register(name, self)
    end

    def self.__register(id, obj)
      # raise errors for all missing methods
      %w{ file run_command os }.each do |m|
        next if obj.public_method_defined?(m.to_sym)
        obj.send(:define_method, m.to_sym) do |*args|
          fail NotImplementedError.new("Backend must implement the #{m}() method.")
        end
      end

      Vulcano::Backend.registry[id] = obj
    end

    class FileCommon
      # interface methods: these fields should be implemented by every
      # backend File
      %w{
        exists? mode owner group link_target content mtime size
        selinux_label product_version file_version
      }

      def type
        :unknown
      end

      # The following methods can be overwritten by a derived class
      # if desired, to e.g. achieve optimizations.

      def md5sum
        res = Digest::MD5.new
        res.update(content)
        res.hexdigest
      end

      def sha256sum
        res = Digest::SHA256.new
        res.update(content)
        res.hexdigest
      end

      # Additional methods for convenience

      def file?
        type == :file
      end

      def block_device?
        type == :block_device
      end

      def character_device?
        type == :character_device
      end

      def socket?
        type == :socket
      end

      def directory?
        type == :directory
      end

      def symlink?
        type == :symlink
      end

      def pipe?
        type == :pipe?
      end

      def mode?(mode)
        mode == mode
      end

      def owned_by?(owner)
        owner == owner
      end

      def grouped_into?(group)
        group == group
      end

      def linked_to?(dst)
        link_target == dst
      end

      def version?(version)
        product_version == version or
        file_version == version
      end

      # helper methods provided to any implementing class
      private

      UNIX_MODE_OWNERS = {
        owner: 00700,
        group: 00070,
        other: 00007,
      }

      UNIX_MODE_TYPES = {
        r: 00444,
        w: 00222,
        x: 00111,
      }

      def unix_mode_mask(owner, type)
        o = UNIX_MODE_OWNERS[owner.to_sym]
        return nil if o.nil?

        t = UNIX_MODE_TYPES[type.to_sym]
        return nil if t.nil?

        t & o
      end

    end

  end
end
