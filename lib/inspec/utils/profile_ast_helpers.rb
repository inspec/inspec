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

        # See docs of Parser::AST::Processor::Mixin#process
        # There will be a hook defined for each node type - on_send, on_sym, etc.
        def on_send (node)
          if RuboCop::AST::NodePattern.new("(send nil? :control ...)").match(node)

            # TODO - This assumes the control ID is always a plain string, which we know it is often not!
            control_id = node.children[2].value
            # TODO - BUG - this keeps seeing the same nodes over and over againa, and so repeating control IDs. We are ignoring duplicate control IDs, which is incorrect.
            return if seen_control_ids[control_id]

            seen_control_ids[control_id] = true

            # TODO - search down within node to find other per-control metadata like impact, tags, refs, desc

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