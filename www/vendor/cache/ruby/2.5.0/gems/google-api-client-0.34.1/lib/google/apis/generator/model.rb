# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'active_support/inflector'
require 'google/apis/discovery_v1'

# Extend the discovery API classes with additional data needed to make
# code generation produce better results
module Google
  module Apis
    module DiscoveryV1
      TYPE_MAP = {
        'string' => 'String',
        'boolean' => 'Boolean',
        'number' => 'Float',
        'integer' => 'Fixnum',
        'any' => 'Object'
      }

      class JsonSchema
        attr_accessor :name
        attr_accessor :generated_name
        attr_accessor :generated_class_name
        attr_accessor :base_ref
        attr_accessor :parent
        attr_accessor :discriminant
        attr_accessor :discriminant_value
        attr_accessor :path

        def properties
          Hash[(@properties || {}).sort]
        end

        def qualified_name
          parent.qualified_name + '::' + generated_class_name
        end

        def generated_type
          case type
          when 'string', 'boolean', 'number', 'integer', 'any'
            return 'DateTime' if format == 'date-time'
            return 'Date' if format == 'date'
            return 'Fixnum' if format == 'int64'
            return 'Fixnum' if format == 'uint64'
            return TYPE_MAP[type]
          when 'array'
            if items == self
              return sprintf('Array<%s>', qualified_name)
            end
            return sprintf('Array<%s>', items.generated_type)
          when 'hash'
            if additional_properties == self
              return sprintf('Hash<String,%s>', qualified_name)
            end
            return sprintf('Hash<String,%s>', additional_properties.generated_type)
          when 'object'
            return qualified_name
          end
        end
      end

      class RestMethod
        attr_accessor :generated_name
        attr_accessor :parent

        def parameters
          Hash[(@parameters || {}).sort]
        end

        def path_parameters
          return [] if parameter_order.nil? || parameters.nil?
          parameter_order.map { |name| parameters[name] }.select { |param| param.location == 'path' }
        end

        def query_parameters
          return [] if parameters.nil?
          parameters.values.select { |param| param.location == 'query' }
        end

        def required_parameters
          return [] if parameter_order.nil? || parameters.nil?
          parameter_order.map { |name| parameters[name] }.select { |param| param.location == 'path' || param.required }
        end

        def optional_query_parameters
          query_parameters.select { |param| param.required != true }
        end

      end

      class RestResource
        attr_accessor :parent

        def api_methods
          Hash[(@api_methods || {}).sort]
        end

        def resources
          Hash[(@resources || {}).sort]
        end

        def all_methods
          m = []
          m << api_methods.values unless api_methods.nil?
          m << resources.map { |_k, r| r.all_methods } unless resources.nil?
          m.flatten
        end
      end

      class RestDescription
        attr_accessor :force_alt_json
        alias_method :force_alt_json?, :force_alt_json

        # Don't expose these in the API directly.
        PARAMETER_BLACKLIST = %w(alt access_token bearer_token oauth_token pp prettyPrint
                                 $.xgafv callback upload_protocol uploadType)

        def version
          ActiveSupport::Inflector.camelize(@version.gsub(/\W/, '-')).gsub(/-/, '_')
        end

        def name
          ActiveSupport::Inflector.camelize(@name)
        end

        def module_name
          name + version
        end

        def qualified_name
          sprintf('Google::Apis::%s', module_name)
        end

        def service_name
          class_name = (canonical_name || name).gsub(/\W/, '')
          ActiveSupport::Inflector.camelize(sprintf('%sService', class_name))
        end

        def api_methods
          Hash[(@api_methods || {}).sort]
        end

        def resources
          Hash[(@resources || {}).sort]
        end

        def all_methods
          m = []
          m << api_methods.values unless api_methods.nil?
          m << resources.map { |_k, r| r.all_methods } unless resources.nil?
          m.flatten
        end

        def parameters
          Hash[(@parameters || {}).sort].delete_if { |k, _v| PARAMETER_BLACKLIST.include?(k) }
        end

        def schemas
          Hash[(@schemas || {}).sort]
        end

        class Auth
          class Oauth2
            class Scope
              attr_accessor :constant
            end

            def scopes
              Hash[(@scopes || {}).sort]
            end
          end
        end
      end
    end
  end
end
