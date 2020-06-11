# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

module MsRestAzure
  #
  # Class which represents the error type and information.
  #
  class TypedErrorInfo

    # @return [String] the error type parsed from the body of the http error response.
    attr_accessor :type

    # @return [Object] the error info parsed from the body of the http error response.
    attr_accessor :info

    #
    # Deserializes given hash into TypedErrorInfo object.
    # @param object [Hash] object to deserialize.
    #
    # @return [TypedErrorInfo] deserialized object.
    def self.deserialize_object(object)
      return if object.nil?
      output_object = TypedErrorInfo.new

      output_object.type = object['type']

      output_object.info = object['info']

      output_object
    end
  end
end