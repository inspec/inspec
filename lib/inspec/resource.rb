# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/plugins'

module Inspec
  class Resource
    class Registry
      # empty class for namespacing resource classes in the registry
    end

    def self.registry
      @registry ||= {}
    end

    # Creates the inner DSL which includes all resources for
    # creating tests. It is always connected to one target,
    # which is specified via the backend argument.
    #
    # @param backend [BackendRunner] exposing the target to resources
    # @return [ResourcesDSL]
    def self.create_dsl(backend)
      # need the local name, to use it in the module creation further down
      my_registry = registry
      Module.new do
        my_registry.each do |id, r|
          define_method id.to_sym do |*args|
            r.new(backend, id.to_s, *args)
          end
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
    if version != 1
      fail 'Only resource version 1 is supported!'
    end
    Inspec::Plugins::Resource
  end
end

require 'resources/apache'
require 'resources/apache_conf'
require 'resources/apt'
require 'resources/audit_policy'
require 'resources/auditd_conf'
require 'resources/auditd_rules'
require 'resources/bond'
require 'resources/bridge'
require 'resources/command'
require 'resources/directory'
require 'resources/etc_group'
require 'resources/file'
require 'resources/gem'
require 'resources/group'
require 'resources/host'
require 'resources/inetd_conf'
require 'resources/interface'
require 'resources/iptables'
require 'resources/json'
require 'resources/kernel_module'
require 'resources/kernel_parameter'
require 'resources/limits_conf'
require 'resources/login_def'
require 'resources/mount'
require 'resources/mysql'
require 'resources/mysql_conf'
require 'resources/mysql_session'
require 'resources/npm'
require 'resources/ntp_conf'
require 'resources/oneget'
require 'resources/os'
require 'resources/os_env'
require 'resources/package'
require 'resources/parse_config'
require 'resources/passwd'
require 'resources/pip'
require 'resources/port'
require 'resources/postgres'
require 'resources/postgres_conf'
require 'resources/postgres_session'
require 'resources/powershell'
require 'resources/processes'
require 'resources/registry_key'
require 'resources/security_policy'
require 'resources/service'
require 'resources/shadow'
require 'resources/ssh_conf'
require 'resources/user'
require 'resources/vbscript'
require 'resources/windows_feature'
require 'resources/xinetd'
require 'resources/yum'

# file formats, depend on json implementation
require 'resources/json'
require 'resources/yaml'
require 'resources/csv'
require 'resources/ini'
