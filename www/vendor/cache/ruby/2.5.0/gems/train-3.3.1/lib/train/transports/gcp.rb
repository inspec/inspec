# encoding: utf-8

require "train/plugins"
require "google/apis"
require "google/apis/cloudresourcemanager_v1"
require "google/apis/compute_v1"
require "google/apis/storage_v1"
require "google/apis/iam_v1"
require "google/apis/admin_directory_v1"
require "googleauth"

module Train::Transports
  class Gcp < Train.plugin(1)
    name "gcp"

    # GCP will look automatically for the below env var for service accounts etc. :
    option :google_application_credentials, required: false do
      ENV["GOOGLE_APPLICATION_CREDENTIALS"]
    end
    # see https://cloud.google.com/docs/authentication/production#providing_credentials_to_your_application
    # In the absence of this, the client is expected to have already set up local credentials via:
    #   $ gcloud auth application-default login
    #   $ gcloud config set project <project-name>
    # GCP projects can have default regions / zones set, see:
    # https://cloud.google.com/compute/docs/regions-zones/changing-default-zone-region
    # can also specify project via env var:
    option :google_cloud_project, required: false do
      ENV["GOOGLE_CLOUD_PROJECT"]
    end
    option :google_super_admin_email, required: false do
      ENV["GOOGLE_SUPER_ADMIN_EMAIL"]
    end

    def connection(_ = nil)
      @connection ||= Connection.new(@options)
    end

    class Connection < BaseConnection
      def initialize(options)
        super(options)

        # additional GCP platform metadata
        release = Gem.loaded_specs["google-api-client"].version
        @platform_details = { release: "google-api-client-v#{release}" }

        # Initialize the client object cache
        @cache_enabled[:api_call] = true
        @cache[:api_call] = {}

        connect
      end

      def platform
        force_platform!("gcp", @platform_details)
      end

      # Instantiate some named classes for ease of use
      def gcp_compute_client
        gcp_client(Google::Apis::ComputeV1::ComputeService)
      end

      def gcp_iam_client
        gcp_client(Google::Apis::IamV1::IamService)
      end

      def gcp_project_client
        gcp_client(Google::Apis::CloudresourcemanagerV1::CloudResourceManagerService)
      end

      def gcp_storage_client
        gcp_client(Google::Apis::StorageV1::StorageService)
      end

      def gcp_admin_client
        scopes = ["https://www.googleapis.com/auth/admin.directory.user.readonly"]
        authorization = Google::Auth.get_application_default(scopes).dup
        # Use of the Admin API requires delegation (impersonation). An email address of a Super Admin in
        # the G Suite account may be required.
        authorization.sub = @options[:google_super_admin_email] if @options[:google_super_admin_email]
        Google::Apis::RequestOptions.default.authorization = authorization
        gcp_client(Google::Apis::AdminDirectoryV1::DirectoryService)
      end

      # Let's allow for other clients too
      def gcp_client(klass)
        return klass.new unless cache_enabled?(:api_call)

        @cache[:api_call][klass.to_s.to_sym] ||= klass.new
      end

      def connect
        ENV["GOOGLE_APPLICATION_CREDENTIALS"] = @options[:google_application_credentials] if @options[:google_application_credentials]
        ENV["GOOGLE_CLOUD_PROJECT"] = @options[:google_cloud_project] if @options[:google_cloud_project]
        # GCP initialization
        scopes = ["https://www.googleapis.com/auth/cloud-platform",
                  "https://www.googleapis.com/auth/compute"]
        authorization = Google::Auth.get_application_default(scopes)
        Google::Apis::ClientOptions.default.application_name = "chef-inspec-train"
        Google::Apis::ClientOptions.default.application_version = Train::VERSION
        Google::Apis::RequestOptions.default.authorization = authorization
      end

      def uri
        "gcp://#{unique_identifier}"
      end

      def unique_identifier
        unique_id = "default"
        # use auth client_id for users (issuer is nil)
        unique_id = gcp_iam_client.request_options.authorization.client_id unless gcp_iam_client.request_options.authorization.client_id.nil?
        # for service account credentials (client_id is nil)
        unique_id = gcp_iam_client.request_options.authorization.issuer unless gcp_iam_client.request_options.authorization.issuer.nil?
        unique_id
      end
    end
  end
end
