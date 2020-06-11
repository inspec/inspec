# encoding: utf-8

module Train
  class File
    class Local < Train::File
      %w{
        exist? file? socket? directory? symlink? pipe? size basename
      }.each do |m|
        define_method m.to_sym do
          ::File.method(m.to_sym).call(@path)
        end
      end

      def content
        @content ||= ::File.read(@path, encoding: "UTF-8")
      rescue StandardError => _
        nil
      end

      def link_path
        return nil unless symlink?

        begin
          @link_path ||= ::File.realpath(@path)
        rescue Errno::ELOOP => _
          # Leave it blank on symbolic loop, same as readlink
          @link_path = ""
        end
      end

      def shallow_link_path
        return nil unless symlink?

        @link_path ||= ::File.readlink(@path)
      end

      def block_device?
        ::File.blockdev?(@path)
      end

      def character_device?
        ::File.chardev?(@path)
      end

      def type
        case ::File.ftype(@path)
        when "blockSpecial"
          :block_device
        when "characterSpecial"
          :character_device
        when "link"
          :symlink
        when "fifo"
          :pipe
        else
          ::File.ftype(@path).to_sym
        end
      end

      %w{
        mode owner group uid gid mtime selinux_label
      }.each do |field|
        define_method field.to_sym do
          stat[field.to_sym]
        end
      end

      def mode?(sth)
        mode == sth
      end

      def linked_to?(dst)
        link_path == dst
      end
    end
  end
end

# subclass requires are loaded after Train::File::Local is defined
# to avoid superclass mismatch errors
require_relative "local/unix"
require_relative "local/windows"
