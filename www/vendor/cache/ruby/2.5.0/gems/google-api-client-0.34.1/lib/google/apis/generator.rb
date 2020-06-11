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

require 'google/apis/discovery_v1'
require 'google/apis/generator/annotator'
require 'google/apis/generator/model'
require 'google/apis/generator/template'
require 'active_support/inflector'
require 'yaml'

module Google
  module Apis
    # Generates ruby classes for APIs from discovery documents
    # @private
    class Generator
      Discovery = Google::Apis::DiscoveryV1

      # Load templates
      def initialize(api_names: nil, api_names_out: nil)
        @names = Google::Apis::Generator::Names.new(api_names_out || File.join(Google::Apis::ROOT, 'api_names_out.yaml'),
                                                    api_names || File.join(Google::Apis::ROOT, 'api_names.yaml'))
        @module_template = Template.load('module.rb')
        @service_template = Template.load('service.rb')
        @classes_template = Template.load('classes.rb')
        @representations_template = Template.load('representations.rb')
      end

      # Generates ruby source for an API
      #
      # @param [String] json
      #  API Description, as JSON text
      # @return [Hash<String,String>]
      #  Hash of generated files keyed by path
      def render(json)
        api = parse_description(json)
        Annotator.process(api, @names)
        base_path = ActiveSupport::Inflector.underscore(api.qualified_name)
        context = {
          'api' => api
        }
        files = {}
        files[base_path + '.rb'] = @module_template.render(context)
        files[File.join(base_path, 'service.rb')] = @service_template.render(context)
        files[File.join(base_path, 'classes.rb')] = @classes_template.render(context)
        files[File.join(base_path, 'representations.rb')] = @representations_template.render(context)
        files
      end

      # Dump mapping of API names
      # @return [String] Mapping of paths to ruby names in YAML format
      def dump_api_names
        @names.dump
      end

      def parse_description(json)
        Discovery::RestDescription::Representation.new(Discovery::RestDescription.new).from_json(json)
      end
    end
  end
end
