# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'utils/simpleconfig'

class Mount < Inspec.resource(1)
  name 'mount'
  desc 'Use the mount InSpec audit resource to test if mount points.'
  example "
    describe mount('/') do
      it { should be_mounted }
      its('device') { should eq  '/dev/mapper/VolGroup-lv_root' }
      its('type') { should eq  'ext4' }
      its('options') { should eq ['rw', 'mode=620'] }
    end
  "
  include MountParser

  attr_reader :file

  def initialize(path)
    @path = path
    @file = inspec.backend.file(@path)
  end

  def mounted?
    file.mounted?
  end

  def method_missing(name)
    return nil if !file.mounted?

    mounted = file.mounted

    # parse content if we are on linux
    @mount_options ||= parse_mount_options(mounted.stdout)

    @mount_options[name]
  end

  def to_s
    "Mount #{@path}"
  end
end
