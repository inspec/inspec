require 'helper'
require 'inspec/resource'
require 'inspec/resources/random_number_generator'

describe 'Inspec::Resources::RandomNumberGenerator' do
  include RNGInfoHelper

  # Test error cases first
  describe 'when platform is not supported' do
    let(:resource) { load_resource('random_number_generator') }

    before do
      MockLoader.mock_os(resource, :undefined)
    end

    it 'skips the resource' do
      _(resource.resource_skipped?).must_equal true
    end
  end

  %i[linux darwin windows].each do |platform|
    describe "on #{platform}" do
      let(:resource) { load_resource('random_number_generator') }
      let(:info) { RNGInfoHelper::RNG_INFO[platform] }

      before do
        # Map our platform symbols to the correct MockLoader OS keys
        os_map = {
          linux: :linux,
          darwin: :macos10_16,
          windows: :windows
        }
        MockLoader.mock_os(resource, os_map[platform])
        resource.instance_variable_set(:@rng_info, Hashie::Mash.new(info))
      end

      # Basic properties
      it 'verifies basic properties' do
        _(resource.exists?).must_equal info[:exists] # Changed from exist
        _(resource.available?).must_equal info[:available]
        _(resource.type).must_equal info[:type]
        _(resource.sources).must_equal info[:sources]
      end

      # Test method aliases
      it 'verifies method aliases' do
        # Use assert_equal for non-nil values
        _(resource.service_running).must_equal resource.running
        _(resource.support_services).must_equal resource.services
        _(resource.has_service_running?).must_equal resource.has_running?
        _(resource.has_support_services?).must_equal resource.has_services?

        # Separate test for entropy_available which might be nil
        if resource.entropy.nil?
          assert_nil resource.entropy_available
        else
          assert_equal resource.entropy, resource.entropy_available
        end
      end

      # Test array access
      it 'supports array-style access' do
        _(resource[:type]).must_equal info[:type]
        _(resource[:sources]).must_equal info[:sources]
        _(resource['type']).must_equal info[:type]
        assert_nil resource['nonexistent'] # Changed to assert_nil
      end

      # Test edge cases for property access
      it 'handles missing or invalid properties gracefully' do
        assert_nil resource['nonexistent']
        assert_nil resource[:nonexistent]
        assert_nil resource['invalid.path']
        assert_nil resource['no', 'such', 'path'] # Changed to use commas instead of chained []
      end

      # Test nested property access
      it 'supports nested property access' do
        case platform
        when :darwin
          _(resource.csprng_status['system']).must_match(/^macOS/)
          _(resource['csprng_status']['architecture']).must_match(/(Apple Silicon|Intel)/)
        when :windows
          _(resource['services']).must_equal ['CryptoSvc']
        when :linux
          _(resource['services']).must_equal info[:services]
        end
      end

      # Test to_s
      it 'has a proper string representation' do
        _(resource.to_s).must_equal "Random Number Generator (#{info[:type]})"
      end

      # Platform specific tests
      case platform
      when :linux
        describe 'linux specific properties' do
          it 'verifies entropy properties' do
            _(resource.entropy_available).must_equal info[:entropy]
            _(resource.entropy_available?).must_equal true
          end

          it 'verifies service properties' do
            _(resource.services).must_equal info[:services]
            _(resource.running).must_equal info[:running]
          end

          it 'verifies hardware detection' do
            _(resource.is_hardware?).must_equal true if info[:type] == 'hardware'
          end
        end

      when :darwin
        describe 'macOS specific properties' do
          it 'verifies CSPRNG status' do
            _(resource.csprng_status.system).must_match(/^macOS/)
            _(resource.csprng_status.architecture).must_match(/(Apple Silicon|Intel)/)
            assert_nil resource.csprng_status.nonexistent
            _(resource.csprng_status.random_subsystem).wont_be_empty  # Changed expectation
          end

          it 'verifies entropy is not available' do
            assert_nil resource.entropy_available
            _(resource.entropy_available?).must_equal false
          end

          it 'verifies CSPRNG type' do
            _(resource.is_csprng?).must_equal true
          end
        end

      when :windows
        describe 'Windows specific properties' do
          it 'verifies CNG properties' do
            _(resource.cng_properties).must_equal info[:cng_properties]
          end

          it 'verifies Windows services' do
            _(resource.services).must_equal ['CryptoSvc']
          end

          it 'has correct RNG type' do
            _(resource.is_hardware?).must_equal true if info[:type] == 'hardware'
            _(resource.is_csprng?).must_equal true if info[:type] == 'csprng'
          end
        end
      end
    end
  end
end
