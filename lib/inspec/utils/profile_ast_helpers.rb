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
              memo[:descriptions] = memo[:descriptions].merge("default" => node.children[2].value)
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
        def on_send(node)
          if RuboCop::AST::NodePattern.new("(send nil? :tag ...)").match(node)
            # TODO & NOTE - tags may be read as a hash or a string; verify this is correct
            memo[:tags] ||= {}
            # Check if the tag is a string or a hash
            if node.children[2].type == :str
              memo[:tags] = memo[:tags].merge(node.children[2].value => nil)
            else
              memo[:tags] = memo[:tags].merge(node.children[2].children[0].key.value => node.children[2].children[0].value.value)
            end
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
              ref: node.children[2].value
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
        attr_reader :seen_control_ids
        def initialize(memo)
          @memo = memo
          @seen_control_ids = {}
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
              id: control_id
            }

            # Scan the code block for per-control metadata
            collectors = []
            collectors.push ImpactCollector.new(control_data)
            collectors.push DescCollector.new(control_data)
            collectors.push TitleCollector.new(control_data)
            collectors.push TagCollector.new(control_data)
            collectors.push RefCollector.new(control_data)

            begin_block.each_child_node do |node_within_control|
              collectors.each { |collector| collector.process(node_within_control) }
            end

            memo[:controls].push control_data
          end
        end
      end
    end
  end
end
