# encoding: utf-8
# author: Jonathan Morley

module Inspec::Resources
  class DfResource < Inspec.resource(1)
    name 'df'
    desc 'Use the df InSpec resource to test file system disk space usage'
    example "
      describe df('/') do
        its(:space) { should be >= 32000 }
      end
    "
    attr_reader :partition

    def initialize(partition)
      @partition = partition
      @cmd = inspec.command("df #{@partition} --output=size | sed \"/blocks/d; s/ *//g\"")
    end

    def space
      @cmd.stdout.to_i
    end

    def to_s
      "DiskSpace #{@partition}"
    end
  end
end
