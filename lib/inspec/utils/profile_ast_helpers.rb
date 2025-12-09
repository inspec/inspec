require "ast"
require "rubocop-ast"
module Inspec
  class Profile
    class AstHelper
      class CollectorBase < Parser::AST::Processor
        include RuboCop::AST::Traversal

        attr_reader :memo
        def initialize(memo)
          @memo = memo
        end

        # Helper method to recursively extract values from AST nodes
        def extract_value(node)
          return node unless node.is_a?(RuboCop::AST::Node)

          case node.class.to_s
          when "RuboCop::AST::HashNode"
            hash_values = {}
            node.children.each do |pair_node|
              hash_values[pair_node.key.value] = extract_value(pair_node.value)
            end
            hash_values
          when "RuboCop::AST::ArrayNode"
            node.children.map { |element| extract_value(element) }
          else
            # For simple nodes (string, int, boolean, etc.)
            node.respond_to?(:value) ? node.value : node
          end
        end
      end

      class InputCollectorBase < CollectorBase
        VALID_INPUT_OPTIONS = %i{name value type required priority pattern profile sensitive}.freeze

        REQUIRED_VALUES_MAP = {
          true: true,
          false: false,
        }.freeze

        INPUT_PATTERN = RuboCop::AST::NodePattern.new("(send nil? :input ...)").freeze

        def initialize(memo)
          @memo = memo
        end

        def collect_input(input_children)
          input_name = input_children.children[2].value

          # Check if memo[:inputs] already has a value for the input_name, if yes, then skip adding it to the array
          unless memo[:inputs].any? { |input| input[:name] == input_name }
            # The value will be updated if available in the input_children
            opts = {
              value: "Input '#{input_name}' does not have a value. Skipping test.",
            }

            if input_children.children[3]&.type == :hash
              input_children.children[3].children.each do |child_node|
                if VALID_INPUT_OPTIONS.include?(child_node.key.value)
                  if child_node.value.class == RuboCop::AST::Node && REQUIRED_VALUES_MAP.key?(child_node.value.type)
                    opts.merge!(child_node.key.value => REQUIRED_VALUES_MAP[child_node.value.type])
                  else
                    # Use extract_value helper to handle hash, array, and nested structures
                    opts.merge!(child_node.key.value => extract_value(child_node.value))
                  end
                end
              end
            end

            # TODO: Add rules for handling the input options or use existing rules if available
            # 1. Handle pattern matching for the given input value
            # 2. Handle data-type matching for the given input value
            # 3. Handle required flag for the given input value
            # 4. Handle sensitive flag for the given input value
            memo[:inputs] ||= []
            input_hash = {
              name: input_name,
              options: opts,
            }
            memo[:inputs] << input_hash
          end
        end

        def check_and_collect_input(node)
          if input_pattern_match?(node)
            collect_input(node)
          else
            node.children.each do |child_node|
              check_and_collect_input(child_node) if input_pattern_match?(child_node)
            end
          end
        end

        def input_pattern_match?(node)
          INPUT_PATTERN.match(node)
        end
      end

      class ImpactCollector < CollectorBase
        IMPACT_PATTERN = RuboCop::AST::NodePattern.new("(send nil? :impact ...)").freeze

        def on_send(node)
          if IMPACT_PATTERN.match(node)
            memo[:impact] = node.children[2].value
          end
        end
      end

      class DescCollector < CollectorBase
        DESC_PATTERN = RuboCop::AST::NodePattern.new("(send nil? :desc ...)").freeze

        def on_send(node)
          if DESC_PATTERN.match(node)
            memo[:descriptions] ||= {}
            if node.children[2] && node.children[3]
              # NOTE: This assumes the description is as below
              # desc 'label', 'An optional description with a label' # Pair a part of the description with a label
              memo[:descriptions][node.children[2].value] = node.children[3].value
            else
              memo[:desc] = node.children[2].value
              memo[:descriptions][:default] = node.children[2].value
            end
          end
        end
      end

      class TitleCollector < CollectorBase
        TITLE_PATTERN = RuboCop::AST::NodePattern.new("(send nil? :title ...)").freeze

        def on_send(node)
          if TITLE_PATTERN.match(node)
            # TODO - title may not be a simple string
            memo[:title] = node.children[2].value
          end
        end
      end

      class TagCollector < CollectorBase
        TAG_PATTERN = RuboCop::AST::NodePattern.new("(send nil? :tag ...)").freeze

        ACCPETABLE_TAG_TYPE_TO_VALUES = {
          false: false,
          true: true,
          nil: nil,
        }.freeze

        def on_send(node)
          if TAG_PATTERN.match(node)
            memo[:tags] ||= {}

            node.children[2..-1].each do |tag_node|
              collect_tags(tag_node)
            end
          end
        end

        private

        def collect_tags(tag_node)
          if tag_node.type == :str || tag_node.type == :sym
            memo[:tags][tag_node.value] = nil
          elsif tag_node.type == :hash
            tags_coll = {}
            tag_node.children.each do |child_tag|
              key = child_tag.key.value
              if child_tag.value.type == :array
                value = child_tag.value.children.map { |child_node| child_node.type == :str ? child_node.children.first : nil }
              elsif ACCPETABLE_TAG_TYPE_TO_VALUES.key?(child_tag.value.type)
                value = ACCPETABLE_TAG_TYPE_TO_VALUES[child_tag.value.type]
              else
                if child_tag.value.children.first.class == RuboCop::AST::SendNode
                  # Cases like this: (where there is no assignment of the value to a variable like gcp_project_id)
                  # tag project: gcp_project_id.to_s
                  #
                  # Lecacy evaluates gcp_project_id.to_s and then passes the value to the tag
                  # We are not evaluating the value here, so we are just passing the value as it is
                  #
                  # TODO: Do we need to evaluate the value here?
                  # (byebug) child_tag.value
                  # s(:send,
                  # s(:send, nil, :gcp_project_id), :to_s)
                  value = child_tag.value.children.first.children[1]
                elsif child_tag.value.children.first.class == RuboCop::AST::Node
                  # Cases like this:
                  # control_id = '1.1'
                  # tag cis_gcp: control_id.to_s
                  value = child_tag.value.children.first.children[0]
                else
                  value = child_tag.value.value
                end
              end
              tags_coll[key] = value
            end
            memo[:tags].merge!(tags_coll)
          end
        end
      end

      class RefCollector < CollectorBase
        REF_PATTERN = RuboCop::AST::NodePattern.new("(send nil? :ref ...)").freeze

        def on_send(node)
          if REF_PATTERN.match(node)
            # Construct the array of refs hash as below

            # "refs": [
            #   {
            #     "url": "http://",
            #     "ref": "Some ref"
            #   },
            #   {
            #     "ref": "https://",
            #   }
            # ]

            # node.children[1] && node.children[1] == :ref - we don't need this check as the pattern match above will take care of it
            return unless node.children[2]

            references = {}

            if node.children[2].type == :begin
              # Case for: ref   ({:ref=>"Some ref", :url=>"https://"})
              # find the hash node
              iterate_child_and_collect_ref(node.children[2].children, references)
            elsif node.children[2].type == :str
              # Case for: ref "ref1", url: "http://",
              references[:ref] = node.children[2].value
              iterate_child_and_collect_ref(node.children[3..-1], references)
            end

            memo[:refs] ||= []
            memo[:refs] << references
          end
        end

        private

        def iterate_child_and_collect_ref(child_node, references = {})
          child_node.each do |ref_node|
            if ref_node.type == :hash
              iterate_hash_node(ref_node, references)
            elsif ref_node.type == :str
              references[ref_node.value] = nil
            end
          end
        end

        def iterate_hash_node(hash_node, references = {})
          # hash node like this:
          # s(:hash,
          #   s(:pair,
          #     s(:sym, :url),
          #     s(:str, "https://")))
          #
          # or like this:
          # (byebug) hash_node
          # s(:hash,
          # s(:pair,
          #   s(:sym, :url),
          #   s(:send,
          #     s(:send, nil, :cis_url), :to_s)))
          hash_node.children.each do |child_node|
            if child_node.type == :pair
              if child_node.value.children.first.class == RuboCop::AST::SendNode
                # Case like this  (where there is no assignment of the value to a variable like cis_url)
                # ref 'CIS Benchmark', url: cis_url.to_s
                # Lecacy evaluates cis_url.to_s and then passes the value to the ref
                # We are not evaluating the value here, so we are just passing the value as it is
                #
                # TODO: Do we need to evaluate the value here?
                #
                # (byebug) child_node.value.children.first
                # s(:send, nil, :cis_url)
                value = child_node.value.children.first.children[1]
              elsif child_node.value.class == RuboCop::AST::SendNode
                # Cases like this:
                # cis_url = attribute('cis_url')
                # ref 'CIS Benchmark', url: cis_url.to_s
                value = child_node.value.children.first.children[0]
              else
                # Cases like this: ref 'CIS Benchmark - 2', url: "https://"
                # require 'byebug'; byebug
                value = child_node.value.value
              end
              references[child_node.key.value] = value
            end
          end
        end
      end

      class ControlIDCollector < CollectorBase
        CONTROL_PATTERN = RuboCop::AST::NodePattern.new("(block (send nil? :control ...) ...)").freeze

        attr_reader :seen_control_ids, :source_location_ref, :include_tests
        def initialize(memo, source_location_ref, include_tests: false)
          @memo = memo
          @seen_control_ids = {}
          @source_location_ref = source_location_ref
          @include_tests = include_tests
        end

        def on_block(block_node)
          if CONTROL_PATTERN.match(block_node)
            # NOTE: Assuming begin block is at the index 2
            begin_block = block_node.children[2]
            control_node = block_node.children[0]

            # TODO - This assumes the control ID is always a plain string, which we know it is often not!
            control_id = control_node.children[2].value
            # TODO - BUG - this keeps seeing the same nodes over and over againa, and so repeating control IDs. We are ignoring duplicate control IDs, which is incorrect.
            return if seen_control_ids[control_id]

            seen_control_ids[control_id] = true

            control_data = {
              id: control_id,
              code: block_node.source,
              source_location: {
                line: block_node.first_line,
                ref: source_location_ref,
              },
              title: nil,
              desc: nil,
              descriptions: {},
              impact: 0.5,
              refs: [],
              tags: {},
            }
            control_data[:checks] = [] if include_tests

            # Scan the code block for per-control metadata using unified collector
            unified_collector = UnifiedControlCollector.new(control_data, @memo, include_tests)
            begin_block.each_node do |node_within_control|
              unified_collector.process(node_within_control)
            end

            memo[:controls].push control_data
          end
        end
      end

      class InputCollectorWithinControlBlock < InputCollectorBase
        def initialize(memo)
          @memo = memo
        end

        def on_send(node)
          check_and_collect_input(node)
        end
      end

      class InputCollectorOutsideControlBlock < InputCollectorBase
        def initialize(memo)
          @memo = memo
        end

        # TODO: There is scope to refactor InputCollectorOutsideControlBlock and InputCollectorWithinControlBlock
        # 1. We can have a single class for both the collectors
        # 2. We can have a on_send and on_lvasgn method in the same class
        # :lvasgn in ast stands for "local variable assignment"
        LVASGN_INPUT_PATTERN = RuboCop::AST::NodePattern.new("(lvasgn _ (send nil? :input ...))").freeze

        def on_lvasgn(node)
          # We are looking for the following pattern in the AST
          # (lvasgn :var_name (send nil? :input ...))
          # example: a = input('a') or a = input('a', value: 'b')
          # and not this: a = 1
          if LVASGN_INPUT_PATTERN.match(node)
            input_children = node.children[1]
            collect_input(input_children)
          end
        end

        def on_send(node)
          check_and_collect_input(node)
        end
      end

      class TestsCollector < CollectorBase
        DESCRIBE_PATTERN = RuboCop::AST::NodePattern.new("(block (send nil? :describe ...) ...)").freeze
        EXPECT_PATTERN = RuboCop::AST::NodePattern.new("(block (send nil? :expect ...) ...)").freeze

        def on_block(node)
          if DESCRIBE_PATTERN.match(node) || EXPECT_PATTERN.match(node)
            memo[:checks] << node.source
          end
        end
      end

      # Unified collector that combines multiple collectors into a single pass
      # This eliminates the O(N×M) performance issue where N nodes are processed by M collectors
      class UnifiedControlCollector < CollectorBase
        IMPACT_PATTERN = ImpactCollector::IMPACT_PATTERN
        DESC_PATTERN = DescCollector::DESC_PATTERN
        TITLE_PATTERN = TitleCollector::TITLE_PATTERN
        TAG_PATTERN = TagCollector::TAG_PATTERN
        REF_PATTERN = RefCollector::REF_PATTERN
        INPUT_PATTERN = InputCollectorBase::INPUT_PATTERN
        DESCRIBE_PATTERN = TestsCollector::DESCRIBE_PATTERN
        EXPECT_PATTERN = TestsCollector::EXPECT_PATTERN

        ACCPETABLE_TAG_TYPE_TO_VALUES = TagCollector::ACCPETABLE_TAG_TYPE_TO_VALUES

        def initialize(control_data, memo, include_tests = false)
          @control_data = control_data
          @memo = memo
          @include_tests = include_tests
        end

        def on_send(node)
          case node.children[1]
          when :impact
            collect_impact(node) if IMPACT_PATTERN.match(node)
          when :desc
            collect_desc(node) if DESC_PATTERN.match(node)
          when :title
            collect_title(node) if TITLE_PATTERN.match(node)
          when :tag
            collect_tag(node) if TAG_PATTERN.match(node)
          when :ref
            collect_ref(node) if REF_PATTERN.match(node)
          when :input
            collect_input(node) if INPUT_PATTERN.match(node)
          end
        end

        def on_block(node)
          if @include_tests && (DESCRIBE_PATTERN.match(node) || EXPECT_PATTERN.match(node))
            @control_data[:checks] << node.source
          end
        end

        private

        def collect_impact(node)
          @control_data[:impact] = node.children[2].value
        end

        def collect_desc(node)
          @control_data[:descriptions] ||= {}
          if node.children[2] && node.children[3]
            @control_data[:descriptions][node.children[2].value] = node.children[3].value
          else
            @control_data[:desc] = node.children[2].value
            @control_data[:descriptions][:default] = node.children[2].value
          end
        end

        def collect_title(node)
          @control_data[:title] = node.children[2].value
        end

        def collect_tag(node)
          @control_data[:tags] ||= {}
          node.children[2..-1].each do |tag_node|
            collect_tags_from_node(tag_node)
          end
        end

        def collect_tags_from_node(tag_node)
          if tag_node.type == :str || tag_node.type == :sym
            @control_data[:tags][tag_node.value] = nil
          elsif tag_node.type == :hash
            tags_coll = {}
            tag_node.children.each do |child_tag|
              key = child_tag.key.value
              if child_tag.value.type == :array
                value = child_tag.value.children.map { |child_node| child_node.type == :str ? child_node.children.first : nil }
              elsif ACCPETABLE_TAG_TYPE_TO_VALUES.key?(child_tag.value.type)
                value = ACCPETABLE_TAG_TYPE_TO_VALUES[child_tag.value.type]
              else
                if child_tag.value.children.first.class == RuboCop::AST::SendNode
                  value = child_tag.value.children.first.children[1]
                elsif child_tag.value.children.first.class == RuboCop::AST::Node
                  value = child_tag.value.children.first.children[0]
                else
                  value = child_tag.value.value
                end
              end
              tags_coll[key] = value
            end
            @control_data[:tags].merge!(tags_coll)
          end
        end

        def collect_ref(node)
          return unless node.children[2]

          references = {}
          if node.children[2].type == :begin
            iterate_child_and_collect_ref(node.children[2].children, references)
          elsif node.children[2].type == :str
            references[:ref] = node.children[2].value
            iterate_child_and_collect_ref(node.children[3..-1], references)
          end

          @control_data[:refs] ||= []
          @control_data[:refs] << references
        end

        def iterate_child_and_collect_ref(child_node, references = {})
          child_node.each do |ref_node|
            if ref_node.type == :hash
              iterate_hash_node(ref_node, references)
            elsif ref_node.type == :str
              references[ref_node.value] = nil
            end
          end
        end

        def iterate_hash_node(hash_node, references = {})
          hash_node.children.each do |child_node|
            if child_node.type == :pair
              if child_node.value.children.first.class == RuboCop::AST::SendNode
                value = child_node.value.children.first.children[1]
              elsif child_node.value.class == RuboCop::AST::SendNode
                value = child_node.value.children.first.children[0]
              else
                value = child_node.value.value
              end
              references[child_node.key.value] = value
            end
          end
        end

        def collect_input(node)
          input_name = node.children[2].value

          unless @memo[:inputs].any? { |input| input[:name] == input_name }
            opts = {
              value: "Input '#{input_name}' does not have a value. Skipping test.",
            }

            if node.children[3]&.type == :hash
              node.children[3].children.each do |child_node|
                if InputCollectorBase::VALID_INPUT_OPTIONS.include?(child_node.key.value)
                  if child_node.value.class == RuboCop::AST::Node && InputCollectorBase::REQUIRED_VALUES_MAP.key?(child_node.value.type)
                    opts[child_node.key.value] = InputCollectorBase::REQUIRED_VALUES_MAP[child_node.value.type]
                  else
                    # Use extract_value helper to handle hash, array, and nested structures
                    opts[child_node.key.value] = extract_value(child_node.value)
                  end
                end
              end
            end

            @memo[:inputs] ||= []
            input_hash = {
              name: input_name,
              options: opts,
            }
            @memo[:inputs] << input_hash
          end
        end
      end

      # Unified file collector that combines InputCollectorOutsideControlBlock and ControlIDCollector
      # This eliminates duplicate AST traversal for better performance
      class UnifiedFileCollector < CollectorBase
        CONTROL_PATTERN = ControlIDCollector::CONTROL_PATTERN
        INPUT_PATTERN = InputCollectorBase::INPUT_PATTERN
        LVASGN_INPUT_PATTERN = InputCollectorOutsideControlBlock::LVASGN_INPUT_PATTERN

        def initialize(memo, source_location_ref, include_tests: false)
          @memo = memo
          @source_location_ref = source_location_ref
          @include_tests = include_tests
          @seen_control_ids = {}
        end

        def on_send(node)
          # Handle input collection
          check_and_collect_input(node) if INPUT_PATTERN.match(node)
        end

        def on_lvasgn(node)
          # Handle input assignment: a = input('a')
          if LVASGN_INPUT_PATTERN.match(node)
            input_children = node.children[1]
            collect_input(input_children)
          end
        end

        def on_block(block_node)
          # Handle control collection
          if CONTROL_PATTERN.match(block_node)
            collect_control(block_node)
          end
        end

        private

        def check_and_collect_input(node)
          collect_input(node)
        end

        def collect_input(input_children)
          input_name = input_children.children[2].value

          unless @memo[:inputs].any? { |input| input[:name] == input_name }
            opts = {
              value: "Input '#{input_name}' does not have a value. Skipping test.",
            }

            if input_children.children[3]&.type == :hash
              input_children.children[3].children.each do |child_node|
                if InputCollectorBase::VALID_INPUT_OPTIONS.include?(child_node.key.value)
                  if child_node.value.class == RuboCop::AST::Node && InputCollectorBase::REQUIRED_VALUES_MAP.key?(child_node.value.type)
                    opts[child_node.key.value] = InputCollectorBase::REQUIRED_VALUES_MAP[child_node.value.type]
                  else
                    # Use extract_value helper to handle hash, array, and nested structures
                    opts[child_node.key.value] = extract_value(child_node.value)
                  end
                end
              end
            end

            @memo[:inputs] ||= []
            input_hash = {
              name: input_name,
              options: opts,
            }
            @memo[:inputs] << input_hash
          end
        end

        def collect_control(block_node)
          begin_block = block_node.children[2]
          control_node = block_node.children[0]

          control_id = control_node.children[2].value
          return if @seen_control_ids[control_id]

          @seen_control_ids[control_id] = true

          control_data = {
            id: control_id,
            code: block_node.source,
            source_location: {
              line: block_node.first_line,
              ref: @source_location_ref,
            },
            title: nil,
            desc: nil,
            descriptions: {},
            impact: 0.5,
            refs: [],
            tags: {},
          }
          control_data[:checks] = [] if @include_tests

          # Use unified collector for control metadata
          unified_collector = UnifiedControlCollector.new(control_data, @memo, @include_tests)
          begin_block.each_node do |node_within_control|
            unified_collector.process(node_within_control)
          end

          @memo[:controls] ||= []
          @memo[:controls].push control_data
        end
      end
    end
  end
end
