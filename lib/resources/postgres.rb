# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

class Postgres < Vulcano.resource(1)
  name 'postgres'

  attr_reader :service, :data_dir, :conf_dir, :conf_path
  def initialize
    case vulcano.os[:family]
    when 'ubuntu', 'debian'
      @service = 'postgresql'
      @data_dir = '/var/lib/postgresql'
      @version = vulcano.command('ls /etc/postgresql/').stdout.chomp
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
end
