# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
require 'inspec/plugin/v1'

module Inspec
  class ProfileNotFound < StandardError; end

  class Resource
    def self.default_registry
      @default_registry ||= {}
    end

    def self.registry
      @registry ||= default_registry
    end

    def self.supports
      @supports ||= {}
    end

    def self.new_registry
      default_registry.dup
    end

    # Creates the inner DSL which includes all resources for
    # creating tests. It is always connected to one target,
    # which is specified via the backend argument.
    #
    # @param backend [BackendRunner] exposing the target to resources
    # @return [ResourcesDSL]
    def self.create_dsl(profile_context)
      backend = profile_context.backend
      my_registry = profile_context.resource_registry

      Module.new do
        define_method :resource_class do |profile_name, resource_name|
          inner_context = if profile_name == profile_context.profile_id
                            profile_context
                          else
                            profile_context.subcontext_by_name(profile_name)
                          end

          raise ProfileNotFound, "Cannot find profile named: #{profile_name}" if inner_context.nil?
          inner_context.resource_registry[resource_name]
        end

        my_registry.each do |id, r|
          define_method id.to_sym do |*args|
            r.new(backend, id.to_s, *args)
          end

          # confirm backend custom resources have access to other custom resources
          next if backend.respond_to?(id)
          backend.class.send(:define_method, id.to_sym) do |*args|
            r.new(backend, id.to_s, *args)
          end
        end

        # attach backend so we have access to all resources and
        # the train connection object
        define_method :inspec do
          backend
        end
      end
    end
  end

  # Retrieve the base class for creating a new resource.
  # Create classes that inherit from this class.
  #
  # @param [int] version the resource version to use
  # @return [Resource] base class for creating a new resource
  def self.resource(version)
    validate_resource_dsl_version!(version)
    Inspec::Plugins::Resource
  end

  def self.validate_resource_dsl_version!(version)
    raise 'Only resource version 1 is supported!' if version != 1
  end
end

# Many resources use FilterTable.
require 'utils/filter'

# Detect if we are running the stripped-down inspec-core
# This relies on AWS being stripped from the inspec-core gem
inspec_core_only = !File.exist?(File.join(File.dirname(__FILE__), '..', 'resource_support', 'aws.rb'))

# Do not attempt to load cloud resources if we are in inspec-core mode
unless inspec_core_only
  require 'resource_support/aws'
  require 'resources/azure/azure_backend.rb'
  require 'resources/azure/azure_generic_resource.rb'
  require 'resources/azure/azure_resource_group.rb'
  require 'resources/azure/azure_virtual_machine.rb'
  require 'resources/azure/azure_virtual_machine_data_disk.rb'
end

require 'resources/aide_conf'
require 'resources/apache'
require 'resources/apache_conf'
require 'resources/apt'
require 'resources/audit_policy'
require 'resources/auditd'
require 'resources/auditd_conf'
require 'resources/bash'
require 'resources/bond'
require 'resources/bridge'
require 'resources/chocolatey_package'
require 'resources/command'
require 'resources/cran'
require 'resources/cpan'
require 'resources/crontab'
require 'resources/dh_params'
require 'resources/directory'
require 'resources/docker'
require 'resources/docker_container'
require 'resources/docker_image'
require 'resources/docker_plugin'
require 'resources/docker_service'
require 'resources/elasticsearch'
require 'resources/etc_fstab'
require 'resources/etc_group'
require 'resources/etc_hosts_allow_deny'
require 'resources/etc_hosts'
require 'resources/file'
require 'resources/filesystem'
require 'resources/firewalld'
require 'resources/gem'
require 'resources/groups'
require 'resources/grub_conf'
require 'resources/host'
require 'resources/http'
require 'resources/iis_app'
require 'resources/iis_app_pool'
require 'resources/iis_site'
require 'resources/inetd_conf'
require 'resources/interface'
require 'resources/iptables'
require 'resources/json'
require 'resources/kernel_module'
require 'resources/kernel_parameter'
require 'resources/key_rsa'
require 'resources/limits_conf'
require 'resources/login_def'
require 'resources/mount'
require 'resources/mssql_session'
require 'resources/mysql'
require 'resources/mysql_conf'
require 'resources/mysql_session'
require 'resources/nginx'
require 'resources/nginx_conf'
require 'resources/npm'
require 'resources/ntp_conf'
require 'resources/oneget'
require 'resources/oracledb_session'
require 'resources/os'
require 'resources/os_env'
require 'resources/package'
require 'resources/packages'
require 'resources/parse_config'
require 'resources/passwd'
require 'resources/pip'
require 'resources/platform'
require 'resources/port'
require 'resources/postgres'
require 'resources/postgres_conf'
require 'resources/postgres_hba_conf'
require 'resources/postgres_ident_conf'
require 'resources/postgres_session'
require 'resources/powershell'
require 'resources/processes'
require 'resources/rabbitmq_conf'
require 'resources/registry_key'
require 'resources/security_identifier'
require 'resources/security_policy'
require 'resources/service'
require 'resources/shadow'
require 'resources/ssh_conf'
require 'resources/ssl'
require 'resources/sys_info'
require 'resources/toml'
require 'resources/users'
require 'resources/vbscript'
require 'resources/virtualization'
require 'resources/windows_feature'
require 'resources/windows_hotfix'
require 'resources/windows_task'
require 'resources/wmi'
require 'resources/x509_certificate'
require 'resources/xinetd'
require 'resources/yum'
require 'resources/zfs_dataset'
require 'resources/zfs_pool'

# file formats, depend on json implementation
require 'resources/json'
require 'resources/yaml'
require 'resources/csv'
require 'resources/ini'
require 'resources/xml'
