# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

class Mysql
  attr_reader :package, :service, :conf_dir, :conf_path, :data_dir, :log_dir, :log_path, :log_group, :log_dir_group
  def initialize
    # set OS-dependent filenames and paths
    case os[:family]
    when 'ubuntu', 'debian'
      @package = 'mysql-server'
      @service = 'mysql'
      @conf_path = '/etc/mysql/my.cnf'
      @conf_dir = '/etc/mysql/'
      @data_dir = '/var/lib/mysql/'
      @log_dir = '/var/log/'
      @log_path = '/var/log/mysql.log'
      @log_group = 'adm'
      case os[:release]
      when '14.04'
        @log_dir_group = 'syslog'
      else
        @log_dir_group = 'root'
      end
    when 'redhat', 'fedora'
      @package = 'mysql-server'
      @service = 'mysqld'
      @conf_path = '/etc/my.cnf'
      @conf_dir = '/etc/'
      @data_dir = '/var/lib/mysql/'
      @log_dir = '/var/log/'
      @log_path = '/var/log/mysqld.log'
      @log_group = 'mysql'
      @log_dir_group = 'root'
    when 'arch'
      @package = 'mariadb'
      @service = 'mysql'
      @conf_path = '/etc/mysql/my.cnf'
      @conf_dir = '/etc/mysql/'
      @data_dir = '/var/lib/mysql/'
      @log_dir = '/var/log/'
      @log_path = '/var/log/mysql.log'
      @log_group = 'mysql'
      @log_dir_group = 'root'
    else
      # TODO could not detect
      @service = 'mysqld'
      @conf_path = '/etc/my.cnf'
      @conf_dir = '/etc/'
      @data_dir = '/var/lib/mysql/'
      @log_dir = '/var/log/'
      @log_path = '/var/log/mysqld.log'
      @log_group = 'mysql'
      @log_dir_group = 'root'
    end
  end
end

module Serverspec::Type
  def mysql
    @mysql ||= Mysql.new()
  end
end