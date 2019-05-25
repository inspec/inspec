require 'inspec/resources/command'

module Inspec::Resources
  class FileSystemResource < Inspec.resource(1)
    name 'filesystem'
    supports platform: 'linux'
    supports platform: 'windows'
    desc 'Use the filesystem InSpec resource to test file system'
    example <<~EXAMPLE
      describe filesystem('/') do
        its('size_kb') { should be >= 32000 }
        its('free_kb') { should be >= 3200 }
        its('type') { should cmp 'ext4' }
        its('percent_free') { should be >= 20 }
      end
      describe filesystem('c:') do
        its('size_kb') { should be >= 9000 }
        its('free_kb') { should be >= 3200 }
        its('type') { should cmp 'NTFS' }
        its('percent_free') { should be >= 20 }
      end
    EXAMPLE
    attr_reader :partition

    def initialize(partition)
      @partition = partition
      @cache = nil
      # select file system manager
      @fsman = nil

      os = inspec.os
      if os.linux?
        @fsman = LinuxFileSystemResource.new(inspec)
      elsif os.windows?
        @fsman = WindowsFileSystemResource.new(inspec)
      else
        raise Inspec::Exceptions::ResourceSkipped, 'The `filesystem` resource is not supported on your OS yet.'
      end
    end

    def info
      return @cache if !@cache.nil?
      return {} if @fsman.nil?
      @cache = @fsman.info(@partition)
    end

    def to_s
      "FileSystem #{@partition}"
    end

    def size_kb
      info = @fsman.info(@partition)
      info[:size_kb]
    end

    def size
      Inspec.deprecate(:property_filesystem_size, 'The `size` property did not reliably use the correct units. Please use `size_kb` instead.')
      if inspec.os.windows?
        # On windows, we had a bug prior to #3767 in which the
        # 'size' value was be scaled to GB in powershell.
        # We now collect it in KB.
        (size_kb / (1024 * 1024)).to_i
      else
        size_kb
      end
    end

    def free_kb
      info = @fsman.info(@partition)
      info[:free_kb]
    end

    def percent_free
      100 * free_kb / size_kb
    end

    def type
      info = @fsman.info(@partition)
      info[:type]
    end

    def name
      info = @fsman.info(@partition)
      info[:name]
    end
  end

  class FsManagement
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  class LinuxFileSystemResource < FsManagement
    def info(partition)
      cmd = inspec.command("df #{partition} -T")
      raise Inspec::Exceptions::ResourceFailed, "Unable to get available space for partition #{partition}" if cmd.stdout.nil? || cmd.stdout.empty? || !cmd.exit_status.zero?
      value = cmd.stdout.split(/\n/)[1].strip.split(' ')
      {
        name: partition,
        size_kb: value[2].to_i,
        free_kb: value[4].to_i,
        type: value[1].to_s,
      }
    end
  end

  class WindowsFileSystemResource < FsManagement
    def info(partition)
      cmd = inspec.command <<-EOF.gsub(/^\s*/, '')
        $disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='#{partition}'"
        $disk.Size = $disk.Size / 1KB
        $disk.FreeSpace = $disk.FreeSpace / 1KB
        $disk | select -property DeviceID,Size,FileSystem,FreeSpace | ConvertTo-Json
      EOF

      raise Inspec::Exceptions::ResourceSkipped, "Unable to get available space for partition #{partition}" if cmd.stdout == '' || cmd.exit_status.to_i != 0
      begin
        fs = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => e
        raise Inspec::Exceptions::ResourceFailed,
              'Failed to parse JSON from Powershell. ' \
              "Error: #{e}"
      end
      {
        name: fs['DeviceID'],
        size_kb: fs['Size'].to_i,
        free_kb: fs['FreeSpace'].to_i,
        type: fs['FileSystem'],
      }
    end
  end
end
