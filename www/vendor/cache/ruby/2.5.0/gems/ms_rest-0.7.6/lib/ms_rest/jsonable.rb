# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

module MsRest
  # Mixin to provide simple serialization / deserialization in AutoRest generated model classes
  module JSONable
    include MsRest::Serialization

    #
    # Serialize the object to JSON
    # @param options [Hash] hash map contains options to convert to json.
    # @return [String] JSON serialized version of the object
    #
    def to_json(options = nil)
      mapper = (options.nil? || !options.key?(:mapper))? self.class.mapper: options[:mapper]
      object = (options.nil? || !options.key?(:object))? self: options[:object]
      serialize(mapper, object)
    end

    #
    # Deserialize the object from JSON
    # @param json [String] JSON string representation of the object
    # @return [JSONable] object built from json input
    #
    def from_json(json, mapper = nil)
      mapper = self.class.mapper if mapper.nil?
      deserialize(mapper, json)
    end

    #
    # String representation of the object
    # @return [String]
    #
    def to_s
      "#{super} #{to_json.to_s}"
    end
  end
end
