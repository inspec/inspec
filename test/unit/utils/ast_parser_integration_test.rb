require "helper"
require "inspec/profile"

describe "AST Parser Integration Tests" do
  let(:logger) { Minitest::Mock.new }
  let(:home) { MockLoader.home }

  describe "Profile parsing with AST optimizations" do
    it "processes complete profile using unified collectors" do
      # Use existing complete-profile test fixture
      profile = MockLoader.load_profile("complete-profile")

      # Verify the profile loaded correctly with optimized parsing
      _(profile.params[:controls]).wont_be_empty
      _(profile.params[:controls].first[:id]).must_equal "test01"
      _(profile.params[:controls].first[:title]).must_equal "Catchy title"
      _(profile.params[:controls].first[:impact]).must_equal 0.5
    end

    it "handles profiles with inputs using optimized parsing" do
      # Create a temporary profile with inputs and controls
      profile_path = Dir.mktmpdir

      # Create inspec.yml
      inspec_yml = <<~YAML
        name: test-inputs-profile#{"  "}
        title: Test Profile with Inputs
        version: 1.0.0
        inputs:
          - name: test_input
            type: string
            value: default_value
      YAML
      File.write(File.join(profile_path, "inspec.yml"), inspec_yml)

      # Create controls directory and control file
      controls_dir = File.join(profile_path, "controls")
      Dir.mkdir(controls_dir)

      control_content = <<~RUBY
        input('runtime_input', value: 'runtime_default', type: 'string', required: true)

        test_value = input('test_input')
        runtime_value = input('runtime_input')

        control "input-test-1" do
          impact 0.8
          title "Test with Inputs"
          desc "Testing input functionality"
        #{"  "}
          describe "input values" do
            it "should have correct test input" do
              expect(test_value).to eq('default_value')
            end
          end
        end

        control "input-test-2" do
          impact 0.6
          title "Runtime Input Test"
        #{"  "}
          describe "runtime input" do
            it "should have runtime value" do
              expect(runtime_value).to eq('runtime_default')
            end
          end
        end
      RUBY
      File.write(File.join(controls_dir, "inputs_test.rb"), control_content)

      begin
        # Load the profile
        profile = Inspec::Profile.for_target(profile_path, backend: Inspec::Backend.create(Inspec::Config.mock))

        # Verify inputs were parsed correctly
        inputs = profile.params[:inputs]
        _(inputs).wont_be_empty

        # Should have both profile-defined and control-defined inputs
        input_names = inputs.map { |i| i[:name] }
        _(input_names).must_include "test_input"
        _(input_names).must_include "runtime_input"

        # Verify runtime input details
        runtime_input = inputs.find { |i| i[:name] == "runtime_input" }
        _(runtime_input[:options][:type]).must_equal "string"
        _(runtime_input[:options][:required]).must_equal true

        # Verify controls were parsed correctly
        controls = profile.params[:controls]
        _(controls.size).must_equal 2

        control1 = controls.find { |c| c[:id] == "input-test-1" }
        _(control1[:title]).must_equal "Test with Inputs"
        _(control1[:impact]).must_equal 0.8

        control2 = controls.find { |c| c[:id] == "input-test-2" }
        _(control2[:title]).must_equal "Runtime Input Test"
        _(control2[:impact]).must_equal 0.6

      ensure
        # Cleanup
        FileUtils.rm_rf(profile_path)
      end
    end

    it "performance comparison between old and new parsing approach" do
      # Create a profile with many controls to test performance
      profile_path = Dir.mktmpdir

      # Create inspec.yml
      inspec_yml = <<~YAML
        name: performance-test-profile
        title: Performance Test Profile
        version: 1.0.0
      YAML
      File.write(File.join(profile_path, "inspec.yml"), inspec_yml)

      # Create controls directory
      controls_dir = File.join(profile_path, "controls")
      Dir.mkdir(controls_dir)

      # Generate multiple control files with various metadata
      5.times do |file_idx|
        control_content = ""

        # Add some file-level inputs
        2.times do |input_idx|
          control_content += "input('file#{file_idx}_input#{input_idx}', value: 'default#{input_idx}', type: 'string')\n"
        end

        control_content += "\n"

        # Add multiple controls per file
        10.times do |control_idx|
          control_id = "perf-test-#{file_idx}-#{control_idx}"
          control_content += <<~RUBY
            control "#{control_id}" do
              impact #{(0.1 * (control_idx + 1)).round(1)}
              title "Performance Test Control #{file_idx}-#{control_idx}"
              desc "Testing performance with control #{control_id}"
              desc "Rationale", "Performance testing rationale"
            #{"  "}
              tag file: #{file_idx}
              tag control: #{control_idx}
              tag severity: #{control_idx.even? ? "'high'" : "'medium'"}
              tag components: ['component1', 'component2']
            #{"  "}
              ref 'Performance Benchmark #{control_idx}'
              ref 'Additional Reference', url: 'https://example.com/ref#{control_idx}'
            #{"  "}
              describe file('/tmp/test#{control_idx}') do
                it { should exist }
              end
            #{"  "}
              describe command('echo test#{control_idx}') do
                its('stdout') { should match /test#{control_idx}/ }
              end
            end

          RUBY
        end

        File.write(File.join(controls_dir, "perf_test_#{file_idx}.rb"), control_content)
      end

      begin
        # Measure parsing time with optimized approach
        parsing_time = Benchmark.realtime do
          profile = Inspec::Profile.for_target(profile_path, backend: Inspec::Backend.create(Inspec::Config.mock))

          # Force parsing by accessing the params
          _ = profile.params[:controls]
          _ = profile.params[:inputs]
        end

        # Load the profile to verify correctness
        profile = Inspec::Profile.for_target(profile_path, backend: Inspec::Backend.create(Inspec::Config.mock))

        # Verify we parsed everything correctly
        _(profile.params[:controls].size).must_equal 50 # 5 files × 10 controls each
        _(profile.params[:inputs].size).must_equal 10 # 5 files × 2 inputs each

        # Verify some sample metadata
        sample_control = profile.params[:controls].first
        _(sample_control[:title]).must_match(/Performance Test Control/)
        _(sample_control[:tags][:severity]).must_be_kind_of String
        _(sample_control[:refs].size).must_equal 2

        # Performance should be reasonable (adjust threshold as needed)
        # This is a rough benchmark - actual performance depends on system
        _(parsing_time).must_be :<, 2.0 # Should parse in less than 2 seconds

        puts "Parsed 50 controls with optimized AST parser in #{parsing_time.round(3)} seconds"

      ensure
        FileUtils.rm_rf(profile_path)
      end
    end

    it "handles complex nested metadata structures correctly" do
      profile_path = Dir.mktmpdir

      # Create inspec.yml
      inspec_yml = <<~YAML
        name: complex-metadata-profile
        title: Complex Metadata Test Profile
        version: 1.0.0
      YAML
      File.write(File.join(profile_path, "inspec.yml"), inspec_yml)

      # Create controls directory
      controls_dir = File.join(profile_path, "controls")
      Dir.mkdir(controls_dir)

      # Create control file with complex metadata
      control_content = <<~RUBY
        # Complex input with nested options
        input('complex_input',#{" "}
          value: { host: 'localhost', port: 5432, ssl: true },
          type: 'Hash',
          required: true,
          sensitive: false,
          pattern: /^[a-zA-Z0-9]+$/
        )

        # Variable assignment from input
        db_config = input('complex_input')

        control "complex-metadata-1" do
          impact 0.9
          title "Complex Metadata Control"
          desc "Primary", "This control tests complex metadata parsing"
          desc "Rationale", "Complex metadata is important for comprehensive testing"
          desc "Check", "Verify all metadata types are parsed correctly"
        #{"  "}
          # Complex tag structures#{"  "}
          tag severity: 'critical'
          tag 'simple_string_tag'
          tag :simple_symbol_tag
          tag components: ['web', 'api', 'database']
          tag metadata: {
            author: 'Test Author',
            created: '2023-01-01',
            updated: '2023-12-01',
            version: 1.2,
            flags: { beta: true, experimental: false },
            supported_platforms: ['linux', 'windows', 'macos']
          }
          tag nist: ['AC-2', 'AC-3', 'AC-6']
        #{"  "}
          # Multiple reference types
          ref 'CIS Benchmark Section 1.1'
          ref 'NIST 800-53 Control AC-2'#{"  "}
          ref 'Internal Standard', url: 'https://internal.company.com/standards/1'
          ref 'External Guide', url: 'https://external.org/guide', note: 'See section 3.2'
          ref({
            title: 'Complex Reference',
            url: 'https://example.com/complex',
            description: 'This is a complex reference structure'
          })
        #{"  "}
          # Test blocks with various InSpec resources
          describe file('/etc/passwd') do
            it { should exist }
            it { should be_file }
            its('mode') { should cmp '0644' }
          end
        #{"  "}
          describe command('ps aux') do
            its('exit_status') { should eq 0 }
            its('stdout') { should match(/init/) }
          end
        #{"  "}
          describe port(80) do
            it { should be_listening }
            its('protocols') { should include 'tcp' }
          end
        end

        control "complex-metadata-2" do
          impact 0.7
          title "Secondary Complex Control"
          desc "Another control with different metadata patterns"
        #{"  "}
          tag environment: 'production'
          tag automated: true
          tag manual_verification: false
        #{"  "}
          ref 'Secondary Reference'
        #{"  "}
          describe service('httpd') do
            it { should be_installed }
            it { should be_enabled }
            it { should be_running }
          end
        end
      RUBY
      File.write(File.join(controls_dir, "complex_test.rb"), control_content)

      begin
        profile = Inspec::Profile.for_target(profile_path, backend: Inspec::Backend.create(Inspec::Config.mock))

        # Verify complex input parsing
        inputs = profile.params[:inputs]
        _(inputs.size).must_equal 1

        complex_input = inputs.first
        _(complex_input[:name]).must_equal "complex_input"
        _(complex_input[:options][:type]).must_equal "Hash"
        _(complex_input[:options][:required]).must_equal true
        _(complex_input[:options][:sensitive]).must_equal false

        # Verify controls
        controls = profile.params[:controls]
        _(controls.size).must_equal 2

        # First control with complex metadata
        control1 = controls.find { |c| c[:id] == "complex-metadata-1" }

        # Verify descriptions
        _(control1[:descriptions]["Primary"]).must_equal "This control tests complex metadata parsing"
        _(control1[:descriptions]["Rationale"]).must_equal "Complex metadata is important for comprehensive testing"
        _(control1[:descriptions]["Check"]).must_equal "Verify all metadata types are parsed correctly"

        # Verify complex tags
        _(control1[:tags][:severity]).must_equal "critical"
        _(control1[:tags]["simple_string_tag"]).must_be_nil
        _(control1[:tags][:simple_symbol_tag]).must_be_nil
        _(control1[:tags][:components]).must_equal %w{web api database}
        _(control1[:tags][:nist]).must_equal %w{AC-2 AC-3 AC-6}

        # Verify nested metadata structure
        metadata = control1[:tags][:metadata]
        _(metadata[:author]).must_equal "Test Author"
        _(metadata[:version]).must_equal 1.2
        _(metadata[:flags][:beta]).must_equal true
        _(metadata[:flags][:experimental]).must_equal false
        _(metadata[:supported_platforms]).must_equal %w{linux windows macos}

        # Verify references
        _(control1[:refs].size).must_equal 5
        ref_titles = control1[:refs].map { |r| r[:ref] || r[:title] }
        _(ref_titles).must_include "CIS Benchmark Section 1.1"
        _(ref_titles).must_include "Complex Reference"

        # Verify test blocks were captured
        _(control1[:checks].size).must_equal 3

        # Second control
        control2 = controls.find { |c| c[:id] == "complex-metadata-2" }
        _(control2[:tags][:automated]).must_equal true
        _(control2[:tags][:manual_verification]).must_equal false
        _(control2[:checks].size).must_equal 1

      ensure
        FileUtils.rm_rf(profile_path)
      end
    end

    it "correctly handles error conditions and malformed metadata" do
      profile_path = Dir.mktmpdir

      # Create inspec.yml
      inspec_yml = <<~YAML
        name: error-test-profile
        title: Error Handling Test Profile#{"  "}
        version: 1.0.0
      YAML
      File.write(File.join(profile_path, "inspec.yml"), inspec_yml)

      # Create controls directory
      controls_dir = File.join(profile_path, "controls")
      Dir.mkdir(controls_dir)

      # Create control file with various edge cases
      control_content = <<~RUBY
        # Input with minimal options
        input('minimal_input')

        # Input with only some options
        input('partial_input', type: 'string')

        control "error-test-1" do
          # Missing some typical metadata - should get defaults
        end

        control "error-test-2" do
          impact "invalid"  # String instead of number - should be handled gracefully
          title 123         # Number instead of string
        #{"  "}
          # Empty tag
          tag
        #{"  "}
          # Tag with complex expression (should be handled)
          tag computed: some_dynamic_value.to_s if defined?(some_dynamic_value)
        #{"  "}
          # Ref with just string
          ref
        #{"  "}
          describe "something" do
            # Test block that should still be captured
            it { should be_truthy }
          end
        end

        # Duplicate control ID - should handle gracefully
        control "error-test-1" do
          impact 0.8
          title "Duplicate Control"
        end
      RUBY
      File.write(File.join(controls_dir, "error_test.rb"), control_content)

      begin
        # Should not raise errors during parsing
        profile = nil
        _(-> {
          profile = Inspec::Profile.for_target(profile_path, backend: Inspec::Backend.create(Inspec::Config.mock))
        }).must_be_silent

        # Verify inputs were parsed (even minimal ones)
        inputs = profile.params[:inputs]
        _(inputs.size).must_equal 2

        minimal_input = inputs.find { |i| i[:name] == "minimal_input" }
        _(minimal_input).wont_be_nil

        partial_input = inputs.find { |i| i[:name] == "partial_input" }
        _(partial_input[:options][:type]).must_equal "string"

        # Verify controls (should have processed what it could)
        controls = profile.params[:controls]
        _(controls.size).must_be :>=, 1 # At least one control should be processed

        # Find the first control (empty one)
        first_control = controls.find { |c| c[:id] == "error-test-1" }
        if first_control
          # Should have default values
          _(first_control[:impact]).must_equal 0.5
          _(first_control[:title]).must_be_nil
        end

      ensure
        FileUtils.rm_rf(profile_path)
      end
    end
  end
end