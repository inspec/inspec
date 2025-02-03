require 'inspec/resources/powershell'
require 'inspec/log'
require 'hashie/mash'

module Inspec::Resources
  # rubocop:disable Metrics/MethodLength

  module RNGManagementSelector
    def select_rng_manager(os)
      Inspec::Log.debug "Selecting RNG manager for OS: #{os[:family]}"
      if os.linux?
        LinuxRNG.new(inspec)
      elsif os.windows?
        WindowsRNG.new(inspec)
      elsif os[:family] == 'darwin'
        MacOSRNG.new(inspec)
      elsif os[:family] == 'freebsd'
        FreeBSDRNG.new(inspec)
      else
        GenericUnixRNG.new(inspec)
      end
    end
  end

  class RandomNumberGenerator < Inspec.resource(1)
    include RNGManagementSelector

    name 'random_number_generator'
    supports platform: 'unix'
    # TODO: Add support for Windows RNG through testing
    # The Windows RNG implementation is untested and may not work as expected.
    # supports platform: 'windows'

    desc 'Tests the presence and status of a random number generator.'
    example <<~EXAMPLE
           # General usage
      describe random_number_generator do
         it { should exist }
         it { should be_available }
         it { should be_hardware }
         it { should have_sources }
         it { should have_support_services }
         # unless fips_enabled?, see `Support Services` section
         # in the resource documentation.
         it { should have_service_running }
         its('type') { should match(/hardware|cprng|software/) }
         its('sources') { should include '/dev/random' }
         its('entropy_available') { should be > 1000 }
       end

       # Windows support has not been fully tested or implemented yet
       if os.windows?
         describe random_number_generator do
           it { should be_software }
           its('cng_properties') { should match(/Microsoft Primitive Provider/) }
         end
       end

       if os[:family] == 'darwin'
         describe random_number_generator do
           it { should be_cprng }
           its('cprng_status') { should match(/kern.random/) }
         end
       end
    EXAMPLE

    attr_reader :rng_info, :type, :sources, :entropy_available, :service_running, :support_services, :cprng_status,
                :cng_properties

    # provide as this is a standard in inspec resources generally
    alias params rng_info

    def initialize
      super()
      Inspec::Log.debug 'Initializing RandomNumberGenerator resource'
      @rng_provider = select_rng_manager(inspec.os)
      skip_resource 'The `random_number_generator` resource is not supported on your OS yet.' if @rng_provider.nil?

      @rng_info = Hashie::Mash.new(@rng_provider.rng_info)
      Inspec::Log.debug "RNG info: #{@rng_info}"
      @cached_results = {}
    end

    %w[
      entropy_available service_running support_services type sources cprng_status cng_properties
      has_sources? has_service_running? has_support_services?
    ].each do |method|
      define_method(method.to_sym) do
        @cached_results[method] ||= begin
          base_method = method.gsub('has_', '').gsub('?', '')
          Inspec::Log.debug "Calling method: #{method}"
          if @rng_info.key?(base_method.to_sym)
            @rng_info[base_method.to_sym]
          elsif send(base_method).respond_to?(:any?)
            send(base_method).any?
          else
            send(base_method)
          end
        end
      end
    end

    def exist?
      Inspec::Log.debug 'Checking if RNG exists'
      @rng_info.exists
    end

    def available?
      Inspec::Log.debug 'Checking if RNG is available'
      @rng_info.available
    end

    def entropy_available?
      Inspec::Log.debug 'Checking if entropy is available'
      !entropy_available.nil? && entropy_available > 0
    end

    def is_hardware?
      Inspec::Log.debug 'Checking if RNG type is hardware'
      type == 'hardware'
    end

    def is_software?
      Inspec::Log.debug 'Checking if RNG type is software'
      type == 'software'
    end

    def is_cprng?
      Inspec::Log.debug 'Checking if RNG type is CPRNG'
      type == 'cprng'
    end

    def to_s
      "Random Number Generator (#{type})"
    end

    private

    def collect_rng_details
      Inspec::Log.debug 'Collecting RNG details'
      @rng_info
    end
  end # class RandomNumberGenerator

  # RNGInfo is a base class for platform-specific RNG implementations.
  # It provides caching helpers for file lookups and a helper to construct
  # the standardized RNG info hash.
  class RNGInfo
    attr_reader :inspec

    def initialize(inspec)
      @inspec = inspec
      @rng_info = nil
    end

    # Add caching helpers for file lookups
    def file_cache
      @file_cache ||= {}
    end

    def cached_file(path)
      file_cache[path] ||= inspec.file(path)
    end

    def rng_info
      @rng_info ||= fetch_rng_info
    end

    protected

    # Each platform implementation should return info in this format directly
    def default_rng_info
      {
        exists: false,
        available: false,
        type: 'unknown',
        sources: [],
        active_rng: nil,
        entropy_available: nil,
        service_running: nil,
        support_services: [],
        cprng_status: nil,
        cng_properties: nil
      }
    end
  end

  # --- Linux Implementation ---
  class LinuxRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug 'Initializing LinuxRNG'
    end

    def fetch_rng_info
      Inspec::Log.debug 'Fetching RNG info for Linux'

      # Combine file existence checks into a single command
      file_checks = {
        hw_random: '/dev/hwrng',
        intel_rng: '/dev/intel-rng',
        tpm_rng: '/dev/tpm0'
      }
      file_check_cmd = file_checks.map do |key, file|
        "test -e #{file} && echo #{key}=true || echo #{key}=false"
      end.join(' && ')
      file_check_output = inspec.command(file_check_cmd).stdout.split("\n").map { |line| line.split('=') }.to_h
      hw_random = file_check_output['hw_random'] == 'true'
      intel_rng = file_check_output['intel_rng'] == 'true'
      tpm_rng = file_check_output['tpm_rng'] == 'true'

      # Combine system file reads into a single command
      system_files = {
        active_rng: '/sys/devices/virtual/misc/hw_random/rng_current',
        rng_available: '/sys/devices/virtual/misc/hw_random/rng_available',
        entropy_available: '/proc/sys/kernel/random/entropy_avail'
      }
      system_file_cmd = system_files.map { |key, file| "echo #{key}=$(cat #{file} || echo -n)" }.join(' && ')
      system_file_output = inspec.command(system_file_cmd).stdout.split("\n").map { |line| line.split('=', 2) }.to_h
      active_rng = system_file_output['active_rng']
      rng_available = system_file_output['rng_available'].split
      entropy_available = system_file_output['entropy_available'].to_i

      # Check services in parallel
      services = %w[rngd haveged jitterentropy]
      service_cmds = services.map do |service|
        "systemctl show --no-pager --all #{service} && systemctl is-active #{service} --quiet && systemctl is-enabled #{service} --quiet"
      end
      service_cmd = service_cmds.join(' & ')
      service_output = inspec.command(service_cmd).stdout.split("\n")
      rngd_running = service_output.any? { |line| line.include?('rngd') && line.include?('active') }
      haveged_running = service_output.any? { |line| line.include?('haveged') && line.include?('active') }
      jitterentropy_running = service_output.any? { |line| line.include?('jitterentropy') && line.include?('active') }

      rng_sources = gather_rng_sources(hw_random, intel_rng, tpm_rng)
      rng_type = determine_rng_type(hw_random, intel_rng, tpm_rng, rng_available)
      support_services = gather_support_services(rngd_running, haveged_running, jitterentropy_running)

      {
        exists: !rng_sources.empty?,
        available: !entropy_available.nil? && entropy_available > 0,
        type: rng_type, # NOTE: removed rng_ prefix
        sources: rng_sources, # NOTE: removed rng_ prefix
        active_rng: active_rng,
        entropy_available: entropy_available,
        service_running: rngd_running || haveged_running || jitterentropy_running,
        support_services: support_services
      }
    end

    private

    def gather_rng_sources(hw_random, intel_rng, tpm_rng)
      sources = ['/dev/random', '/dev/urandom']
      sources << '/dev/hwrng' if hw_random
      sources << '/dev/intel-rng' if intel_rng
      sources << '/dev/tpm0' if tpm_rng
      sources
    end

    def determine_rng_type(hw_random, intel_rng, tpm_rng, rng_available)
      if hw_random || intel_rng || tpm_rng || !rng_available.empty?
        'hardware'
      else
        'software'
      end
    end

    def gather_support_services(rngd_running, haveged_running, jitterentropy_running)
      services = []
      services << 'rngd' if rngd_running
      services << 'haveged' if haveged_running
      services << 'jitterentropy' if jitterentropy_running
      services
    end
  end

  # --- FreeBSD Implementation ---
  class FreeBSDRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug 'Initializing FreeBSDRNG'
    end

    def fetch_rng_info
      Inspec::Log.debug 'Fetching RNG info for FreeBSD'

      # Combine checks into a single command
      cmd = <<~CMD
        kldstat | grep random && echo yarrow_loaded=true || echo yarrow_loaded=false
        dmesg | grep -i rdrand && echo rdrand_available=true || echo rdrand_available=false
        test -e /dev/intel-rng && echo intel_rng=true || echo intel_rng=false
      CMD
      output = inspec.command(cmd).stdout.split("\n").map { |line| line.split('=') }.to_h
      yarrow_loaded = output['yarrow_loaded'] == 'true'
      rdrand_available = output['rdrand_available'] == 'true'
      intel_rng = output['intel_rng'] == 'true'

      rng_sources = []
      rng_sources << '/dev/random' if cached_file('/dev/random').exist?
      rng_sources << '/dev/urandom' if cached_file('/dev/urandom').exist?
      rng_sources << 'RDRAND' if rdrand_available
      rng_sources << 'intel-rng' if intel_rng

      active_rng = yarrow_loaded ? 'Yarrow' : nil
      rng_type = if rdrand_available || intel_rng
                   'hardware'
                 elsif yarrow_loaded
                   'software'
                 else
                   'unknown'
                 end

      {
        exists: !rng_sources.empty?,
        available: !rng_sources.empty?,
        type: rng_type, # NOTE: removed rng_ prefix
        sources: rng_sources, # NOTE: removed rng_ prefix
        active_rng: active_rng,
        entropy_available: nil,
        service_running: yarrow_loaded,
        support_services: []
      }
    end
  end

  # --- macOS Implementation ---
  class MacOSRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug 'Initializing MacOSRNG'
    end

    def fetch_rng_info
      Inspec::Log.debug 'Fetching RNG info for macOS'

      # Combine checks into a single command
      cmd = <<~CMD
        test -e /dev/random && echo random_exists=true || echo random_exists=false
        sysctl -n hw.optional.rdrand && echo rdrand_available=true || echo rdrand_available=false
        sysctl kern.random
      CMD
      output = inspec.command(cmd).stdout.split("\n")
      random_exists = output[0].include?('random_exists=true')
      rdrand_available = output[1].include?('rdrand_available=true')
      cprng_status = output[2..-1].join("\n")

      rng_sources = []
      rng_sources << '/dev/random' if random_exists
      rng_sources << 'RDRAND' if rdrand_available

      active_rng = random_exists ? '/dev/random' : nil
      rng_type = rdrand_available ? 'hardware' : 'cprng'

      {
        exists: !rng_sources.empty?,
        available: !rng_sources.empty?,
        type: rng_type, # NOTE: removed rng_ prefix
        sources: rng_sources, # NOTE: removed rng_ prefix
        active_rng: active_rng,
        entropy_available: nil,
        service_running: true, # macOS RNG is always running
        support_services: [],
        cprng_status: cprng_status
      }
    end
  end

  # --- Windows Implementation ---
  # TODO: Add support for Windows RNG through testing
  class WindowsRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug 'Initializing WindowsRNG'
    end

    def fetch_rng_info
      Inspec::Log.debug 'Fetching RNG info for Windows'

      script = <<~EOH
        $rng = @{
          CryptoAPI = $false
          TPM = $false
          RDRAND = $false
        }

        # Check CryptoAPI
        try {
          $null = [System.Security.Cryptography.RNGCryptoServiceProvider]::new()
          $rng.CryptoAPI = $true
        } catch {}

        # Check TPM
        try {
          $tpm = Get-Tpm
          $rng.TPM = ($tpm.TpmPresent -and $tpm.TpmReady)
        } catch {}

        # Check RDRAND (Intel CPU RNG)
        $cpu = Get-WmiObject Win32_Processor
        $rng.RDRAND = $cpu.Manufacturer -match "Intel" -and $cpu.Caption -match "Intel"

        ConvertTo-Json $rng
      EOH

      result = inspec.powershell(script)
      return default_info unless result.exit_status.zero?

      begin
        rng_data = JSON.parse(result.stdout)
        rng_sources = []
        rng_sources << 'CryptoAPI' if rng_data['CryptoAPI']
        rng_sources << 'TPM' if rng_data['TPM']
        rng_sources << 'RDRAND' if rng_data['RDRAND']

        active_rng = if rng_data['TPM']
                       'TPM'
                     elsif rng_data['RDRAND']
                       'RDRAND'
                     elsif rng_data['CryptoAPI']
                       'CryptoAPI'
                     end

        rng_type = if rng_data['TPM'] || rng_data['RDRAND']
                     'hardware'
                   elsif rng_data['CryptoAPI']
                     'cprng'
                   else
                     'unknown'
                   end

        cng_properties = inspec.powershell('Get-CNGProperty -ProviderName Microsoft Primitive Provider').stdout

        {
          exists: !rng_sources.empty?,
          available: !rng_sources.empty?,
          type: rng_type, # NOTE: removed rng_ prefix
          sources: rng_sources, # NOTE: removed rng_ prefix
          active_rng: active_rng,
          entropy_available: nil,
          service_running: true, # Windows RNG services are built-in
          support_services: ['CryptoSvc'],
          cng_properties: cng_properties
        }
      rescue StandardError
        default_info
      end
    end

    private

    def default_info
      Inspec::Log.debug 'Returning default RNG info for Windows'
      {
        exists: false,
        available: false,
        type: 'unknown',
        sources: [],
        active_rng: nil,
        entropy_available: nil,
        service_running: nil,
        support_services: []
      }
    end
  end

  # --- Generic Unix Fallback ---
  class GenericUnixRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug 'Initializing GenericUnixRNG'
    end

    def fetch_rng_info
      Inspec::Log.debug 'Fetching RNG info for Generic Unix'

      # Combine checks into a single command
      cmd = <<~CMD
        test -e /dev/random && echo random_exists=true || echo random_exists=false
        dmesg | grep -i rng
      CMD
      output = inspec.command(cmd).stdout.split("\n")
      random_exists = output[0].include?('random_exists=true')
      dmesg_output = output[1..-1].join("\n")

      rng_sources = random_exists ? ['/dev/random'] : []
      active_rng = random_exists ? '/dev/random' : nil
      rng_type = dmesg_output.empty? ? 'unknown' : 'hardware'

      {
        exists: random_exists,
        available: random_exists,
        type: rng_type, # NOTE: removed rng_ prefix
        sources: rng_sources, # NOTE: removed rng_ prefix
        active_rng: active_rng,
        entropy_available: nil,
        service_running: nil,
        support_services: [],
        dmesg_output: dmesg_output
      }
    end
  end

  # Custom RSpec Matchers
  RSpec::Matchers.define :exist do
    match(&:exist?)
  end

  RSpec::Matchers.define :be_available do
    match(&:available?)
  end

  RSpec::Matchers.define :be_hardware do
    match(&:is_hardware?)
  end

  RSpec::Matchers.define :be_software do
    match(&:is_software?)
  end

  RSpec::Matchers.define :be_cprng do
    match(&:is_cprng?)
  end

  RSpec::Matchers.define :have_sources do
    match(&:has_sources?)

    failure_message do |rng|
      "expected RNG to have sources, but found #{rng.sources.inspect}"
    end
  end

  RSpec::Matchers.define :have_service_running do
    match(&:has_service_running?)

    failure_message do |rng|
      "expected RNG service to be running, but service status is #{rng.service_running.inspect}"
    end
  end

  RSpec::Matchers.define :have_support_services do
    match(&:has_support_services?)

    failure_message do |rng|
      "expected RNG to have support services, but found #{rng.support_services.inspect}"
    end
  end
end
