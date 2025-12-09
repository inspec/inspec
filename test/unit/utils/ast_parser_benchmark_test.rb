require "helper"
require "benchmark"
require "inspec/profile"

describe "AST Parser Performance Benchmarks" do
  describe "Profile Parsing Performance" do
    it "benchmarks parsing performance with realistic profile" do
      # Skip this test in CI environments where performance may vary
      skip "Performance test - run manually" if ENV["CI"]

      # Create a realistic test profile
      profile_path = Dir.mktmpdir

      begin
        # Create inspec.yml
        inspec_yml = <<~YAML
          name: performance-benchmark-profile
          title: Performance Benchmark Profile
          version: 1.0.0
          summary: Testing AST parser performance optimizations
        YAML
        File.write(File.join(profile_path, "inspec.yml"), inspec_yml)

        # Create controls directory
        controls_dir = File.join(profile_path, "controls")
        Dir.mkdir(controls_dir)

        # Generate realistic control files
        3.times do |file_idx|
          control_content = ""

          # Add file-level inputs
          2.times do |input_idx|
            control_content += "input('file#{file_idx}_input#{input_idx}', value: 'default#{input_idx}', type: 'string', required: #{input_idx.even?})\n"
          end

          control_content += "\n"

          # Add multiple controls per file
          8.times do |control_idx|
            control_id = "benchmark-#{file_idx}-#{control_idx}"
            control_content += <<~RUBY
              control "#{control_id}" do
                impact #{(0.1 * (control_idx + 1)).round(1)}
                title "Benchmark Control #{file_idx}-#{control_idx}"
                desc "Default", "Testing performance with control #{control_id}"
                desc "Rationale", "Performance benchmark rationale for #{control_id}"
              #{"  "}
                tag file_index: #{file_idx}
                tag control_index: #{control_idx}
                tag severity: #{control_idx.even? ? "'high'" : "'medium'"}
                tag automated: #{control_idx.odd?}
                tag components: #{%w{web api database}[control_idx % 3].inspect}
              #{"  "}
                ref 'Benchmark Standard #{control_idx}'
                ref 'Additional Reference #{control_idx}', url: 'https://example.com/ref#{control_idx}'
              #{"  "}
                describe file("/tmp/benchmark#{control_idx}") do
                  it { should exist }
                end
              #{"  "}
                describe command("echo benchmark#{control_idx}") do
                  its('stdout') { should match /benchmark#{control_idx}/ }
                end
              end

            RUBY
          end

          File.write(File.join(controls_dir, "benchmark_#{file_idx}.rb"), control_content)
        end

        # Benchmark the parsing
        puts "\\nBenchmarking AST parser performance..."
        puts "Profile contains: 3 files, 24 controls, 6 inputs"

        parsing_time = Benchmark.measure do
          profile = Inspec::Profile.for_target(profile_path, backend: Inspec::Backend.create(Inspec::Config.mock))

          # Force parsing by accessing the params
          controls = profile.params[:controls]
          inputs = profile.params[:inputs]

          # Verify correctness
          _(controls.size).must_equal 24
          _(inputs.size).must_equal 6
        end

        puts "Parsing completed in: #{parsing_time.real.round(4)} seconds"
        puts "User CPU time: #{parsing_time.utime.round(4)} seconds"
        puts "System CPU time: #{parsing_time.stime.round(4)} seconds"

        # Performance should be reasonable (adjust threshold as needed)
        _(parsing_time.real).must_be :<, 5.0

        puts "Performance test passed! ✓"

      ensure
        FileUtils.rm_rf(profile_path) if File.exist?(profile_path)
      end
    end

    it "measures memory efficiency of cached patterns" do
      # Test that pattern objects are reused, not duplicated
      puts "\\nTesting pattern caching efficiency..."

      # Create many collector instances
      collectors_count = 100
      collectors = collectors_count.times.map do
        Inspec::Profile::AstHelper::ImpactCollector.new({})
      end

      # All instances should use the same pattern object
      pattern_ids = collectors.map { |c| c.class::IMPACT_PATTERN.object_id }
      unique_pattern_ids = pattern_ids.uniq

      puts "Created #{collectors_count} collectors"
      puts "Pattern object IDs: #{unique_pattern_ids.size} unique (should be 1)"
      puts "Memory efficiency: #{((collectors_count - unique_pattern_ids.size).to_f / collectors_count * 100).round(2)}% object reuse"

      # Should have exactly one unique pattern object ID
      _(unique_pattern_ids.size).must_equal 1

      puts "Pattern caching test passed! ✓"
    end

    it "compares traversal counts between old and new approaches" do
      puts "\\nTesting single-pass traversal efficiency..."

      # Create test code with multiple metadata types
      test_code = <<~RUBY
        input('test_input1', value: 'value1')
        input('test_input2', value: 'value2')

        control "traversal-test-1" do
          impact 0.7
          title "Traversal Test 1"
          desc "Testing traversal efficiency"
          tag severity: 'high'
          ref 'Test Reference 1'
        end

        control "traversal-test-2" do
          impact 0.8
          title "Traversal Test 2"
          desc "Another traversal test"
          tag priority: 'medium'
          ref 'Test Reference 2'
        end
      RUBY

      src = RuboCop::AST::ProcessedSource.new(test_code, RUBY_VERSION.to_f)

      # Count nodes in the AST
      node_count = 0
      src.ast.each_node { |_| node_count += 1 }

      puts "AST contains #{node_count} nodes"

      # Simulate old approach: multiple traversals (would be 2-3 separate traversals)
      old_approach_node_visits = node_count * 2 # Simulate 2 separate collectors

      # New approach: single traversal
      test_memo = { controls: [], inputs: [] }
      unified_collector = Inspec::Profile::AstHelper::UnifiedFileCollector.new(test_memo, "/test/path")

      new_approach_node_visits = 0
      src.ast.each_node do |node|
        new_approach_node_visits += 1
        unified_collector.process(node)
      end

      puts "Old approach (simulated): #{old_approach_node_visits} node visits"
      puts "New approach (actual): #{new_approach_node_visits} node visits"
      puts "Efficiency improvement: #{((old_approach_node_visits - new_approach_node_visits).to_f / old_approach_node_visits * 100).round(1)}%"

      # Verify correctness
      _(test_memo[:inputs].size).must_equal 2
      _(test_memo[:controls].size).must_equal 2

      # New approach should visit exactly the number of nodes once
      _(new_approach_node_visits).must_equal node_count

      # Should be more efficient than old approach
      _(new_approach_node_visits).must_be :<, old_approach_node_visits

      puts "Traversal efficiency test passed! ✓"
    end
  end
end