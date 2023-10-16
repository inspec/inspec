require "ast"
require "rubocop-ast"
module Inspec
  class Profile
    class AstHelper
      class CollectorBase
        include Parser::AST::Processor::Mixin
        include RuboCop::AST::Traversal

        attr_reader :memo
        def initialize(memo)
          @memo = memo
        end
      end

      class ImpactCollector < CollectorBase
        def on_send(node)
          if RuboCop::AST::NodePattern.new("(send nil? :impact ...)").match(node)
            # TODO - any special processing for impact (float)
            memo[:impact] = node.children[2].value
          end
        end
      end

      class DescCollector < CollectorBase
        def on_send(node)
          # TODO (WIP) - description is also available as "description"
          if RuboCop::AST::NodePattern.new("(send nil? :desc ...)").match(node)
            # TODO (WIP) - description may be read as a hash or a string
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
            # TODO & NOTE - tags may be read as a hash or a string; verify this is correct
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
                value = child_tag.value.value
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
            # TODO: This maybe loose, needs testing
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

            references = {
              ref: node.children[2].value,
            }

            if node.children[3] && node.children[3].type == :hash
              references.merge!(node.children[3].children[0].key.value => node.children[3].children[0].value.value)
            elsif node.children[3] && node.children[3].type == :str
              references.merge!(node.children[3].value => nil)
            end
            memo[:refs] ||= []
            memo[:refs] << references
          end
        end
      end

      class ControlIDCollector < CollectorBase
        attr_reader :seen_control_ids, :source_location_ref
        def initialize(memo, source_location_ref)
          @memo = memo
          @seen_control_ids = {}
          @source_location_ref = source_location_ref
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
              impact: nil,
              refs: [],
              tags: {},
              checks: Set.new,
            }

            # Scan the code block for per-control metadata
            collectors = []
            collectors.push ImpactCollector.new(control_data)
            collectors.push DescCollector.new(control_data)
            collectors.push TitleCollector.new(control_data)
            collectors.push TagCollector.new(control_data)
            collectors.push RefCollector.new(control_data)
            collectors.push TestsCollector.new(control_data)

            begin_block.each_node do |node_within_control|
              collectors.each { |collector| collector.process(node_within_control) }
            end

            memo[:controls].push control_data
          end
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
