# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann
require 'inspec/plugins'

module Inspec
  class ProfileNotFound < StandardError; end

  class Resource
    def self.default_registry
      @default_registry ||= {}
    end

    def self.registry
      @registry ||= default_registry
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
        end

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
    if version != 1
      raise 'Only resource version 1 is supported!'
    end
  end
end

require 'resources/apache'
require 'resources/apache_conf'
require 'resources/apt'
require 'resources/audit_policy'
require 'resources/auditd_conf'
require 'resources/auditd_rules'
require 'resources/bash'
require 'resources/bond'
require 'resources/bridge'
require 'resources/command'
require 'resources/crontab'
require 'resources/dh_params'
require 'resources/directory'
require 'resources/docker'
require 'resources/docker_image'
require 'resources/docker_container'
require 'resources/etc_group'
require 'resources/file'
require 'resources/gem'
require 'resources/groups'
require 'resources/grub_conf'
require 'resources/host'
require 'resources/http'
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
require 'resources/port'
require 'resources/postgres'
require 'resources/postgres_conf'
require 'resources/postgres_session'
require 'resources/powershell'
require 'resources/processes'
require 'resources/rabbitmq_conf'
require 'resources/registry_key'
require 'resources/security_policy'
require 'resources/service'
require 'resources/shadow'
require 'resources/ssl'
require 'resources/ssh_conf'
require 'resources/sys_info'
require 'resources/users'
require 'resources/vbscript'
require 'resources/windows_feature'
require 'resources/windows_task'
require 'resources/xinetd'
require 'resources/wmi'
require 'resources/x509_certificate'
require 'resources/yum'
require 'resources/zfs_dataset'
require 'resources/zfs_pool'

# file formats, depend on json implementation
require 'resources/json'
require 'resources/yaml'
require 'resources/csv'
require 'resources/ini'
