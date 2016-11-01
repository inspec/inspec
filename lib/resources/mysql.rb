# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

module Inspec::Resources
  class Mysql < Inspec.resource(1)
    name 'mysql'

    attr_reader :package, :service, :conf_dir, :conf_path, :data_dir, :log_dir, :log_path, :log_group, :log_dir_group
    def initialize
      # set OS-dependent filenames and paths
      case inspec.os[:family]
      when 'debian'
        init_ubuntu
      when 'redhat', 'fedora'
        init_redhat
      when 'arch'
        init_arch
      else
        # TODO: could not detect
        init_default
      end
    end

    def init_ubuntu
      @package = 'mysql-server'
      @service = 'mysql'
      @conf_path = '/etc/mysql/my.cnf'
      @conf_dir = '/etc/mysql/'
      @data_dir = '/var/lib/mysql/'
      @log_dir = '/var/log/'
      @log_path = '/var/log/mysql.log'
      @log_group = 'adm'
      case inspec.os[:release]
      when '14.04'
        @log_dir_group = 'syslog'
      else
        @log_dir_group = 'root'
      end
    end

    def init_redhat
      @package = 'mysql-server'
      @service = 'mysqld'
      @conf_path = '/etc/my.cnf'
      @conf_dir = '/etc/'
      @data_dir = '/var/lib/mysql/'
      @log_dir = '/var/log/'
      @log_path = '/var/log/mysqld.log'
      @log_group = 'mysql'
      @log_dir_group = 'root'
    end

    def init_arch
      @package = 'mariadb'
      @service = 'mysql'
      @conf_path = '/etc/mysql/my.cnf'
      @conf_dir = '/etc/mysql/'
      @data_dir = '/var/lib/mysql/'
      @log_dir = '/var/log/'
      @log_path = '/var/log/mysql.log'
      @log_group = 'mysql'
      @log_dir_group = 'root'
    end

    def init_default
      @service = 'mysqld'
      @conf_path = '/etc/my.cnf'
      @conf_dir = '/etc/'
      @data_dir = '/var/lib/mysql/'
      @log_dir = '/var/log/'
      @log_path = '/var/log/mysqld.log'
      @log_group = 'mysql'
      @log_dir_group = 'root'
    end

    def to_s
      'MySQL'
    end
  end
end
