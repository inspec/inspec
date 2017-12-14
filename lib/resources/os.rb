# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'resources/platform'

module Inspec::Resources
  class OSResource < PlatformResource
    name 'os'
    desc 'Use the os InSpec audit resource to test the platform on which the system is running.'
    example "
      describe os[:family] do
        it { should eq 'redhat' }
      end

      describe os.redhat? do
        it { should eq true }
      end

      describe os.linux? do
        it { should eq true }
      end
    "

    # reuse helper methods from backend
    %w{aix? redhat? debian? suse? bsd? solaris? linux? unix? windows? hpux? darwin?}.each do |os_family|
      define_method(os_family.to_sym) do
        @platform.send(os_family)
      end
    end

    # This is a string override for os.name.
    # TODO: removed in inspec 2.0
    class NameCleaned < String
      def ==(other)
        if other =~ /[A-Z ]/
          cleaned = other.downcase.tr(' ', '_')
          Inspec::Log.warn "[DEPRECATED] Platform names will become lowercase in InSpec 2.0. Please match on '#{cleaned}' instead of '#{other}'"
        end
        super(other)
      end
    end

    def [](name)
      # convert string to symbol
      name = name.to_sym if name.is_a? String
      return self.name if name == :name

      inspec.backend.os[name]
    end

    def name
      NameCleaned.new(inspec.backend.os[:name])
    end

    # add helper methods for easy access of properties
    # allows users to use os.name, os.family, os.release, os.arch
    %w{family release arch}.each do |property|
      define_method(property.to_sym) do
        inspec.backend.os[property.to_sym]
      end
    end

    # helper to collect a hash object easily
    def params
      {
        name: @platform[:name],
        family: @platform[:family],
        release: @platform[:release],
        arch: @platform[:arch],
      }
    end

    def to_s
      'Operating System Detection'
    end
  end
end
