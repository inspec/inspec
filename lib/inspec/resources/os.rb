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
        platform.send(os_family)
      end
    end

    def resource_id
      platform_info[:name] || 'OS'
    end

    def to_s
      'Operating System Detection'
    end

    def release
      platform_specific_info('release') || platform_info[:release]
    end

    def version
      Version.new(release, platform_specific_info('build'))
    end

    def params
      {
        name: platform_info[:name],
        families: platform_info[:families],
        release: platform_info[:release],
        arch: platform_info[:arch],
        version: {
          major: version.major,
          minor: version.minor,
          patch: version.patch,
          build: version.build
        }
      }.tap { |h| h.delete(:arch) if in_family?('api') }
    end

    def platform
      @platform ||= super
    end

    private

    def platform_info
      @platform_info ||= {
        name: platform[:name],
        families: platform[:family_hierarchy],
        release: platform[:release],
        arch: platform[:arch]
      }
    end

    def platform_specific_info(type)
      case platform_info[:families].first
      when 'darwin'
        case type
        when 'release'
          inspec.command('sw_vers -productVersion').stdout.strip
        when 'build'
          inspec.command('sw_vers -buildVersion').stdout.strip
        end
      end
    end
  end
end
