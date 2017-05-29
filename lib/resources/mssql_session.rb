# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'hashie/mash'
require 'utils/database_helpers'

module Inspec::Resources
  # This requires the `mssql` tool available on platform
  # @see https://docs.microsoft.com/en-us/sql/relational-databases/scripting/sqlcmd-use-the-utility
  # @see https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-connect-and-query-sqlcmd
  class MssqlSession < Inspec.resource(1)
    name 'mssql_session'
    desc 'Use the mssql_session InSpec audit resource to test SQL commands run against a MS Sql Server database.'
    example "
      # Using SQL authentication
      sql = mssql_session(user: 'myuser', pass: 'mypassword')
      describe sql.query('select * from sys.databases where name like \'*test*\') do
        its('stdout') { should_not match(/test/) }
      end

      # Passing no credentials to mssql_session forces it to use Windows authentication
      sql_windows_auth = mssql_session
      describe sql_window_auth.query('select * from sys.databases where name like \'*test*\') do
        its('stdout') { should_not match(/test/) }
      end
    "

    attr_reader :user, :pass, :host

    def initialize(opts = {})
      @user = opts[:user]
      @pass = opts[:pass]
      @host = opts[:host] || 'localhost'
      @instance = opts[:instance]

      # check if sqlcmd is available
      skip_resource('sqlcmd is missing') if !inspec.command('sqlcmd').exist?
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"').gsub(/\$/, '\\$').gsub(/\@/, '`@')
      # surpress 'x rows affected' in SQLCMD with 'set nocount on;'
      cmd_string = "sqlcmd -Q \"set nocount on; #{escaped_query}\" -W -w 1024 -s ','"
      cmd_string += " -U #{@user} -P '#{@pass}'" unless @user.nil? or @pass.nil?
      if @instance.nil?
        cmd_string += " -S #{@host}"
      else
        cmd_string += " -S #{@host}\\#{@instance}"
      end
      cmd = inspec.command(cmd_string)
      out = cmd.stdout + "\n" + cmd.stderr
      if out =~ /Sqlcmd: Error/
        return skip_resource("Can't connect to the MS SQL Server.")
      end
      SQLQueryResult.new(cmd, parse_result(cmd))
    end

    def to_s
      'MSSQL session'
    end

    private

    def parse_csv_result(cmd)
      require 'csv'
      table = CSV.parse(cmd.stdout, { headers: true })

      # remove first row, since it will be a seperator line
      table.delete(0)

      # convert to hash
      headers = table.headers

      results = table.map { |row|
        res = {}
        headers.each { |header|
          res[header.downcase] = row[header]
        }
        Hashie::Mash.new(res)
      }
      results
    end
  end
end
