module Inspec::Resources
  class FileSystemResource < Inspec.resource(1)
    name 'filesystem'
    supports os_family: 'linux'
    desc 'Use the filesystem InSpec resource to test file system'
    example "
      describe filesystem('/') do
        its('size') { should be >= 32000 }
      end
    "
    attr_reader :partition

    def initialize(partition)
      @partition = partition
    end

    def size
      @size ||= begin
        cmd = inspec.command("df #{partition} --output=size")
        raise Inspec::Exceptions::ResourceFailed, "Unable to get available space for partition #{partition}" if cmd.stdout.nil? || cmd.stdout.empty? || !cmd.exit_status.zero?

        value = cmd.stdout.gsub(/\dK-blocks[\r\n]/, '').strip
        value.to_i
      end
    end

    def to_s
      "Filesystem #{partition}"
    end
  end
end
