require "inspec/dist"

module InspecPlugins
  module Compliance
    class API
      module Login
        include Inspec::Dist

        class CannotDetermineServerType < StandardError; end

        def login(options)
          raise ArgumentError, "Please specify a server using `#{EXEC_NAME} compliance login https://SERVER`" unless options["server"]

          options["server"] = URI("https://#{options["server"]}").to_s if URI(options["server"]).scheme.nil?

          options["server_type"] = InspecPlugins::Compliance::API.determine_server_type(options["server"], options["insecure"])

          case options["server_type"]
          when :automate2
            Login::Automate2Server.login(options)
          when :automate
            Login::AutomateServer.login(options)
          when :compliance
            Login::ComplianceServer.login(options)
          else
            raise CannotDetermineServerType, "Unable to determine if #{options["server"]} is a #{AUTOMATE_PRODUCT_NAME} or #{COMPLIANCE_PRODUCT_NAME} server"
          end
        end

        module Automate2Server
          def self.login(options)
            verify_thor_options(options)

            options["url"] = options["server"] + "/api/v0"
            token = options["dctoken"] || options["token"]
            store_access_token(options, token)
          end

          def self.store_access_token(options, token)
            config = InspecPlugins::Compliance::Configuration.new
            config.clean

            config["automate"] = {}
            config["automate"]["ent"] = "automate"
            config["automate"]["token_type"] = "dctoken"
            config["server"] = options["url"]
            config["user"] = options["user"]
            config["owner"] = options["user"]
            config["insecure"] = options["insecure"] || false
            config["server_type"] = options["server_type"].to_s
            config["token"] = token
            config["version"] = "0"

            config.store
            config
          end

          def self.verify_thor_options(o)
            error_msg = []

            error_msg.push("Please specify a user using `--user='USER'`") if o["user"].nil?

            if o["token"].nil? && o["dctoken"].nil?
              error_msg.push("Please specify a token using `--token='APITOKEN'`")
            end

            raise ArgumentError, error_msg.join("\n") unless error_msg.empty?
          end
        end

        module AutomateServer
          def self.login(options)
            verify_thor_options(options)

            options["url"] = options["server"] + "/compliance"
            token = options["dctoken"] || options["token"]
            store_access_token(options, token)
          end

          def self.store_access_token(options, token)
            token_type = if options["token"]
                           "usertoken"
                         else
                           "dctoken"
                         end

            config = InspecPlugins::Compliance::Configuration.new

            config.clean

            config["automate"] = {}
            config["automate"]["ent"] = options["ent"]
            config["automate"]["token_type"] = token_type
            config["server"] = options["url"]
            config["user"] = options["user"]
            config["insecure"] = options["insecure"] || false
            config["server_type"] = options["server_type"].to_s
            config["token"] = token
            config["version"] = InspecPlugins::Compliance::API.version(config)

            config.store
            config
          end

          # Automate login requires `--ent`, `--user`, and either `--token` or `--dctoken`
          def self.verify_thor_options(o)
            error_msg = []

            error_msg.push("Please specify a user using `--user='USER'`") if o["user"].nil?
            error_msg.push("Please specify an enterprise using `--ent='automate'`") if o["ent"].nil?

            if o["token"].nil? && o["dctoken"].nil?
              error_msg.push("Please specify a token using `--token='AUTOMATE_TOKEN'` or `--dctoken='DATA_COLLECTOR_TOKEN'`")
            end

            raise ArgumentError, error_msg.join("\n") unless error_msg.empty?
          end
        end

        module ComplianceServer
          include Inspec::Dist

          def self.login(options)
            compliance_verify_thor_options(options)

            options["url"] = options["server"] + "/api"

            if options["user"] && options["token"]
              compliance_store_access_token(options, options["token"])
            elsif options["user"] && options["password"]
              compliance_login_user_pass(options)
            elsif options["refresh_token"]
              compliance_login_refresh_token(options)
            end
          end

          def self.compliance_login_user_pass(options)
            success, msg, token = InspecPlugins::Compliance::API.get_token_via_password(
              options["url"],
              options["user"],
              options["password"],
              options["insecure"]
            )

            raise msg unless success

            compliance_store_access_token(options, token)
          end

          def self.compliance_login_refresh_token(options)
            success, msg, token = InspecPlugins::Compliance::API.get_token_via_refresh_token(
              options["url"],
              options["refresh_token"],
              options["insecure"]
            )

            raise msg unless success

            compliance_store_access_token(options, token)
          end

          def self.compliance_store_access_token(options, token)
            config = InspecPlugins::Compliance::Configuration.new
            config.clean

            config["user"] = options["user"] if options["user"]
            config["server"] = options["url"]
            config["insecure"] = options["insecure"] || false
            config["server_type"] = options["server_type"].to_s
            config["token"] = token
            config["version"] = InspecPlugins::Compliance::API.version(config)

            config.store
            config
          end

          # Compliance login requires `--user` or `--refresh_token`
          # If `--user` then either `--password`, `--token`, or `--refresh-token`, is required
          def self.compliance_verify_thor_options(o)
            error_msg = []

            error_msg.push("Please specify a server using `#{EXEC_NAME} compliance login https://SERVER`") if o["server"].nil?

            if o["user"].nil? && o["refresh_token"].nil?
              error_msg.push("Please specify a `--user='USER'` or a `--refresh-token='TOKEN'`")
            end

            if o["user"] && o["password"].nil? && o["token"].nil? && o["refresh_token"].nil?
              error_msg.push("Please specify either a `--password`, `--token`, or `--refresh-token`")
            end

            raise ArgumentError, error_msg.join("\n") unless error_msg.empty?
          end
        end
      end
    end
  end
end
