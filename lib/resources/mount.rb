# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
# author: Joseph Benden

require 'utils/simpleconfig'

module Inspec::Resources
  class Mount < Inspec.resource(1)
    name 'mount'
    desc 'Use the mount InSpec audit resource to test if mount points.'
    example "
      describe mount('/') do
        it { should be_mounted }
        its('count') { should eq 1 }
        its('device') { should eq  '/dev/mapper/VolGroup-lv_root' }
        its('type') { should eq  'ext4' }
        its('options') { should eq ['rw', 'mode=620'] }
        its('options') { should include 'nodev' }
      end
    "
    attr_reader :file

    def initialize(path)
      @path = path
      @mount_manager = mount_manager_for_os
      return skip_resource 'The `mount` resource is not supported on your OS yet.' if @mount_manager.nil?
      @file = inspec.backend.file(@path)
    end

    def mounted?
      file.mounted?
    end

    def count
      mounted = file.mounted
      return nil if mounted.nil? || mounted.stdout.nil?
      mounted.stdout.lines.count
    end

    def method_missing(name)
      return nil if !file.mounted?

      mounted = file.mounted
      return nil if mounted.nil? || mounted.stdout.nil?

      line = mounted.stdout
      # if we got multiple lines, only use the last entry
      line = mounted.stdout.lines.to_a.last if mounted.stdout.lines.count > 1

      # parse content if we are on linux
      @mount_options ||= @mount_manager.parse_mount_options(line)
      @mount_options[name]
    end

    def to_s
      "Mount #{@path}"
    end

    private

    def mount_manager_for_os
      os = inspec.os
      if os.linux?
        LinuxMounts.new(inspec)
      elsif ['freebsd'].include?(os[:family])
        BsdMounts.new(inspec)
      end
    end
  end

  class MountsInfo
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end

    def parse_mount_options(_mount_line, _compatibility = false)
      raise NotImplementedError
    end
  end

  class LinuxMounts < MountsInfo
    include LinuxMountParser
  end

  class BsdMounts < MountsInfo
    include BsdMountParser
  end
end
