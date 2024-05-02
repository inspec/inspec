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
      end

      class InputCollectorBase < CollectorBase
        VALID_INPUT_OPTIONS = %i{name value type required priority pattern profile sensitive}.freeze

        REQUIRED_VALUES_MAP = {
          true: true,
          false: false,
        }.freeze

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
                  elsif child_node.value.class == RuboCop::AST::HashNode
                    # Here value will be a hash
                    values = {}
                    child_node.value.children.each do |grand_child_node|
                      values.merge!(grand_child_node.key.value => grand_child_node.value.value)
                    end
                    opts.merge!(child_node.key.value => values)
                  else
                    opts.merge!(child_node.key.value => child_node.value.value)
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
          RuboCop::AST::NodePattern.new("(send nil? :input ...)").match(node)
        end
      end

      class ImpactCollector < CollectorBase
        def on_send(node)
          if RuboCop::AST::NodePattern.new("(send nil? :impact ...)").match(node)
            memo[:impact] = node.children[2].value
          end
        end
      end

      class DescCollector < CollectorBase
        def on_send(node)
          if RuboCop::AST::NodePattern.new("(send nil? :desc ...)").match(node)
            memo[:descriptions] ||= {}
            if node.children[2] && node.children[3]
              # NOTE: This assumes the description is as below
              # desc 'label', 'An optional description with a label' # Pair a part of the description with a label
              memo[:descriptions] = memo[:descriptions].merge(node.children[2].value => node.children[3].value)
            else
              memo[:desc] = node.children[2].value
              memo[:descriptions] = memo[:descriptions].merge(default: node.children[2].value)
            end
          end
        end
      end

      class TitleCollector < CollectorBase
        def on_send(node)
          if RuboCop::AST::NodePattern.new("(send nil? :title ...)").match(node)
            # TODO - title may not be a simple string
            memo[:title] = node.children[2].value
          end
        end
      end

      class TagCollector < CollectorBase

        ACCPETABLE_TAG_TYPE_TO_VALUES = {
          false: false,
          true: true,
          nil: nil,
        }.freeze

        def on_send(node)
          if RuboCop::AST::NodePattern.new("(send nil? :tag ...)").match(node)
            memo[:tags] ||= {}

            node.children[2..-1].each do |tag_node|
              collect_tags(tag_node)
            end
          end
        end

        private

        def collect_tags(tag_node)
          if tag_node.type == :str || tag_node.type == :sym
            memo[:tags] = memo[:tags].merge(tag_node.value => nil)
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
              tags_coll.merge!(key => value)
            end
            memo[:tags] = memo[:tags].merge(tags_coll)
          end
        end
      end

      class RefCollector < CollectorBase
        def on_send(node)
          if RuboCop::AST::NodePattern.new("(send nil? :ref ...)").match(node)
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
              references.merge!(ref: node.children[2].value)
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
              references.merge!(ref_node.value => nil)
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
              references.merge!(child_node.key.value => value)
            end
          end
        end
      end

      class ControlIDCollector < CollectorBase
        attr_reader :seen_control_ids, :source_location_ref, :include_tests
        def initialize(memo, source_location_ref, include_tests: false)
          @memo = memo
          @seen_control_ids = {}
          @source_location_ref = source_location_ref
          @include_tests = include_tests
        end

        def on_block(block_node)
          if RuboCop::AST::NodePattern.new("(block (send nil? :control ...) ...)").match(block_node)
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

            # Scan the code block for per-control metadata
            collectors = []
            collectors.push ImpactCollector.new(control_data)
            collectors.push DescCollector.new(control_data)
            collectors.push TitleCollector.new(control_data)
            collectors.push TagCollector.new(control_data)
            collectors.push RefCollector.new(control_data)
            collectors.push InputCollectorWithinControlBlock.new(@memo)
            collectors.push TestsCollector.new(control_data) if include_tests

            begin_block.each_node do |node_within_control|
              collectors.each { |collector| collector.process(node_within_control) }
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
        def on_lvasgn(node)
          # We are looking for the following pattern in the AST
          # (lvasgn :var_name (send nil? :input ...))
          # example: a = input('a') or a = input('a', value: 'b')
          # and not this: a = 1
          if RuboCop::AST::NodePattern.new("(lvasgn _ (send nil? :input ...))").match(node)
            input_children = node.children[1]
            collect_input(input_children)
          end
        end

        def on_send(node)
          check_and_collect_input(node)
        end
      end

      class TestsCollector < CollectorBase

        def on_block(node)
          if RuboCop::AST::NodePattern.new("(block (send nil? :describe ...) ...)").match(node) ||
              RuboCop::AST::NodePattern.new("(block (send nil? :expect ...) ...)").match(node)
            memo[:checks] << node.source
          end
        end
      end
    end
  end
end
