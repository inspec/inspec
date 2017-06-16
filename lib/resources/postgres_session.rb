# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# author: Aaron Lippold
# license: All rights reserved

module Inspec::Resources
  class Lines
    attr_reader :output

    def initialize(raw, desc)
      @output = raw
      @desc = desc
    end

    def lines
      output.split("\n")
    end

    def to_s
      @desc
    end
  end

  class PostgresSession < Inspec.resource(1)
    name 'postgres_session'
    desc 'Use the postgres_session InSpec audit resource to test SQL commands run against a PostgreSQL database.'
    example "
      sql = postgres_session('username', 'password', 'host')
      query('sql_query', ['database_name'])` contains the query and (optional) database to execute

      # default values:
      # username: 'postgres'
      # host: 'localhost'
      # db: databse == db_user running the sql query

      describe sql.query('SELECT * FROM pg_shadow WHERE passwd IS NULL;') do
        its('output') { should eq('') }
      end
    "

    def initialize(user, pass, host = nil)
      @user = user || 'postgres'
      @pass = pass
      @host = host || 'localhost'
    end

    def query(query, db = [])
      dbs = db.map { |x| "-d #{x}" }.join(' ')
      # TODO: simple escape, must be handled by a library
      # that does this securely
      escaped_query = query.gsub(/\\/, '\\\\').gsub(/"/, '\\"').gsub(/\$/, '\\$')
      # run the query
      cmd = inspec.command("PGPASSWORD='#{@pass}' psql -U #{@user} #{dbs} -h #{@host} -A -t -c \"#{escaped_query}\"")
      out = cmd.stdout + "\n" + cmd.stderr
      if cmd.exit_status != 0 or
         out =~ /could not connect to .*/ or
         out.downcase =~ /^error/
        # skip this test if the server can't run the query
        skip_resource "Can't read run query #{query.inspect} on postgres_session: #{out}"
      else
        Lines.new(cmd.stdout.strip, "PostgreSQL query: #{query}")
      end
    end
  end
end
