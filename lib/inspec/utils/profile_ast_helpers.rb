require "ast"
require "rubocop-ast"
module Inspec
  class Profile
    class AstHelper
      class ControlIDCollector
        include Parser::AST::Processor::Mixin
        include RuboCop::AST::Traversal

        # See docs of Parser::AST::Processor::Mixin#process
        # There will be a hook defined for each node type - on_send, on_sym, etc.
        def on_send (node)
          #  TODO - this patern is way too loose. "(send nil? :control)" should work but doesn't
          if RuboCop::AST::NodePattern.new("(send ...)").match(node)
            puts "I saw a control!"
            require "byebug"; byebug
          end
        end
      end
    end
  end
end