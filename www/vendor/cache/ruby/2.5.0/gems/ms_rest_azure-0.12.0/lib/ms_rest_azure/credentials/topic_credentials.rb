# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

module MsRestAzure
  #
  # Class that provides access to authentication token.
  #
  class TopicCredentials < MsRest::ServiceClientCredentials

    private

    # @return [String] the topic key
    attr_reader :topic_key

    public

    #
    # Creates and initialize new instance of the TopicCredentials class.
    # @param topic_key [String] topic key
    def initialize(topic_key)
      fail ArgumentError, 'Topic key cannot be nil' if topic_key.nil?
      fail ArgumentError, 'Topic key must be of type string' if topic_key.class.to_s != 'String'
      @topic_key = topic_key
    end

    def sign_request(request)
      super(request)

      if (request.respond_to?(:request_headers))
        request.request_headers['aeg-sas-key'] = @topic_key
      elsif request.respond_to?(:headers)
        request.headers['aeg-sas-key'] = @topic_key
      else
        fail ArgumentError, 'Incorrect request object was provided'
      end
    end
  end

end
