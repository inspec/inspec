module Inspec::Resources
  class DfResource < Inspec.resource(1)
    name 'df'
    supports os_family: 'linux'
    desc 'Use the df InSpec resource to test file system disk space usage'
    example "
      describe df('/') do
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
      "DiskSpace #{partition}"
    end
  end
end
