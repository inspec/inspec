require "ast"
require "rubocop-ast"
module Inspec
  class Profile
    class AstHelper

      class ImpactCollector
        include Parser::AST::Processor::Mixin
        include RuboCop::AST::Traversal

        attr_reader :memo
        def initialize(memo)
          @memo = memo
        end

        def on_send(node)
          if RuboCop::AST::NodePattern.new("(send nil? :impact ...)").match(node)
            # TODO - any special processing for impact (float)
            memo[:impact] = node.children[2].value
          end
        end
      end

      class DescCollector
        include Parser::AST::Processor::Mixin
        include RuboCop::AST::Traversal

        attr_reader :memo
        def initialize(memo)
          @memo = memo
        end

        def on_send(node)
          # TODO - description is also available as "description"
          if RuboCop::AST::NodePattern.new("(send nil? :desc ...)").match(node)
            # TODO - description may be read as a hash or a string
            memo[:desc] = node.children[2].value
          end
        end
      end

      class TitleCollector
        include Parser::AST::Processor::Mixin
        include RuboCop::AST::Traversal

        attr_reader :memo
        def initialize(memo)
          @memo = memo
        end

        def on_send(node)
          if RuboCop::AST::NodePattern.new("(send nil? :title ...)").match(node)
            # TODO - title may not be a simple string
            memo[:title] = node.children[2].value
          end
        end
      end



      class ControlIDCollector
        include Parser::AST::Processor::Mixin
        include RuboCop::AST::Traversal

        attr_reader :memo
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
          
            begin_block.each_node do |node_within_control| 
              collectors.each { |collector| collector.process(node_within_control) }
            end

            memo[:controls].push control_data
          end
        end
      end
    end
  end
end
