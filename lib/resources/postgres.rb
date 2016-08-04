# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

module Inspec::Resources
  class Postgres < Inspec.resource(1)
    name 'postgres'

    attr_reader :service, :data_dir, :conf_dir, :conf_path
    def initialize
      os = inspec.os
      if os.debian?
        @service = 'postgresql'
        @data_dir = '/var/lib/postgresql'
        @version = inspec.command('ls /etc/postgresql/').stdout.chomp
        @conf_dir = "/etc/postgresql/#{@version}/main"
      elsif os.redhat?
        @service = 'postgresql'
        @version = inspec.command('ls /var/lib/pgsql/').stdout.chomp
        @data_dir = "/var/lib/pgsql/#{@version}/data"
      elsif os[:name] == 'arch'
        @service = 'postgresql'
        @data_dir = '/var/lib/postgres/data'
        @conf_dir = '/var/lib/postgres/data'
      else
        @service = 'postgresql'
        @data_dir = '/var/lib/postgresql'
        @conf_dir = '/var/lib/pgsql/data'
      end

      @conf_path = File.join @conf_dir, 'postgresql.conf'
    end

    def to_s
      'PostgreSQL'
    end
  end
end
