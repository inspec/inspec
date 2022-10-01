require "uri" unless defined?(URI)
require "inspec/cli"

module InspecPlugins
  module Parallelism
    class ListCommand

      SUPPORTED_RESOURCES = {
        aws_ecr_images: { property: "digests", list_transport: "ecr-image://%s", target_transport: :aws },
      }.freeze

      SUPPORTED_TARGET_TRANSPORTS = {
        aws: { dependency_name: "inspec-aws", dependency_uri: "https://github.com/inspec/inspec-aws.git" },
        azure: { dependency_name: "inspec-azure", dependency_uri: "https://github.com/inspec/inspec-azure.git" },
        gcp: { dependency_name: "inspec-gcp", dependency_uri: "https://github.com/inspec/inspec-gcp.git" },
      }.freeze

      attr_reader :parameters, :query, :resource_name, :target_uri, :ui
      def initialize(options)
        @ui = Inspec::UI.new

        # Make sure resource is supported
        @resource_name = options[:resource].to_sym
        unless SUPPORTED_RESOURCES.key?(@resource_name)
          ui.error("Unsupported resource '#{resource_name}'. Currently supported resources: #{SUPPORTED_RESOURCES.keys.join(", ")}")
          ui.exit(:usage_error)
        end

        # Make sure transport schema is supported
        @target_uri = options[:target] || "#{SUPPORTED_RESOURCES[resource_name][:target_transport]}://"
        target_transport = URI(target_uri).scheme.to_sym
        unless SUPPORTED_TARGET_TRANSPORTS.key?(target_transport)
          ui.error("Unsupported target transport '#{target_transport}'. Supported transports: #{SUPPORTED_TARGET_TRANSPORTS.keys.join(", ")}")
          ui.exit(:usage_error)
        end
        unless target_transport == SUPPORTED_RESOURCES[resource_name][:target_transport]
          ui.error("Unsupported target transport '#{target_transport}' for resource '#{resource_name}'. Supported transport: '#{SUPPORTED_RESOURCES[resource_name][:target_transport]}'")
          ui.exit(:usage_error)
        end

        # Pass through other options
        @parameters = options[:parameters]
        @query = options[:query]
      end

      def run
        # HACK: find a better way of doing this that does not involve generating an actual profile
        Dir.mktmpdir do |tmpdir|
          profile_path = File.join(tmpdir, "list-profile")
          FileUtils.mkdir_p profile_path
          generate_inspec_yml(profile_path)
          generate_control_file(profile_path)
          execute_profile(profile_path)
        end
      end

      def generate_inspec_yml(profile_path)
        #  Add dep based on transport in inspec.yml
        yaml_template = <<EOY
name: list-profile
title: Temporary InSpec Profile to List Resources
maintainer: Auto-generated
copyright: None
copyright_email: none@example.com
license: Apache-2.0
summary: Lists resources on a plural resource
version: 0.1.0
supports:
  platform: %s
depends:
  - name: %s
    git: %s
EOY
        transport = SUPPORTED_RESOURCES[resource_name][:target_transport]
        content = format(
          yaml_template,
          transport,
          SUPPORTED_TARGET_TRANSPORTS[transport][:dependency_name],
          SUPPORTED_TARGET_TRANSPORTS[transport][:dependency_uri]
        )
        File.write(File.join(profile_path, "inspec.yml"), content)
      end

      def generate_control_file(profile_path)
        FileUtils.mkdir_p File.join(profile_path, "controls")
        #   add plural resource lookup with provided query
        #   add describe block in each loop
        control_template = <<EOC
control "the-control" do
  # HACK: Use description to pass through extra information, used by the reporter
  desc "resource_name", "%s"
  desc "parameters", "%s"
  desc "query", "%s"
  %s(%s).where(%s).%s.each do |id|
    describe id do
      # It took some fumbling to find something that would always match.
      it { should match //  }
    end
  end
end
EOC
        content = format(
          control_template,
          resource_name,
          parameters,
          query,
          resource_name,
          parameters,
          query,
          SUPPORTED_RESOURCES[resource_name][:property]
        )
        File.write(File.join(profile_path, "controls", "list.rb"), content)
      end

      def execute_profile(profile_path)
        arguments = ["exec"]
        arguments << profile_path
        arguments << ["-t"] << target_uri
        arguments << ["--reporter"] << "parallel-list"
        Inspec::InspecCLI.start(arguments.flatten, enforce_license: true)
      end
    end
  end
end
