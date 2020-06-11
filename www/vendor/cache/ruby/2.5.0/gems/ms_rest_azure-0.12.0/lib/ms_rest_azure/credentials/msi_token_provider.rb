# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

module MsRestAzure
  #
  # Class that provides access to authentication token via Managed Service Identity.
  #
  class MSITokenProvider < MsRest::TokenProvider

    private

    TOKEN_ACQUIRE_URL = 'http://localhost:{port}/oauth2/token'
    REQUEST_BODY_PATTERN = 'resource={resource_uri}'
    USER_ASSIGNED_IDENTITY = '{id_type}={user_assigned_identity}'
    DEFAULT_SCHEME = 'Bearer'
    IMDS_TOKEN_ACQUIRE_URL = 'http://169.254.169.254/metadata/identity/oauth2/token'

    # @return [MSIActiveDirectoryServiceSettings] settings.
    attr_accessor :settings

    # @return [Integer] port number where MSI service is running.
    attr_accessor :port

    # @return [String] client id for user assigned managed identity
    attr_accessor :client_id

    # @return [String] object id for user assigned managed identity
    attr_accessor :object_id

    # @return [String] ms_res id for user assigned managed identity
    attr_accessor :msi_res_id

    # @return [String] auth token.
    attr_writer :token

    # @return [Time] the date when the current token expires.
    attr_writer :token_expires_on

    # @return [Integer] the amount of time we refresh token before it expires.
    attr_reader :expiration_threshold

    public

    # @return [Time] the date when the current token expires.
    attr_reader :token_expires_on

    # @return [String] the type of token.
    attr_reader :token_type

    # @return [String] auth token.
    attr_reader :token

    #
    # Creates and initialize new instance of the MSITokenProvider class.
    # @param port [Integer] port number where MSI service is running.
    # @param settings [ActiveDirectoryServiceSettings] active directory setting.
    # @param msi_id [Hash] MSI id for user assigned managed service identity,
    #   msi_id = {'client_id': 'client id of user assigned identity'}
    # or
    #  msi_id = {'object_id': 'object id of user assigned identity'}
    # or
    #  msi_id = {'msi_rest_id': 'resource id of user assigned identity'}
    # The above key,value pairs are mutually exclusive.
    def initialize(port = 50342, settings = ActiveDirectoryServiceSettings.get_azure_settings, msi_id = nil)
      fail ArgumentError, 'Azure AD settings cannot be nil' if settings.nil?
      fail ArgumentError, 'msi_id must include either client_id, object_id or msi_res_id exclusively' if (!msi_id.nil? && msi_id.length > 1)

      warn "The 'port' argument is no longer used, and will be removed in a future release" if port != 50342
      @port = port
      @settings = settings
      if !msi_id.nil?
        @client_id = msi_id[:client_id] unless msi_id[:client_id].nil?
        @object_id = msi_id[:object_id] unless msi_id[:object_id].nil?
        @msi_res_id = msi_id[:msi_res_id] unless msi_id[:msi_res_id].nil?
      end

      @expiration_threshold = 5 * 60
    end

    #
    # Returns the string value which needs to be attached
    # to HTTP request header in order to be authorized.
    #
    # @return [String] authentication headers.
    def get_authentication_header
      if !ENV['MSI_VM'].nil? && ENV['MSI_VM'].downcase == 'true'
        acquire_token if token_expired
      else
        acquire_token_from_imds_with_retry if token_expired
      end
      "#{token_type} #{token}"
    end

    private

    def append_header(name, value)
      "#{name}=#{value}"
    end

    def acquire_token_from_imds_with_retry
      token_acquire_url = IMDS_TOKEN_ACQUIRE_URL.dup + "?" + append_header('resource', ERB::Util.url_encode(@settings.token_audience)) + '&' + append_header('api-version', '2018-02-01')
      token_acquire_url = (token_acquire_url + '&' + append_header('client_id', ERB::Util.url_encode(@client_id))) unless @client_id.nil?
      token_acquire_url = (token_acquire_url + '&' + append_header('object_id', ERB::Util.url_encode(@object_id))) unless @object_id.nil?
      token_acquire_url = (token_acquire_url + '&' + append_header('msi_res_id', ERB::Util.url_encode(@msi_res_id))) unless @msi_res_id.nil?
      url = URI.parse(token_acquire_url)

      connection = Faraday.new(:url => url, :ssl => MsRest.ssl_options) do |builder|
        builder.adapter Faraday.default_adapter
      end

      retry_value = 1
      max_retry = 20
      response = nil
      user_defined_time_limit = ENV['USER_DEFINED_IMDS_MAX_RETRY_TIME'].nil? ? 104900:ENV['USER_DEFINED_IMDS_MAX_RETRY_TIME']
      total_wait = 0

      slots = []
      (0..max_retry-1).each do |i|
        slots << (100 * ((2 << i) - 1) /1000.to_f)
      end

      while retry_value <= max_retry && total_wait < user_defined_time_limit
        response = connection.get do |request|
          request.headers['Metadata'] = 'true'
          request.headers['User-Agent'] = "Azure-SDK-For-Ruby/ms_rest_azure/#{MsRestAzure::VERSION}"
        end

        if response.status == 410 || response.status == 429 || response.status == 404 || (response.status > 499 && response.status < 600)
          puts slots.inspect
          wait = slots[0..retry_value].sample
          wait = wait < 1 ? 3 : wait
          wait = (response.status == 410 && wait < 70) ? 70 : wait
          retry_value += 1
          if (retry_value > max_retry)
            break
          end
          wait = wait > user_defined_time_limit ? user_defined_time_limit : wait
          sleep(wait)
          total_wait += wait
        elsif response.status != 200
          fail AzureOperationError, "Couldn't acquire access token from Managed Service Identity, please verify your tenant id, port and settings"
        else
          break
        end
      end

       if retry_value > max_retry
         fail AzureOperationError, "MSI: Failed to acquire tokens after #{max_retry} times"
       end

      response_body = JSON.load(response.body)
      @token = response_body['access_token']
      @token_expires_on = Time.at(Integer(response_body['expires_on']))
      @token_type = response_body['token_type']
    end

    #
    # Checks whether token is about to expire.
    #
    # @return [Bool] True if token is about to expire, false otherwise.
    def token_expired
      @token.nil? || Time.now >= @token_expires_on + expiration_threshold
    end

    #
    # Retrieves a new authentication token.
    #
    # @return [String] new authentication token.
    def acquire_token
      token_acquire_url = TOKEN_ACQUIRE_URL.dup
      token_acquire_url['{port}'] = @port.to_s

      url = URI.parse(token_acquire_url)

      connection = Faraday.new(:url => url, :ssl => MsRest.ssl_options) do |builder|
        builder.adapter Faraday.default_adapter
      end

      request_body = REQUEST_BODY_PATTERN.dup
      request_body['{resource_uri}'] = ERB::Util.url_encode(@settings.token_audience)
      request_body = set_msi_id(request_body, 'client_id', @client_id) unless @client_id.nil?
      request_body = set_msi_id(request_body, 'object_id', @object_id) unless @object_id.nil?
      request_body = set_msi_id(request_body, 'msi_res_id', @msi_res_id) unless @msi_res_id.nil?

      response = connection.post do |request|
        request.headers['content-type'] = 'application/x-www-form-urlencoded'
        request.headers['Metadata'] = 'true'
        request.body = request_body
      end

      fail AzureOperationError,
          'Couldn\'t acquire access token from Managed Service Identity, please verify your tenant id, port and settings' unless response.status == 200

      response_body = JSON.load(response.body)
      @token = response_body['access_token']
      @token_expires_on = Time.at(Integer(response_body['expires_on']))
      @token_type = response_body['token_type']
    end

    #
    # Sets user assigned identity value in request body
    # @param request_body [String] body of the request used to acquire token
    # @param id_type [String] type of id to send 'client_id', 'object_id' or 'msi_res_id'
    # @param id_value [String] id of the user assigned identity
    #
    # @return [String] new request body with the addition of <id_type>=<id_value>.
    def set_msi_id(request_body, id_type, id_value)
      user_assigned_identity = USER_ASSIGNED_IDENTITY.dup
      request_body = [request_body, user_assigned_identity].join(',')
      request_body['{id_type}'] = id_type
      request_body['{user_assigned_identity}'] = ERB::Util.url_encode(id_value)

      return request_body
    end
  end

end

