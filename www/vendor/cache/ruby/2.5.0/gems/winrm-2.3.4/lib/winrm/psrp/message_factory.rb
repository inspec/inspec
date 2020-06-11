# Copyright 2016 Shawn Neal <sneal@sneal.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'erubi'
require_relative 'message'

module WinRM
  module PSRP
    # Creates WinRM::PSRP::Message instances for various PSRP messages
    class MessageFactory
      class << self
        # Creates a new session capability PSRP message.
        # @param runspace_pool_id [String] The UUID of the remote shell/runspace pool.
        def session_capability_message(runspace_pool_id)
          Message.new(
            runspace_pool_id,
            Message::MESSAGE_TYPES[:session_capability],
            render('session_capability')
          )
        end

        # Creates a new init runspace pool PSRP message.
        # @param runspace_pool_id [String] The UUID of the remote shell/runspace pool.
        def init_runspace_pool_message(runspace_pool_id)
          Message.new(
            runspace_pool_id,
            Message::MESSAGE_TYPES[:init_runspacepool],
            render('init_runspace_pool')
          )
        end

        # Creates a new PSRP message that creates pipline to execute a command.
        # @param runspace_pool_id [String] The UUID of the remote shell/runspace pool.
        # @param pipeline_id [String] The UUID to correlate the command/pipeline
        # response.
        # @param command [String] The command passed to Invoke-Expression.
        def create_pipeline_message(runspace_pool_id, pipeline_id, command)
          Message.new(
            runspace_pool_id,
            Message::MESSAGE_TYPES[:create_pipeline],
            render('create_pipeline', command: command.encode(xml: :text)),
            pipeline_id
          )
        end

        private

        # Renders the specified template with the given context
        # @param template [String] The base filename of the PSRP message template.
        # @param context [Hash] Any options required for rendering the template.
        # @return [String] The rendered XML PSRP message.
        # @api private
        def render(template, context = nil)
          template_path = File.expand_path(
            "#{File.dirname(__FILE__)}/#{template}.xml.erb"
          )
          template = File.read(template_path)
          case context
          when Hash
            b = binding
            locals = context.collect { |k, _| "#{k} = context[#{k.inspect}]; " }
            b.eval(locals.join)
          when Binding
            b = context
          when NilClass
            b = binding
          else
            raise ArgumentError
          end
          b.eval(Erubi::Engine.new(template).src)
        end
      end
    end
  end
end
