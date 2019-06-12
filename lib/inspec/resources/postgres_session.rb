# copyright: 2015, Vulcano Security GmbH

require "shellwords"

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
    name "postgres_session"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the postgres_session InSpec audit resource to test SQL commands run against a PostgreSQL database."
    example <<~EXAMPLE
      sql = postgres_session('username', 'password', 'host')
      query('sql_query', ['database_name'])` contains the query and (optional) database to execute

      # default values:
      # username: 'postgres'
      # host: 'localhost'
      # db: databse == db_user running the sql query

      describe sql.query('SELECT * FROM pg_shadow WHERE passwd IS NULL;') do
        its('output') { should eq '' }
      end
    EXAMPLE

    def initialize(user, pass, host = nil)
      @user = user || "postgres"
      @pass = pass
      @host = host || "localhost"
    end

    def query(query, db = [])
      psql_cmd = create_psql_cmd(query, db)
      cmd = inspec.command(psql_cmd)
      out = cmd.stdout + "\n" + cmd.stderr
      if cmd.exit_status != 0 || out =~ /could not connect to .*/ || out.downcase =~ /^error:.*/
        Lines.new(out, "PostgreSQL query with errors: #{query}")
      else
        Lines.new(cmd.stdout.strip, "PostgreSQL query: #{query}")
      end
    end

    private

    def escaped_query(query)
      Shellwords.escape(query)
    end

    def create_psql_cmd(query, db = [])
      dbs = db.map { |x| "-d #{x}" }.join(" ")
      "PGPASSWORD='#{@pass}' psql -U #{@user} #{dbs} -h #{@host} -A -t -c #{escaped_query(query)}"
    end
  end
end
