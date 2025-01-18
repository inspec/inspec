require 'inspec/resources/platform'

module Inspec::Resources
  class OSResource < PlatformResource
    name 'os'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the os InSpec audit resource to test the platform on which the system is running.'
    example <<~EXAMPLE
      describe os[:family] do
        it { should eq 'redhat' }
      end

      describe os.redhat? do
        it { should eq true }
      end

      describe os.linux? do
        it { should eq true }
      end
    EXAMPLE

    # reuse helper methods from backend
    %w[aix? redhat? debian? suse? bsd? solaris? linux? unix? windows? hpux? darwin?].each do |os_family|
      define_method(os_family.to_sym) do
        @platform.send(os_family)
      end
    end

    # updated to support multiple precision float and semver release numbers
    def release
      Gem::Version.new(@platform.release).to_s
    end

    def resource_id
      @platform.name || 'OS'
    end

    def to_s
      'Operating System Detection'
    end
  end
end
