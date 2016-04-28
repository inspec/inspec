# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

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
    include MountParser

    attr_reader :file

    def initialize(path)
      @path = path
      return skip_resource 'The `mount` resource is not supported on your OS yet.' if !inspec.os.linux?
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
      @mount_options ||= parse_mount_options(line)
      @mount_options[name]
    end

    def to_s
      "Mount #{@path}"
    end
  end
end
