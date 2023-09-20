require "ast"
require "rubocop-ast"
module Inspec
  class Profile
    class AstHelper
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
            control_node = block_node.children[0]
            # TODO - This assumes the control ID is always a plain string, which we know it is often not!
            control_id = control_node.children[2].value
            # TODO - BUG - this keeps seeing the same nodes over and over againa, and so repeating control IDs. We are ignoring duplicate control IDs, which is incorrect.
            return if seen_control_ids[control_id]

            seen_control_ids[control_id] = true

            # TODO - search down within block_node.children to find other per-control metadata like impact, tags, refs, desc

            control_data = {
              id: control_id
            }

            memo[:controls].push control_data
          end
        end        
      end
    end
  end
end