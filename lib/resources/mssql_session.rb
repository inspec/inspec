# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

module Inspec::Resources
  class MssqlSession < Inspec.resource(1)
    name 'mssql_session'
    desc 'Use the mssql_session InSpec audit resource to test SQL commands run against a MS Sql Server database.'
    example "
      sql = mssql_session('myuser','mypassword')
      describe sql.query('select * from sys.databases where name like \'*test*\') do
        its('stdout') {should_not match(/test/) }
      end

      # Passing no credentials to mssql_session forces it to use Windows authentication
      sql_windows_auth = mssql_session
      describe sql_window_auth.query('select * from sys.databases where name like \'*test*\') do
        its('stdout') {should_not match(/test/) }
      end
    "

    def initialize(user = nil, pass = nil)
      @user = user
      @pass = pass
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"').gsub(/\$/, '\\$').gsub(/\@/, '`@')
      cmd_string =  if @user.nil? or @pass.nil?
                      "sqlcmd -Q \"#{escaped_query}\""
                    else
                      "sqlcmd -U #{@user} -P #{@pass} -Q \"#{escaped_query}\""
                    end
      cmd = inspec.command(cmd_string)
      out = cmd.stdout + "\n" + cmd.stderr
      if out =~ /Sqlcmd: Error/
        skip_resource("Can't connect to the MS SQL Server.")
      end
      cmd
    end

    def to_s
      'MSSQL'
    end
  end
end
