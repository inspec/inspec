require "helper"
require "inspec/utils/profile_ast_helpers"

describe "AST Parser Performance Optimizations - Core Tests" do
  let(:memo) { { controls: [], inputs: [] } }
  let(:source_location_ref) { "/test/path/control.rb" }

  describe "NodePattern Caching Verification" do
    it "verifies all patterns are cached as constants" do
      # Test that patterns exist as constants and are frozen
      patterns = [
        Inspec::Profile::AstHelper::ImpactCollector::IMPACT_PATTERN,
        Inspec::Profile::AstHelper::DescCollector::DESC_PATTERN,
        Inspec::Profile::AstHelper::TitleCollector::TITLE_PATTERN,
        Inspec::Profile::AstHelper::TagCollector::TAG_PATTERN,
        Inspec::Profile::AstHelper::RefCollector::REF_PATTERN,
        Inspec::Profile::AstHelper::InputCollectorBase::INPUT_PATTERN,
        Inspec::Profile::AstHelper::ControlIDCollector::CONTROL_PATTERN,
      ]

      patterns.each do |pattern|
        _(pattern).must_be_instance_of(RuboCop::AST::NodePattern)
        _(pattern.frozen?).must_equal true
      end
    end

    it "verifies unified collectors reuse cached patterns" do
      # Verify UnifiedControlCollector uses the same pattern objects
      _(Inspec::Profile::AstHelper::UnifiedControlCollector::IMPACT_PATTERN).must_equal Inspec::Profile::AstHelper::ImpactCollector::IMPACT_PATTERN
      _(Inspec::Profile::AstHelper::UnifiedControlCollector::DESC_PATTERN).must_equal Inspec::Profile::AstHelper::DescCollector::DESC_PATTERN
      _(Inspec::Profile::AstHelper::UnifiedControlCollector::TITLE_PATTERN).must_equal Inspec::Profile::AstHelper::TitleCollector::TITLE_PATTERN
    end
  end

  describe "UnifiedControlCollector Functionality" do
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

    it "processes impact statements correctly" do
      code = "impact 0.7"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:impact]).must_equal 0.7
    end

    it "processes title statements correctly" do
      code = "title 'Test Control Title'"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:title]).must_equal "Test Control Title"
    end

    it "processes description statements correctly" do
      code = "desc 'Test description'"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:desc]).must_equal "Test description"
      _(control_data[:descriptions][:default]).must_equal "Test description"
    end

    it "processes simple tag statements correctly" do
      code = "tag severity: 'high'"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:tags][:severity]).must_equal "high"
    end

    it "processes reference statements correctly" do
      code = "ref 'CIS Benchmark'"
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      src.ast.each_node { |node| unified_collector.process(node) }
      _(control_data[:refs].length).must_equal 1
      _(control_data[:refs][0][:ref]).must_equal "CIS Benchmark"
    end
  end

  describe "UnifiedFileCollector Functionality" do
    let(:unified_file_collector) { Inspec::Profile::AstHelper::UnifiedFileCollector.new(memo, source_location_ref, false) }

    it "processes input statements correctly" do
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

    it "prevents duplicate control processing" do
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

    it "handles empty control blocks gracefully" do
      code = <<~RUBY
        control "empty-test" do
        end
      RUBY
      src = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)

      _(-> { src.ast.each_node { |node| unified_file_collector.process(node) } }).must_be_silent
      _(memo[:controls].length).must_equal 1
      _(memo[:controls][0][:id]).must_equal "empty-test"
      _(memo[:controls][0][:impact]).must_equal 0.5 # default value
    end
  end

  describe "Performance and Efficiency" do
    it "demonstrates single-pass processing efficiency" do
      complex_code = <<~RUBY
        input('test_input', value: 'test')

        control "test-1" do
          impact 0.7
          title "Test Control 1"
          desc "Test description"
          tag severity: 'high'
          ref 'CIS Benchmark'
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
      test_memo = { controls: [], inputs: [] }
      unified_collector = Inspec::Profile::AstHelper::UnifiedFileCollector.new(test_memo, source_location_ref, false)

      # Single traversal should collect everything
      src.ast.each_node { |n| unified_collector.process(n) }

      # Verify everything was collected in one pass
      _(test_memo[:inputs].size).must_equal 1
      _(test_memo[:controls].size).must_equal 2

      # Verify data quality
      _(test_memo[:inputs][0][:name]).must_equal "test_input"
      _(test_memo[:controls].map { |c| c[:id] }).must_include "test-1"
      _(test_memo[:controls].map { |c| c[:id] }).must_include "test-2"
    end

    it "maintains object identity for cached patterns" do
      # Create multiple collectors and verify they use the same pattern objects
      collectors = 5.times.map { Inspec::Profile::AstHelper::ImpactCollector.new(memo) }

      # All instances should use the same pattern object (same object_id)
      pattern_ids = collectors.map { |c| c.class::IMPACT_PATTERN.object_id }
      _(pattern_ids.uniq.size).must_equal 1
    end
  end

  describe "Backward Compatibility" do
    it "maintains API compatibility with existing collectors" do
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

    it "produces consistent results for simple cases" do
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
      src.ast.each_node { |n| unified_collector.process(n) }

      # Process with legacy collectors (simulated single control)
      legacy_memo = { controls: [], inputs: [] }
      legacy_collector = Inspec::Profile::AstHelper::ControlIDCollector.new(legacy_memo, source_location_ref)
      src.ast.each_node { |n| legacy_collector.process(n) }

      # Results should be identical for basic metadata
      _(unified_memo[:controls].size).must_equal legacy_memo[:controls].size
      _(unified_memo[:controls][0][:id]).must_equal legacy_memo[:controls][0][:id]
      _(unified_memo[:controls][0][:impact]).must_equal legacy_memo[:controls][0][:impact]
      _(unified_memo[:controls][0][:title]).must_equal legacy_memo[:controls][0][:title]
    end
  end
end