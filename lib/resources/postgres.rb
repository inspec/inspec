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
      case inspec.os[:family]
      when 'ubuntu', 'debian'
        @service = 'postgresql'
        @data_dir = '/var/lib/postgresql'
        @version = inspec.command('ls /etc/postgresql/').stdout.chomp
        @conf_dir = "/etc/postgresql/#{@version}/main"
        @conf_path = File.join @conf_dir, 'postgresql.conf'

      when 'arch'
        @service = 'postgresql'
        @data_dir = '/var/lib/postgres/data'
        @conf_dir = '/var/lib/postgres/data'
        @conf_path = File.join @conf_dir, 'postgresql.conf'

      else
        @service = 'postgresql'
        @data_dir = '/var/lib/postgresql'
        @conf_dir = '/var/lib/pgsql/data'
        @conf_path = File.join @conf_dir, 'postgresql.conf'
      end
    end

    def to_s
      'PostgreSQL'
    end
  end
end
