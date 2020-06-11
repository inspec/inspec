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

require 'logger'
require 'erb'
require 'yaml'
require 'json'
require 'active_support/inflector'
require 'google/apis/core/logging'
require 'google/apis/generator/template'
require 'google/apis/generator/model'
require 'google/apis/generator/helpers'
require 'addressable/uri'

module Google
  module Apis

    # @private
    class Generator

      # Helper for picking names for methods, properties, types, etc. Performs various normaliations
      # as well as allows for overriding individual names from a configuration file for cases
      # where algorithmic approaches produce poor APIs.
      class Names
        ActiveSupport::Inflector.inflections do |inflections|
          inflections.uncountable('send_as', 'as')
          inflections.irregular('drive', 'drives')
          inflections.irregular('teamdrive', 'teamdrives')
        end

        include Google::Apis::Core::Logging
        include NameHelpers

        def initialize(names_out_file_path = nil, names_file_path = nil)
          if names_out_file_path && File.file?(names_out_file_path)
            logger.info { sprintf('Loading API names from %s', names_out_file_path) }
            @names = YAML.load(File.read(names_out_file_path)) || {}
          else
            @names = {}
          end
          if names_file_path && File.file?(names_file_path)
            logger.info { sprintf('Loading API names from %s', names_file_path) }
            @names = @names.merge(YAML.load(File.read(names_file_path)) || {})
          end
          @path = []
        end

        def with_path(path)
          @path.push(path)
          begin
            yield
          ensure
            @path.pop
          end
        end

        def infer_parameter_name
          pick_name(normalize_param_name(@path.last))
        end

        def infer_property_name
          pick_name(normalize_property_name(@path.last))
        end

        def pick_name(alt_name)
          preferred_name = @names[key]
          if preferred_name && preferred_name == alt_name
            logger.warn { sprintf("Unnecessary name override '%s': %s", key, alt_name) }
          elsif preferred_name.nil?
            preferred_name = @names[key] = alt_name
          end
          preferred_name
        end

        def [](key)
          @names[key]
        end

        def []=(key, value)
          @names[key] = value
        end

        def dump
          YAML.dump(Hash[@names.sort])
        end

        def key
          @path.reduce('') { |a, e| a + '/' + e }
        end

        def option(opt_name)
          @names[sprintf('%s?%s', key, opt_name)]
        end

        # For RPC style methods, pick a name based off the request objects.
        # @param [Google::Apis::DiscoveryV1::RestMethod] method
        # @param [Boolean] pick_name
        #  Fragment of the discovery doc describing the method
        def infer_method_name_for_rpc(method, pick_name = true)
          return nil if method.request.nil?
          parts = method.id.split('.')
          parts.shift
          verb = ActiveSupport::Inflector.underscore(parts.pop)
          match = method.request._ref.match(/(.*)(?i:request)/)
          return nil if match.nil?
          name = ActiveSupport::Inflector.underscore(match[1])
          return nil unless name == verb || name.start_with?(verb + '_')
          if !parts.empty?
            resource_name = ActiveSupport::Inflector.singularize(parts.pop)
            resource_name = ActiveSupport::Inflector.underscore(resource_name)
            if !name.include?(resource_name)
              name = name.split('_').insert(1, resource_name).join('_')
            end
          end
          if pick_name
            pick_name(name)
          else
            name
          end
        end

        # For REST style methods, build a method name from the verb/resource(s) in the method
        # id. IDs are in the form <api>.<resource>.<verb>
        # @param [Google::Apis::DiscoveryV1::RestMethod] method
        #  Fragment of the discovery doc describing the method
        def infer_method_name_from_id(method)
          parts = method.id.split('.')
          parts.shift
          verb = ActiveSupport::Inflector.underscore(parts.pop)
          return verb if parts.empty?
          resource_name = ActiveSupport::Inflector.underscore(parts.pop)
          if pluralize_method?(verb)
            resource_name = ActiveSupport::Inflector.pluralize(resource_name)
          else
            resource_name = ActiveSupport::Inflector.singularize(resource_name)
          end
          if parts.empty?
            resource_path = resource_name
          else
            resource_path = parts.map do |p|
              p = ActiveSupport::Inflector.singularize(p)
              ActiveSupport::Inflector.underscore(p)
            end.join('_') + '_' + resource_name
          end
          method_name = verb.split('_').insert(1, resource_path.split('_')).join('_')
          pick_name(method_name)
        end
      end

      # Modifies an API description to support ruby code generation. Primarily does:
      # - Ensure all names follow appopriate ruby conventions
      # - Maps types to ruby types, classes, and resolves $refs
      # - Attempts to simplify names where possible to make APIs more sensible
      class Annotator
        include NameHelpers
        include Google::Apis::Core::Logging

        # Prepare the API for the templates.
        # @param [Google::Apis::DiscoveryV1::RestDescription] description
        #  API Description
        def self.process(description, api_names = nil)
          Annotator.new(description, api_names).annotate_api
        end

        # @param [Google::Apis::DiscoveryV1::RestDescription] description
        #  API Description
        # @param [Google::Api::Generator::Names] api_names
        #  Name helper instanace
        def initialize(description, api_names = nil)
          api_names = Names.new if api_names.nil?
          @names = api_names
          @rest_description = description
          @registered_types = []
          @deferred_types = []
          @strip_prefixes = []
          @all_methods = {}
          @dup_method_names_for_rpc = collect_dup_method_names_for_rpc
          @path = []
        end

        def collect_method_names_for_rpc(resource, method_names_for_rpc)
          resource.api_methods.each do |_k, v|
            # First look for the method name in the `@names` hash. If there's
            # no override set, generate it without inserting the generated name
            # into the `@names` hash.
            method_name_for_rpc = @names[@names.key]
            if method_name_for_rpc.nil?
              method_name_for_rpc = @names.infer_method_name_for_rpc(v, false)
            end
            method_names_for_rpc << method_name_for_rpc if method_name_for_rpc
          end unless resource.api_methods.nil?

          resource.resources.each do |_k, v|
            collect_method_names_for_rpc(v, method_names_for_rpc)
          end unless resource.resources.nil?
        end

        def collect_dup_method_names_for_rpc
          method_names_for_rpc = []
          collect_method_names_for_rpc(@rest_description, method_names_for_rpc)
          method_names_for_rpc.group_by{ |e| e }.select { |k, v| v.size > 1 }.map(&:first)
        end

        def annotate_api
          @names.with_path(@rest_description.id) do
            @strip_prefixes << @rest_description.name
            if @rest_description.auth
              @rest_description.auth.oauth2.scopes.each do |key, value|
                value.constant = constantize_scope(key)
              end
            end
            @rest_description.force_alt_json = @names.option('force_alt_json')
            annotate_parameters(@rest_description.parameters)
            annotate_resource(@rest_description.name, @rest_description)
            @rest_description.schemas.each do |k, v|
              annotate_type(k, v, @rest_description)
            end unless @rest_description.schemas.nil?
          end
          resolve_type_references
          resolve_variants
        end

        def annotate_type(name, type, parent)
          @names.with_path(name) do
            type.name = name
            type.path = @names.key
            type.generated_name = @names.infer_property_name
            if type.type == 'object'
              type.generated_class_name = ActiveSupport::Inflector.camelize(type.generated_name)
              @registered_types << type
            end
            type.parent = parent
            @deferred_types << type if type._ref
            type.properties.each do |k, v|
              annotate_type(k, v, type)
            end unless type.properties.nil?
            if type.additional_properties
              type.type = 'hash'
              annotate_type(ActiveSupport::Inflector.singularize(type.generated_name), type.additional_properties,
                            parent)
            end
            annotate_type(ActiveSupport::Inflector.singularize(type.generated_name), type.items, parent) if type.items
          end
        end

        def annotate_resource(name, resource, parent_resource = nil)
          @strip_prefixes << name
          resource.parent = parent_resource unless parent_resource.nil?
          resource.api_methods.each do |_k, v|
            annotate_method(v, resource)
          end unless resource.api_methods.nil?

          resource.resources.each do |k, v|
            annotate_resource(k, v, resource)
          end unless resource.resources.nil?
        end

        def annotate_method(method, parent_resource = nil)
          @names.with_path(method.id) do
            method.parent = parent_resource
	    # Grab the method name generated from the request object without
	    # inserting into, or querying, the names hash.
            method_name_for_rpc = @names.infer_method_name_for_rpc(method, false)
	    # If `method_name_for_rpc` is a duplicate (more than one method in
	    # the API will generate this name), generate the method name from
	    # the method ID instead.
            if @dup_method_names_for_rpc.include?(method_name_for_rpc)
              method.generated_name = @names.infer_method_name_from_id(method)
            # Otherwise, proceed as normal.
            elsif method_name_for_rpc
              method.generated_name = @names.infer_method_name_for_rpc(method)
            else
              method.generated_name = @names.infer_method_name_from_id(method)
            end
            check_duplicate_method(method)
            annotate_parameters(method.parameters)
          end
        end

        def annotate_parameters(parameters)
          parameters.each do |key, value|
            @names.with_path(key) do
              value.name = key
              value.generated_name = @names.infer_parameter_name
              @deferred_types << value if value._ref
            end
          end unless parameters.nil?
        end

        def resolve_type_references
          @deferred_types.each do |type|
            if type._ref
              ref = @rest_description.schemas[type._ref]
              ivars = ref.instance_variables - [:@name, :@generated_name]
              (ivars).each do |var|
                type.instance_variable_set(var, ref.instance_variable_get(var))
              end
            end
          end
        end

        def resolve_variants
          @deferred_types.each do |type|
            if type.variant
              type.variant.map.each do |v|
                ref = @rest_description.schemas[v._ref]
                ref.base_ref = type
                ref.discriminant = type.variant.discriminant
                ref.discriminant_value = v.type_value
              end
            end
          end
        end

        def check_duplicate_method(m)
          if @all_methods.include?(m.generated_name)
            logger.error do
              sprintf('Duplicate method %s generated, conflicting paths %s and %s',
                m.generated_name, @names.key, @all_methods[m.generated_name])
            end
            fail 'Duplicate name generated'
          end
          @all_methods[m.generated_name] = @names.key
        end
      end
    end
  end
end
