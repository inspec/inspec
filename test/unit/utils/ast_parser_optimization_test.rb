require "helper"
require "inspec/utils/profile_ast_helpers"
require "benchmark"

describe "AST Parser Performance Optimizations" do
  let(:memo) { { controls: [], inputs: [] } }
  let(:source_location_ref) { "/test/path/control.rb" }

  describe "NodePattern Caching" do
    it "caches NodePattern instances as constants" do
      # Verify that patterns are defined as constants
      _(Inspec::Profile::AstHelper::ImpactCollector::IMPACT_PATTERN).must_be_instance_of(RuboCop::AST::NodePattern)
      _(Inspec::Profile::AstHelper::DescCollector::DESC_PATTERN).must_be_instance_of(RuboCop::AST::NodePattern)
      _(Inspec::Profile::AstHelper::TitleCollector::TITLE_PATTERN).must_be_instance_of(RuboCop::AST::NodePattern)
      _(Inspec::Profile::AstHelper::TagCollector::TAG_PATTERN).must_be_instance_of(RuboCop::AST::NodePattern)
      _(Inspec::Profile::AstHelper::RefCollector::REF_PATTERN).must_be_instance_of(RuboCop::AST::NodePattern)
      _(Inspec::Profile::AstHelper::InputCollectorBase::INPUT_PATTERN).must_be_instance_of(RuboCop::AST::NodePattern)
    end

    it "patterns are frozen to prevent modification" do
      _(Inspec::Profile::AstHelper::ImpactCollector::IMPACT_PATTERN.frozen?).must_equal true
      _(Inspec::Profile::AstHelper::DescCollector::DESC_PATTERN.frozen?).must_equal true
      _(Inspec::Profile::AstHelper::TitleCollector::TITLE_PATTERN.frozen?).must_equal true
    end

    it "verifies all unified collector patterns are cached" do
      # Verify UnifiedControlCollector uses cached patterns from original collectors
      _(Inspec::Profile::AstHelper::UnifiedControlCollector::IMPACT_PATTERN).must_equal Inspec::Profile::AstHelper::ImpactCollector::IMPACT_PATTERN
      _(Inspec::Profile::AstHelper::UnifiedControlCollector::DESC_PATTERN).must_equal Inspec::Profile::AstHelper::DescCollector::DESC_PATTERN
      _(Inspec::Profile::AstHelper::UnifiedControlCollector::TITLE_PATTERN).must_equal Inspec::Profile::AstHelper::TitleCollector::TITLE_PATTERN
      _(Inspec::Profile::AstHelper::UnifiedControlCollector::TAG_PATTERN).must_equal Inspec::Profile::AstHelper::TagCollector::TAG_PATTERN
      _(Inspec::Profile::AstHelper::UnifiedControlCollector::REF_PATTERN).must_equal Inspec::Profile::AstHelper::RefCollector::REF_PATTERN
    end

    it "verifies unified file collector uses cached patterns" do
      # Verify UnifiedFileCollector uses cached patterns
      _(Inspec::Profile::AstHelper::UnifiedFileCollector::CONTROL_PATTERN).must_equal Inspec::Profile::AstHelper::ControlIDCollector::CONTROL_PATTERN
      _(Inspec::Profile::AstHelper::UnifiedFileCollector::INPUT_PATTERN).must_equal Inspec::Profile::AstHelper::InputCollectorBase::INPUT_PATTERN
      _(Inspec::Profile::AstHelper::UnifiedFileCollector::LVASGN_INPUT_PATTERN).must_equal Inspec::Profile::AstHelper::InputCollectorOutsideControlBlock::LVASGN_INPUT_PATTERN
    end
  end

  describe "UnifiedControlCollector" do
    let(:control_data) do
      {
        id: "test-control",
        impact: 0.5,
        title: nil,
        desc: nil,
        descriptions: {},
        tags: {},
        refs: [],
      }
    end
    let(:unified_collector) { Inspec::Profile::AstHelper::UnifiedControlCollector.new(control_data, memo, false) }

    it "processes impact nodes correctly" do
      code = "impact 0.7"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:impact]).must_equal 0.7
    end

    it "processes title nodes correctly" do
      code = "title 'Test Control'"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:title]).must_equal "Test Control"
    end

    it "processes description nodes correctly" do
      code = "desc 'Test description'"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:desc]).must_equal "Test description"
      _(control_data[:descriptions][:default]).must_equal "Test description"
    end

    it "processes tag nodes correctly" do
      code = "tag severity: 'high'"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:tags][:severity]).must_equal "high"
    end

    it "processes ref nodes correctly" do
      code = "ref 'CIS Benchmark'"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:refs].length).must_equal 1
      _(control_data[:refs][0][:ref]).must_equal "CIS Benchmark"
    end
  end

  describe "UnifiedFileCollector" do
    let(:unified_file_collector) { Inspec::Profile::AstHelper::UnifiedFileCollector.new(memo, source_location_ref, include_tests: false) }

    it "processes input nodes correctly" do
      code = "input('test_input', value: 'default', type: 'string')"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_file_collector.process(node) }
      _(memo[:inputs].length).must_equal 1
      _(memo[:inputs][0][:name]).must_equal "test_input"
      _(memo[:inputs][0][:options][:type]).must_equal "string"
    end

    it "processes control blocks correctly" do
      code = <<~RUBY
        control "test-1" do
          title "Test Control"
          impact 0.8
        end
      RUBY
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_file_collector.process(node) }
      _(memo[:controls].length).must_equal 1
      _(memo[:controls][0][:id]).must_equal "test-1"
      _(memo[:controls][0][:title]).must_equal "Test Control"
      _(memo[:controls][0][:impact]).must_equal 0.8
    end

    it "avoids duplicate control processing" do
      code = <<~RUBY
        control "test-1" do
          title "Test Control"
        end
      RUBY
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      # Process the same AST twice
      2.times { src.ast.each_node { |node| unified_file_collector.process(node) } }

      # Should only have one control despite processing twice
      _(memo[:controls].length).must_equal 1
    end
  end

  describe "Performance Improvements" do
    it "uses direct hash assignment instead of merge!" do
      # This is more of a code inspection test to verify the optimization pattern
      # We check that the UnifiedControlCollector uses direct assignment
      collector_source = File.read("lib/inspec/utils/profile_ast_helpers.rb")

      # Should contain direct hash assignments, not merge! operations in the unified collectors
      _(collector_source).must_match(/\[:tags\]\[.*\] = /)
      _(collector_source).must_match(/\[:descriptions\]\[.*\] = /)
    end

    it "demonstrates pattern reuse across multiple collector instances" do
      # Create multiple instances of collectors
      collectors = 10.times.map { Inspec::Profile::AstHelper::ImpactCollector.new(memo) }

      # All instances should use the same pattern object (object_id should be the same)
      pattern_ids = collectors.map { |c| c.class::IMPACT_PATTERN.object_id }
      _(pattern_ids.uniq.size).must_equal 1
    end

    it "measures traversal efficiency with unified collector" do
      # Create a complex control structure
      complex_code = <<~RUBY
        input('test_input', value: 'test')

        control "test-1" do
          impact 0.7
          title "Test Control 1"
          desc "Test description"
          tag severity: 'high'
          ref 'CIS Benchmark'
        #{"  "}
          describe file('/etc/passwd') do
            it { should exist }
          end
        end

        control "test-2" do
          impact 0.8
          title "Test Control 2"
          desc "Another test description"
          tag priority: 'medium'
          ref 'NIST 800-53'
        end
      RUBY

      src = RuboCop::AST::ProcessedSource.new(complex_code, RUBY_VERSION.to_f)

      # Test that unified collector processes everything in a single pass
      test_memo = { controls: [], inputs: [] }
      unified_collector = Inspec::Profile::AstHelper::UnifiedFileCollector.new(test_memo, source_location_ref, include_tests: false)

      # Single traversal should collect everything
      src.ast&.each_node { |n| unified_collector.process(n) }

      # Verify everything was collected in one pass
      _(test_memo[:inputs].size).must_equal 1
      _(test_memo[:controls].size).must_equal 2

      # Verify data quality
      _(test_memo[:inputs][0][:name]).must_equal "test_input"
      _(test_memo[:controls].map { |c| c[:id] }).must_include "test-1"
      _(test_memo[:controls].map { |c| c[:id] }).must_include "test-2"
    end
  end

  describe "Comprehensive Functionality Tests" do
    let(:complex_control_code) do
      <<~RUBY
        input('database_host', value: 'localhost', type: 'string', required: true)
        input('port', value: 5432, type: 'numeric')

        db_host = input('database_host')

        control "database-1" do
          impact 0.9
          title "Database Configuration"
          desc "Default", "Ensure database is properly configured"
          desc "Rationale", "Database security is critical"
        #{"  "}
          tag component: 'database'
          tag severity: 'critical'
          tag nist: ['AC-2', 'AC-3']
          tag remediation: {#{" "}
            text: 'Configure database properly',
            url: 'https://example.com/remediation'
          }
        #{"  "}
          ref 'CIS PostgreSQL Benchmark'
          ref 'NIST Guide', url: 'https://nist.gov/guide'
        #{"  "}
          describe postgres_conf(db_host) do
            its('port') { should eq 5432 }
          end
        #{"  "}
          describe file('/etc/postgresql/postgresql.conf') do
            it { should exist }
            it { should be_file }
          end
        end

        control "database-2" do
          impact 0.7
          title "Database Logging"
          desc "Ensure logging is enabled"
        #{"  "}
          tag component: 'database'
          tag severity: 'medium'
        #{"  "}
          describe postgres_conf do
            its('log_statement') { should eq 'all' }
          end
        end
      RUBY
    end

    it "processes complex profile with unified collectors correctly" do
      src = RuboCop::AST::ProcessedSource.new(complex_control_code, RUBY_VERSION.to_f)
      test_memo = { controls: [], inputs: [] }

      unified_collector = Inspec::Profile::AstHelper::UnifiedFileCollector.new(test_memo, source_location_ref, include_tests: true)
      src.ast&.each_node { |n| unified_collector.process(n) }

      # Verify inputs
      _(test_memo[:inputs].size).must_equal 2

      # First input
      input1 = test_memo[:inputs].find { |i| i[:name] == "database_host" }
      _(input1[:options][:value]).must_equal "localhost"
      _(input1[:options][:type]).must_equal "string"
      _(input1[:options][:required]).must_equal true

      # Second input
      input2 = test_memo[:inputs].find { |i| i[:name] == "port" }
      _(input2[:options][:value]).must_equal 5432
      _(input2[:options][:type]).must_equal "numeric"

      # Verify controls
      _(test_memo[:controls].size).must_equal 2

      # First control
      control1 = test_memo[:controls].find { |c| c[:id] == "database-1" }
      _(control1[:impact]).must_equal 0.9
      _(control1[:title]).must_equal "Database Configuration"
      _(control1[:desc]).must_equal "Ensure database is properly configured"
      _(control1[:descriptions][:default]).must_equal "Ensure database is properly configured"
      _(control1[:descriptions]["Rationale"]).must_equal "Database security is critical"

      # Tags
      _(control1[:tags][:component]).must_equal "database"
      _(control1[:tags][:severity]).must_equal "critical"
      _(control1[:tags][:nist]).must_equal %w{AC-2 AC-3}
      _(control1[:tags][:remediation][:text]).must_equal "Configure database properly"
      _(control1[:tags][:remediation][:url]).must_equal "https://example.com/remediation"

      # References
      _(control1[:refs].size).must_equal 2
      _(control1[:refs][0][:ref]).must_equal "CIS PostgreSQL Benchmark"
      _(control1[:refs][1][:ref]).must_equal "NIST Guide"
      _(control1[:refs][1][:url]).must_equal "https://nist.gov/guide"

      # Test code blocks
      _(control1[:checks].size).must_equal 2

      # Second control
      control2 = test_memo[:controls].find { |c| c[:id] == "database-2" }
      _(control2[:impact]).must_equal 0.7
      _(control2[:title]).must_equal "Database Logging"
      _(control2[:desc]).must_equal "Ensure logging is enabled"
      _(control2[:tags][:severity]).must_equal "medium"
      _(control2[:checks].size).must_equal 1
    end

    it "handles edge cases and malformed input gracefully" do
      edge_case_code = <<~RUBY
        # Empty input definition
        input('empty_input')

        # Control with no metadata
        control "minimal" do
        end

        # Control with complex tag structures
        control "complex-tags" do
          tag 'simple_tag'
          tag :symbol_tag
          tag complex: { nested: true, array: ['a', 'b'] }
          tag with_expression: some_variable.to_s
        end
      RUBY

      src = RuboCop::AST::ProcessedSource.new(edge_case_code, RUBY_VERSION.to_f)
      test_memo = { controls: [], inputs: [] }

      unified_collector = Inspec::Profile::AstHelper::UnifiedFileCollector.new(test_memo, source_location_ref)

      # Should not raise any errors
      _(-> { src.ast&.each_node { |n| unified_collector.process(n) } }).must_be_silent

      # Verify it processes what it can
      _(test_memo[:inputs].size).must_equal 1
      _(test_memo[:controls].size).must_equal 2

      # Minimal control should have defaults
      minimal_control = test_memo[:controls].find { |c| c[:id] == "minimal" }
      _(minimal_control[:impact]).must_equal 0.5
      _(minimal_control[:title]).must_be_nil

      # Complex tags control
      complex_control = test_memo[:controls].find { |c| c[:id] == "complex-tags" }
      _(complex_control[:tags]["simple_tag"]).must_be_nil
      _(complex_control[:tags][:symbol_tag]).must_be_nil
      _(complex_control[:tags][:complex][:nested]).must_equal true
      _(complex_control[:tags][:complex][:array]).must_equal %w{a b}
    end

    it "maintains thread safety with concurrent processing" do
      simple_code = <<~RUBY
        control "concurrent-test" do
          impact 0.5
          title "Concurrent Test"
        end
      RUBY

      src = RuboCop::AST::ProcessedSource.new(simple_code, RUBY_VERSION.to_f)

      # Process the same code concurrently with different memo objects
      results = []
      threads = 10.times.map do |i|
        Thread.new do
          local_memo = { controls: [], inputs: [] }
          unified_collector = Inspec::Profile::AstHelper::UnifiedFileCollector.new(local_memo, "ref-#{i}")
          src.ast&.each_node { |n| unified_collector.process(n) }
          results[i] = local_memo
        end
      end

      threads.each(&:join)

      # All results should be identical and complete
      results.each_with_index do |memo, i|
        _(memo[:controls].size).must_equal 1
        _(memo[:controls][0][:id]).must_equal "concurrent-test"
        _(memo[:controls][0][:title]).must_equal "Concurrent Test"
        _(memo[:controls][0][:source_location][:ref]).must_equal "ref-#{i}"
      end
    end

    it "prevents duplicate control processing across multiple invocations" do
      duplicate_code = <<~RUBY
        control "duplicate-test" do
          impact 0.6
        end

        control "duplicate-test" do
          impact 0.8
        end
      RUBY

      src = RuboCop::AST::ProcessedSource.new(duplicate_code, RUBY_VERSION.to_f)
      test_memo = { controls: [], inputs: [] }

      unified_collector = Inspec::Profile::AstHelper::UnifiedFileCollector.new(test_memo, source_location_ref)
      src.ast&.each_node { |n| unified_collector.process(n) }

      # Should only have one control (first occurrence wins)
      _(test_memo[:controls].size).must_equal 1
      _(test_memo[:controls][0][:impact]).must_equal 0.6
    end
  end

  describe "Backward Compatibility" do
    it "produces identical results to legacy collectors for simple cases" do
      simple_code = <<~RUBY
        control "compat-test" do
          impact 0.7
          title "Compatibility Test"
          desc "Test description"
          tag severity: 'high'
          ref 'Test Reference'
        end
      RUBY

      src = RuboCop::AST::ProcessedSource.new(simple_code, RUBY_VERSION.to_f)

      # Process with unified collector
      unified_memo = { controls: [], inputs: [] }
      unified_collector = Inspec::Profile::AstHelper::UnifiedFileCollector.new(unified_memo, source_location_ref)
      src.ast&.each_node { |n| unified_collector.process(n) }

      # Process with legacy collectors (simulated single control)
      legacy_memo = { controls: [], inputs: [] }
      legacy_collector = Inspec::Profile::AstHelper::ControlIDCollector.new(legacy_memo, source_location_ref)
      src.ast&.each_node { |n| legacy_collector.process(n) }

      # Results should be identical
      _(unified_memo[:controls]).must_equal legacy_memo[:controls]
    end

    it "maintains API compatibility with existing collector interfaces" do
      # Verify that all collectors still implement expected methods
      collectors = [
        Inspec::Profile::AstHelper::ImpactCollector,
        Inspec::Profile::AstHelper::DescCollector,
        Inspec::Profile::AstHelper::TitleCollector,
        Inspec::Profile::AstHelper::TagCollector,
        Inspec::Profile::AstHelper::RefCollector,
        Inspec::Profile::AstHelper::ControlIDCollector,
        Inspec::Profile::AstHelper::UnifiedControlCollector,
        Inspec::Profile::AstHelper::UnifiedFileCollector,
      ]

      collectors.each do |collector_class|
        # All collectors should inherit from CollectorBase
        _(collector_class.ancestors).must_include Inspec::Profile::AstHelper::CollectorBase

        # All collectors should respond to process method
        instance = case collector_class.name
                   when /UnifiedControlCollector/
                     collector_class.new({}, {}, false)
                   when /UnifiedFileCollector/
                     collector_class.new({}, source_location_ref)
                   when /ControlIDCollector/
                     collector_class.new({}, source_location_ref)
                   else
                     collector_class.new({})
                   end

        _(instance).must_respond_to :process
      end
    end
  end
end