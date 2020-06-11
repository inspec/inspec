# Copyright 2016 Matt Wrock <matt@mattwrock.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module WinRM
  module PSRP
    module MessageData
      # error record message type
      class ErrorRecord < Base
        def exception
          @exception ||= property_hash('Exception')
        end

        def fully_qualified_error_id
          @fully_qualified_error_id ||= string_prop('FullyQualifiedErrorId')
        end

        def invocation_info
          @invocation_info ||= property_hash('InvocationInfo')
        end

        def error_category_message
          @error_category_message ||= string_prop('ErrorCategory_Message')
        end

        def error_details_script_stack_trace
          @error_details_script_stack_trace ||= string_prop('ErrorDetails_ScriptStackTrace')
        end

        def doc
          @doc ||= REXML::Document.new(raw)
        end

        def string_prop(prop_name)
          prop = REXML::XPath.first(doc, "//*[@N='#{prop_name}']")
          prop.text if prop
        end

        def property_hash(prop_name)
          prop_nodes = REXML::XPath.first(doc, "//*[@N='#{prop_name}']/Props")
          return {} if prop_nodes.nil?

          prop_nodes.elements.each_with_object({}) do |node, props|
            name = node.attributes['N']
            props[underscore(name).to_sym] = node.text if node.text
          end
        end

        def underscore(camel)
          camel.gsub(/::/, '/')
               .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
               .gsub(/([a-z\d])([A-Z])/, '\1_\2')
               .tr('-', '_').downcase
        end
      end
    end
  end
end
