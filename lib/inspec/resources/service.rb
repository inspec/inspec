require "hashie"
require "inspec/utils/file_reader"
require "inspec/utils/simpleconfig"

module Inspec::Resources
  class Runlevels < Hash
    attr_accessor :owner

    def self.from_hash(owner, hash = {}, filter = nil)
      res = Runlevels.new(owner)
      filter = filter.first if filter.is_a?(Array) && filter.length <= 1

      ks = case filter
           when nil
             hash.keys
           when Regexp
             hash.keys.find_all { |x| x.to_s =~ filter }
           when Array
             f = filter.map(&:to_s)
             hash.keys.find_all { |x| f.include?(x.to_s) }
           when Numeric
             hash.keys.include?(filter) ? [filter] : []
           else
             hash.keys.find_all { |x| x == filter }
           end

      ks.each { |k| res[k] = hash[k] }
      res
    end

    def initialize(owner, default = false)
      @owner = owner
      super(default)
    end

    def filter(f)
      Runlevels.from_hash(owner, self, f)
    end

    # Check if all runlevels are enabled
    #
    # @return [boolean] true if all runlevels are enabled
    def enabled?
      values.all?
    end

    # Check if all runlevels are disabled
    #
    # @return [boolean] true if all runlevels are disabled
    def disabled?
      values.none?
    end

    def to_s
      "#{owner} runlevels #{keys.join(", ")}"
    end
  end

  # We detect the init system for each operating system, based on the operating
  # system.
  #
  # Fedora 15 : systemd
  # RedHat 7 : systemd
  # Ubuntu 15.04 : systemd
  # Ubuntu < 15.04 : upstart
  #
  # TODO: extend the logic to detect the running init system, independently of OS
  class Service < Inspec.resource(1)
    name "service"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the service InSpec audit resource to test if the named service is installed, running and/or enabled."
    example <<~EXAMPLE
      describe service('service_name') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
        its('type') { should be 'systemd' }
        its ('startmode') { should be 'Auto'}
      end

      describe service('service_name').runlevels(3, 5) do
        it { should be_enabled }
      end

      describe service('service_name').params do
        its('UnitFileState') { should eq 'enabled' }
      end
    EXAMPLE

    attr_reader :service_ctl

    def initialize(service_name, service_ctl = nil)
      @service_name = service_name
      @service_mgmt = nil
      @service_ctl ||= service_ctl
      @cache = nil
      @service_mgmt = select_service_mgmt

      return skip_resource "The `service` resource is not supported on your OS yet." if @service_mgmt.nil?
    end

    def select_service_mgmt # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
      os = inspec.os
      platform = os[:name]

      # Ubuntu
      # @see: https://wiki.ubuntu.com/SystemdForUpstartUsers
      # Ubuntu 15.04 : Systemd
      #   Systemd runs with PID 1 as /sbin/init.
      #   Upstart runs with PID 1 as /sbin/upstart.
      # Ubuntu < 15.04 : Upstart
      # Upstart runs with PID 1 as /sbin/init.
      # Systemd runs with PID 1 as /lib/systemd/systemd.
      if %w{ubuntu}.include?(platform)
        version = os[:release].to_f
        if version < 15.04
          Upstart.new(inspec, service_ctl)
        else
          Systemd.new(inspec, service_ctl)
        end
      elsif %w{linuxmint}.include?(platform)
        version = os[:release].to_f
        if version < 18
          Upstart.new(inspec, service_ctl)
        else
          Systemd.new(inspec, service_ctl)
        end
      elsif %w{debian}.include?(platform)
        if os[:release] == "buster/sid"
          version = 10
        else
          version = os[:release].to_i
        end
        if version > 7
          Systemd.new(inspec, service_ctl)
        elsif version > 0
          SysV.new(inspec, service_ctl || "/usr/sbin/service")
        end
      elsif %w{redhat fedora centos oracle cloudlinux}.include?(platform)
        version = os[:release].to_i
        if (%w{redhat centos oracle cloudlinux}.include?(platform) && version >= 7) || (platform == "fedora" && version >= 15)
          Systemd.new(inspec, service_ctl)
        else
          SysV.new(inspec, service_ctl || "/sbin/service")
        end
      elsif %w{wrlinux}.include?(platform)
        SysV.new(inspec, service_ctl)
      elsif %w{mac_os_x}.include?(platform)
        LaunchCtl.new(inspec, service_ctl)
      elsif os.windows?
        WindowsSrv.new(inspec)
      elsif %w{freebsd}.include?(platform)
        BSDInit.new(inspec, service_ctl)
      elsif %w{arch}.include?(platform)
        Systemd.new(inspec, service_ctl)
      elsif %w{coreos}.include?(platform)
        Systemd.new(inspec, service_ctl)
      elsif %w{suse opensuse}.include?(platform)
        if os[:release].to_i >= 12
          Systemd.new(inspec, service_ctl)
        else
          SysV.new(inspec, service_ctl || "/sbin/service")
        end
      elsif %w{aix}.include?(platform)
        SrcMstr.new(inspec)
      elsif %w{amazon}.include?(platform)
        if os[:release] =~ /^20\d\d/
          Upstart.new(inspec, service_ctl)
        else
          Systemd.new(inspec, service_ctl)
        end
      elsif os.solaris?
        Svcs.new(inspec)
      end
    end

    def info
      return nil if @service_mgmt.nil?

      @cache ||= @service_mgmt.info(@service_name)
    end

    # verifies if the service is enabled
    def enabled?(_level = nil)
      return false if info.nil?

      info[:enabled]
    end

    def params
      return {} if info.nil?

      Hashie::Mash.new(info[:params] || {})
    end

    # verifies the service is registered
    def installed?(_name = nil, _version = nil)
      return false if info.nil?

      info[:installed]
    end

    # verifies the service is currently running
    def running?(_under = nil)
      return false if info.nil?

      info[:running]
    end

    # get all runlevels that are available and their configuration
    def runlevels(*args)
      return Runlevels.new(self) if info.nil? || info[:runlevels].nil?

      Runlevels.from_hash(self, info[:runlevels], args)
    end

    # returns the service type from info
    def type
      return nil if info.nil?

      info[:type]
    end

    # returns the service name from info
    def name
      return @service_name if info.nil?

      info[:name]
    end

    # returns the service description from info
    def description
      return nil if info.nil?

      info[:description]
    end

    # returns the service start up mode from info
    def startmode
      return nil if info.nil?

      info[:startmode]
    end

    # returns the service's user from info
    def startname
      return nil if info.nil?

      info[:startname]
    end

    def to_s
      "Service #{@service_name}"
    end

    private :info
  end

  class ServiceManager
    attr_reader :inspec, :service_ctl
    def initialize(inspec, service_ctl = nil)
      @inspec = inspec
      @service_ctl ||= service_ctl
    end

    def info(service_name)
    end
  end
end
