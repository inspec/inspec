# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

module Inspec::Resources
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
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"').gsub(/\$/, '\\$').gsub(/\@/, '`@')
      cmd_string = "sqlcmd -Q \"#{escaped_query}\""
      cmd_string += " -U #{@user} -P #{@pass}" unless @user.nil? or @pass.nil?
      if @instance.nil?
        cmd_string += " -S #{@host}"
      else
        cmd_string += " -S #{@host}\\#{@instance}"
      end
      puts cmd_string
      cmd = inspec.command(cmd_string)
      out = cmd.stdout + "\n" + cmd.stderr
      if out =~ /Sqlcmd: Error/
        skip_resource("Can't connect to the MS SQL Server.")
      end
      cmd
    end

    def to_s
      'MSSQL session'
    end
  end
end
