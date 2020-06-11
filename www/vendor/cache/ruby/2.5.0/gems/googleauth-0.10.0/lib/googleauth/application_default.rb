# Copyright 2015, Google Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require "googleauth/compute_engine"
require "googleauth/default_credentials"

module Google
  # Module Auth provides classes that provide Google-specific authorization
  # used to access Google APIs.
  module Auth
    NOT_FOUND_ERROR = <<~ERROR_MESSAGE.freeze
      Could not load the default credentials. Browse to
      https://developers.google.com/accounts/docs/application-default-credentials
      for more information
    ERROR_MESSAGE

    module_function

    # Obtains the default credentials implementation to use in this
    # environment.
    #
    # Use this to obtain the Application Default Credentials for accessing
    # Google APIs.  Application Default Credentials are described in detail
    # at http://goo.gl/IUuyuX.
    #
    # If supplied, scope is used to create the credentials instance, when it can
    # be applied.  E.g, on google compute engine and for user credentials the
    # scope is ignored.
    #
    # @param scope [string|array|nil] the scope(s) to access
    # @param options [Hash] Connection options. These may be used to configure
    #     the `Faraday::Connection` used for outgoing HTTP requests. For
    #     example, if a connection proxy must be used in the current network,
    #     you may provide a connection with with the needed proxy options.
    #     The following keys are recognized:
    #     * `:default_connection` The connection object to use for token
    #       refresh requests.
    #     * `:connection_builder` A `Proc` that creates and returns a
    #       connection to use for token refresh requests.
    #     * `:connection` The connection to use to determine whether GCE
    #       metadata credentials are available.
    def get_application_default scope = nil, options = {}
      creds = DefaultCredentials.from_env(scope, options) ||
              DefaultCredentials.from_well_known_path(scope, options) ||
              DefaultCredentials.from_system_default_path(scope, options)
      return creds unless creds.nil?
      unless GCECredentials.on_gce? options
        # Clear cache of the result of GCECredentials.on_gce?
        GCECredentials.unmemoize_all
        raise NOT_FOUND_ERROR
      end
      GCECredentials.new
    end
  end
end
