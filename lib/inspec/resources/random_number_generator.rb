# TODO: Add when we have a Windows RNG implementation
# require "inspec/resources/powershell"
require "hashie/mash"

module Inspec::Resources
  # rubocop:disable Metrics/MethodLength

  module RNGManagementSelector
    def select_rng_manager(os)
      Inspec::Log.debug "Selecting RNG manager for OS: #{os[:family]}"
      if os.linux?
        LinuxRNG.new(inspec)
      elsif os.windows?
        WindowsRNG.new(inspec)
      elsif os[:family] == "darwin"
        MacOSRNG.new(inspec)
      elsif os[:family] == "freebsd"
        FreeBSDRNG.new(inspec)
      else
        GenericUnixRNG.new(inspec)
      end
    end
  end

  class RandomNumberGenerator < Inspec.resource(1)
    include RNGManagementSelector

    name "random_number_generator"
    supports platform: "unix"
    # TODO: Add support for Windows RNG through testing
    # The Windows RNG implementation is untested and may not work as expected.
    # supports platform: 'windows'

    desc "Tests the presence and status of a random number generator."
    example <<~EXAMPLE
      # General usage
      describe random_number_generator do
        it { should exist }
        it { should be_available }
        it { should have_entropy }
        it { should have_sources }
        it { should have_services }
        it { should be_running }
        its('type') { should match(/hardware|csprng|software/) }
        its('sources') { should include '/dev/random' }
      end

      # Platform-specific tests
      describe random_number_generator do
        # Linux/FreeBSD hardware tests
        it { should be_hardware } if ['linux', 'freebsd'].include?(os[:family])

        # macOS CSPRNG tests
        if os[:family] == 'darwin'
          it { should be_csprng }
          its('sources') { should include '/dev/random' }
          its(%w[csprng_status system]) { should match(/^macOS/) }
          its(%w[csprng_status architecture]) { should match(/(Apple Silicon|Intel)/) }
          its(%w[csprng_status random_subsystem]) { should_not be_empty }
          # Intel-specific tests
          if its(%w[csprng_status architecture]) == 'Intel'
            its('sources') { should include 'RDRAND' }
          end
        end
      end

      # Windows tests (future implementation)
      if os.windows?
        describe random_number_generator do
          it { should exist }
          it { should be_available }
          it { should be_running }
          its('services') { should include 'CryptoSvc' }
          its('sources') { should include 'CryptoAPI' }
          # Hardware RNG checks
          its('sources') { should match /'TPM|RDRAND'/ }
        end
      end
    EXAMPLE

    attr_reader :rng_info

    # provide as this is a standard in inspec resources generally
    alias params rng_info

    def initialize
      super()
      Inspec::Log.debug "Initializing RandomNumberGenerator resource"
      @rng_provider = select_rng_manager(inspec.os)
      skip_resource "The `random_number_generator` resource is not supported on your OS yet." if @rng_provider.nil?

      @cached_results = {} # Initialize the cache hash
      @rng_info = Hashie::Mash.new(@rng_provider.rng_info)
      Inspec::Log.debug "RNG info: #{@rng_info}"
    end

    # Core property readers - using method_missing for dynamic property access
    def method_missing(method_name, *args)
      return super unless respond_to_missing?(method_name)

      @cached_results[method_name] ||= begin
        property_name = method_name.to_s.gsub(/\?$/, "")
        Inspec::Log.debug "Accessing property: #{property_name}"
        @rng_info[property_name.to_sym]
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      property_name = method_name.to_s.gsub(/\?$/, "")
      @rng_info.key?(property_name.to_sym) || super
    end

    # Primary state checks
    def exist?
      Inspec::Log.debug "Checking if RNG exists"
      @rng_info.exist
    end

    def available?
      Inspec::Log.debug "Checking if RNG is available"
      @rng_info.available
    end

    # Type checks
    def hardware?
      Inspec::Log.debug "Checking if RNG type is hardware"
      type == "hardware"
    end

    def software?
      Inspec::Log.debug "Checking if RNG type is software"
      type == "software"
    end

    def csprng?
      Inspec::Log.debug "Checking if RNG type is CSPRNG"
      type == "csprng"
    end

    # Resource state checks
    def has_entropy?
      Inspec::Log.debug "Checking if entropy is available"
      !entropy.nil? && entropy > 0
    end

    def has_sources?
      Inspec::Log.debug "Checking if RNG has sources"
      sources&.any?
    end

    def has_services?
      Inspec::Log.debug "Checking if RNG has services"
      services&.any?
    end

    def running?
      Inspec::Log.debug "Checking if RNG service is running"
      !!running
    end

    def value(key)
      return @rng_info unless key

      # Handle array access for nested properties
      if key.is_a?(Array)
        current = @rng_info
        key.each { |k| current = current[k] if current }
        current
      else
        @rng_info[key]
      end
    end

    def [](name, *rest)
      return value(name) if rest.empty?

      # Handle array-style access for nested properties
      current = params
      Array([name, *rest]).each do |key|
        return nil unless current.respond_to?(:[])

        current = current[key]
        return nil if current.nil? # Return nil early if any part of the path is nil
      end
      current
    end

    def to_s
      "Random Number Generator (#{type})"
    end

    private

    def collect_rng_details
      Inspec::Log.debug "Collecting RNG details"
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
      @rng_info ||= begin
        base_info = default_info.merge(collect_platform_info)
        Hashie::Mash.new(base_info)
      end
    end

    protected

    def default_info
      {
        exist: false,
        available: false,
        type: "unknown",
        sources: [],
        active: nil,
        entropy: nil,
        running: nil,
        services: [],
      }
    end

    # Platform implementations can extend with their specific properties
    def collect_platform_info
      {}
    end
  end

  # --- Linux Implementation ---
  class LinuxRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug "Initializing LinuxRNG"
    end

    protected

    def collect_platform_info
      # Combine file existence checks into a single command
      file_checks = {
        hw: "/dev/hwrng", # Was hw_random
        intel: "/dev/intel-rng", # Was intel_rng
        tpm: "/dev/tpm0", # Was tpm_rng
      }
      file_check_cmd = file_checks.map do |key, file|
        "test -e #{file} && echo #{key}=true || echo #{key}=false"
      end.join(" && ")
      file_check_output = inspec.command(file_check_cmd).stdout.split("\n").map { |line| line.split("=") }.to_h
      hw = file_check_output["hw"] == "true"
      intel = file_check_output["intel"] == "true"
      tpm = file_check_output["tpm"] == "true"

      # Combine system file reads into a single command
      system_files = {
        active: "/sys/devices/virtual/misc/hw_random/rng_current", # Was active_rng
        available: "/sys/devices/virtual/misc/hw_random/rng_available", # Was rng_available
        entropy: "/proc/sys/kernel/random/entropy_avail", # Was entropy_available
      }
      system_file_cmd = system_files.map { |key, file| "echo #{key}=$(cat #{file} || echo -n)" }.join(" && ")
      system_file_output = inspec.command(system_file_cmd).stdout.split("\n").map { |line| line.split("=", 2) }.to_h
      active = system_file_output["active"]
      available = system_file_output["available"].split
      entropy = system_file_output["entropy"].to_i

      # Check services in parallel
      services = %w{rngd haveged jitterentropy}
      service_cmds = services.map do |service|
        "systemctl show --no-pager --all #{service} && systemctl is-active #{service} --quiet && systemctl is-enabled #{service} --quiet"
      end
      service_cmd = service_cmds.join(" & ")
      service_output = inspec.command(service_cmd).stdout.split("\n")
      rngd_running = service_output.any? { |line| line.include?("rngd") && line.include?("active") }
      haveged_running = service_output.any? { |line| line.include?("haveged") && line.include?("active") }
      jitterentropy_running = service_output.any? { |line| line.include?("jitterentropy") && line.include?("active") }

      sources = ["/dev/random", "/dev/urandom"]
      sources << "/dev/hwrng" if hw
      sources << "/dev/intel-rng" if intel
      sources << "/dev/tpm0" if tpm

      type = if hw || intel || tpm || !available.empty?
               "hardware"
             else
               "software"
             end

      services = []
      services << "rngd" if rngd_running
      services << "haveged" if haveged_running
      services << "jitterentropy" if jitterentropy_running

      {
        exist: !sources.empty?,
        available: !entropy.nil? && entropy > 0,
        type: type,
        sources: sources,
        active: active,
        entropy: entropy,
        running: rngd_running || haveged_running || jitterentropy_running,
        services: services,
      }
    end
  end

  # --- FreeBSD Implementation ---
  class FreeBSDRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug "Initializing FreeBSDRNG"
    end

    protected

    def collect_platform_info
      # Combine checks into a single command
      cmd = <<~CMD
        kldstat | grep random && echo yarrow_loaded=true || echo yarrow_loaded=false
        dmesg | grep -i rdrand && echo rdrand_available=true || echo rdrand_available=false
        test -e /dev/intel-rng && echo intel_rng=true || echo intel_rng=false
      CMD
      output = inspec.command(cmd).stdout.split("\n").map { |line| line.split("=") }.to_h
      yarrow_loaded = output["yarrow_loaded"] == "true"
      rdrand_available = output["rdrand_available"] == "true"
      intel_rng = output["intel_rng"] == "true"

      sources = []
      sources << "/dev/random" if cached_file("/dev/random").exist?
      sources << "/dev/urandom" if cached_file("/dev/urandom").exist?
      sources << "RDRAND" if rdrand_available
      sources << "intel-rng" if intel_rng

      type = if rdrand_available || intel_rng
               "hardware"
             elsif yarrow_loaded
               "software"
             else
               "unknown"
             end

      {
        exist: !sources.empty?,
        available: !sources.empty?,
        type: type,
        sources: sources,
        active: yarrow_loaded ? "Yarrow" : nil,
        running: yarrow_loaded,
      }
    end
  end

  # --- macOS Implementation ---
  class MacOSRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug "Initializing MacOSRNG"
    end

    protected

    def collect_platform_info
      # Get system information first
      os_info = inspec.command("sw_vers -productVersion").stdout.strip
      uname = inspec.command("uname -a").stdout.strip
      arch = uname.include?("ARM64") ? "Apple Silicon" : "Intel"
      kernel_version = begin
        uname.match(/Kernel Version ([^;]+)/)[1].strip
                       rescue StandardError
                         "unknown"
      end

      # Check random device
      random_exist = inspec.file("/dev/random").exist?
      rdrand_available = arch == "Intel" && inspec.command("sysctl -n hw.optional.rdrand").stdout.include?("1")

      # Try to get random subsystem info, but don't rely on it
      random_info = inspec.command("sysctl kern.random").stdout
      random_subsystem = random_info.empty? ? "Not exposed via sysctl" : random_info.strip

      # Build sources array
      sources = []
      sources << "/dev/random" if random_exist
      sources << "RDRAND" if rdrand_available

      # Don't convert to JSON string, keep as hash
      {
        exist: random_exist,
        available: random_exist,
        type: "csprng",
        sources: sources, # Now sources is properly defined
        active: random_exist ? "/dev/random" : nil,
        running: true,
        csprng_status: {
          system: "macOS #{os_info}",
          architecture: arch,
          kernel: kernel_version,
          random_subsystem: random_subsystem,
        },
      }
    end
  end

  # --- Windows Implementation ---
  # TODO: Add support for Windows RNG through testing
  class WindowsRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug "Initializing WindowsRNG"
    end

    protected

    def collect_platform_info
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
      return default_info unless result.exit_status == 0

      begin
        rng_data = JSON.parse(result.stdout)
        sources = []
        sources << "CryptoAPI" if rng_data["CryptoAPI"]
        sources << "TPM" if rng_data["TPM"]
        sources << "RDRAND" if rng_data["RDRAND"]

        active = if rng_data["TPM"]
                   "TPM"
                 elsif rng_data["RDRAND"]
                   "RDRAND"
                 elsif rng_data["CryptoAPI"]
                   "CryptoAPI"
                 end

        type = if rng_data["TPM"] || rng_data["RDRAND"]
                 "hardware"
               elsif rng_data["CryptoAPI"]
                 "csprng"
               else
                 "unknown"
               end

        cng_properties = inspec.powershell("Get-CNGProperty -ProviderName Microsoft Primitive Provider").stdout

        {
          exist: !sources.empty?,
          available: !sources.empty?,
          type: type,
          sources: sources,
          active: active,
          running: true,
          services: ["CryptoSvc"],
          cng_properties: cng_properties,
        }
      rescue StandardError
        default_info
      end
    end

    private

    def default_info
      Inspec::Log.debug "Returning default RNG info for Windows"
      {
        exist: false,
        available: false,
        type: "unknown",
        sources: [],
        active: nil,
        entropy: nil,
        running: nil,
        services: [],
        csprng_status: nil,
        cng_properties: nil,
      }
    end

    protected

    def platform_info
      {
        cng_properties: collect_cng_properties,
      }
    end
  end

  # --- Generic Unix Fallback ---
  class GenericUnixRNG < RNGInfo
    def initialize(inspec)
      super(inspec)
      Inspec::Log.debug "Initializing GenericUnixRNG"
    end

    protected

    def collect_platform_info
      # Combine checks into a single command
      cmd = <<~CMD
        test -e /dev/random && echo random_exist=true || echo random_exist=false
        dmesg | grep -i rng
      CMD
      output = inspec.command(cmd).stdout.split("\n")
      random_exist = output[0].include?("random_exist=true")
      dmesg_output = output[1..-1].join("\n")

      sources = random_exist ? ["/dev/random"] : []
      active = random_exist ? "/dev/random" : nil # Was active_rng
      type = dmesg_output.empty? ? "unknown" : "hardware"

      {
        exist: random_exist,
        available: random_exist,
        type: type,
        sources: sources,
        active: active,
        running: nil,
        dmesg_output: dmesg_output,
      }
    end
  end
end
