require "helper"
require "inspec/resource"
require "inspec/resources/random_number_generator"

describe "Inspec::Resources::RandomNumberGenerator" do
  include RNGInfoHelper

  # Test error cases first
  describe "when platform is not supported" do
    let(:resource) { load_resource("random_number_generator") }

    before do
      MockLoader.mock_os(resource, :undefined)
    end

    it "skips the resource" do
      _(resource.resource_skipped?).must_equal true
    end
  end

  # Test each supported platform
  %i{linux darwin windows freebsd unix}.each do |platform|
    describe "on #{platform}" do
      let(:resource) { load_resource("random_number_generator") }
      let(:info) { RNGInfoHelper::RNG_INFO[platform == :unix ? :generic_unix : platform] }

      before do
        # Map our platform symbols to the correct MockLoader OS keys
        os_map = {
          linux: :linux,
          darwin: :macos10_16,
          windows: :windows,
          freebsd: :freebsd,
          unix: :unix,
        }
        MockLoader.mock_os(resource, os_map[platform])
        resource.instance_variable_set(:@rng_info, Hashie::Mash.new(info))
      end

      # Test existence and basic properties
      it "exist? returns expected result" do
        _(resource.exist?).must_equal info[:exist]
      end

      it "available? returns expected result" do
        _(resource.available?).must_equal info[:available]
      end

      it "has expected type" do
        _(resource.type).must_equal info[:type]
      end

      it "has expected sources" do
        _(resource.sources).must_equal info[:sources]
      end

      # Test type-specific checks
      it "correctly identifies RNG type" do
        _(resource.hardware?).must_equal(info[:type] == "hardware")
        _(resource.software?).must_equal(info[:type] == "software")
        _(resource.csprng?).must_equal(info[:type] == "csprng")
      end

      # Test resource state checks
      it "correctly reports service state" do
        _(resource.running?).must_equal !!info[:running]
      end

      it "correctly reports sources state" do
        _(resource.has_sources?).must_equal info[:sources].any?
      end

      it "correctly reports services state" do
        _(resource.has_services?).must_equal info[:services].any?
      end

      # Test entropy handling
      it "correctly handles entropy checks" do
        if info[:entropy].nil?
          _(resource.has_entropy?).must_equal false
        else
          _(resource.has_entropy?).must_equal true
          _(resource.entropy).must_equal info[:entropy]
        end
      end

      # Test property access methods
      it "supports hash-style access" do
        _(resource[:type]).must_equal info[:type]
        _(resource["sources"]).must_equal info[:sources]
      end

      it "handles missing properties gracefully" do
        _(resource["nonexistent"]).must_be_nil
        _(resource[:nonexistent]).must_be_nil
        _(resource["invalid", "path"]).must_be_nil
        _(resource[:no, :such, :property]).must_be_nil
      end

      # Platform-specific tests
      case platform
      when :darwin
        it "has valid CSPRNG status" do
          status = resource.csprng_status
          _(status.system).must_match(/^macOS/)
          _(status.architecture).must_match(/(Apple Silicon|Intel)/)
          _(status.kernel).wont_be_nil
          _(status.random_subsystem).wont_be_empty
        end

      when :windows
        it "has valid CNG properties" do
          _(resource.cng_properties).must_equal info[:cng_properties]
          _(resource.services).must_include "CryptoSvc"
        end

      when :linux
        it "has valid entropy and services" do
          _(resource.entropy).must_equal info[:entropy]
          _(resource.services).must_equal info[:services]
          _(resource.active).must_equal info[:active]
        end
      end

      # Test string representation
      it "has correct string representation" do
        _(resource.to_s).must_equal "Random Number Generator (#{info[:type]})"
      end
    end
  end
end
