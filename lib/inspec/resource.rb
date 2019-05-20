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

require 'inspec/resources/aide_conf'
require 'inspec/resources/apache'
require 'inspec/resources/apache_conf'
require 'inspec/resources/apt'
require 'inspec/resources/audit_policy'
require 'inspec/resources/auditd'
require 'inspec/resources/auditd_conf'
require 'inspec/resources/bash'
require 'inspec/resources/bond'
require 'inspec/resources/bridge'
require 'inspec/resources/chocolatey_package'
require 'inspec/resources/command'
require 'inspec/resources/cran'
require 'inspec/resources/cpan'
require 'inspec/resources/crontab'
require 'inspec/resources/dh_params'
require 'inspec/resources/directory'
require 'inspec/resources/docker'
require 'inspec/resources/docker_container'
require 'inspec/resources/docker_image'
require 'inspec/resources/docker_plugin'
require 'inspec/resources/docker_service'
require 'inspec/resources/elasticsearch'
require 'inspec/resources/etc_fstab'
require 'inspec/resources/etc_group'
require 'inspec/resources/etc_hosts_allow_deny'
require 'inspec/resources/etc_hosts'
require 'inspec/resources/file'
require 'inspec/resources/filesystem'
require 'inspec/resources/firewalld'
require 'inspec/resources/gem'
require 'inspec/resources/groups'
require 'inspec/resources/grub_conf'
require 'inspec/resources/host'
require 'inspec/resources/http'
require 'inspec/resources/iis_app'
require 'inspec/resources/iis_app_pool'
require 'inspec/resources/iis_site'
require 'inspec/resources/inetd_conf'
require 'inspec/resources/interface'
require 'inspec/resources/iptables'
require 'inspec/resources/kernel_module'
require 'inspec/resources/kernel_parameter'
require 'inspec/resources/key_rsa'
require 'inspec/resources/ksh'
require 'inspec/resources/limits_conf'
require 'inspec/resources/login_def'
require 'inspec/resources/mount'
require 'inspec/resources/mssql_session'
require 'inspec/resources/mysql'
require 'inspec/resources/mysql_conf'
require 'inspec/resources/mysql_session'
require 'inspec/resources/nginx'
require 'inspec/resources/nginx_conf'
require 'inspec/resources/npm'
require 'inspec/resources/ntp_conf'
require 'inspec/resources/oneget'
require 'inspec/resources/oracledb_session'
require 'inspec/resources/os'
require 'inspec/resources/os_env'
require 'inspec/resources/package'
require 'inspec/resources/packages'
require 'inspec/resources/parse_config'
require 'inspec/resources/passwd'
require 'inspec/resources/pip'
require 'inspec/resources/platform'
require 'inspec/resources/port'
require 'inspec/resources/postgres'
require 'inspec/resources/postgres_conf'
require 'inspec/resources/postgres_hba_conf'
require 'inspec/resources/postgres_ident_conf'
require 'inspec/resources/postgres_session'
require 'inspec/resources/powershell'
require 'inspec/resources/processes'
require 'inspec/resources/rabbitmq_conf'
require 'inspec/resources/registry_key'
require 'inspec/resources/security_identifier'
require 'inspec/resources/security_policy'
require 'inspec/resources/service'
require 'inspec/resources/shadow'
require 'inspec/resources/ssh_conf'
require 'inspec/resources/ssl'
require 'inspec/resources/sys_info'
require 'inspec/resources/toml'
require 'inspec/resources/users'
require 'inspec/resources/vbscript'
require 'inspec/resources/virtualization'
require 'inspec/resources/windows_feature'
require 'inspec/resources/windows_hotfix'
require 'inspec/resources/windows_task'
require 'inspec/resources/wmi'
require 'inspec/resources/x509_certificate'
require 'inspec/resources/xinetd'
require 'inspec/resources/yum'
require 'inspec/resources/zfs_dataset'
require 'inspec/resources/zfs_pool'

# file formats, depend on json implementation
require 'inspec/resources/json'
require 'inspec/resources/yaml'
require 'inspec/resources/csv'
require 'inspec/resources/ini'
require 'inspec/resources/xml'
