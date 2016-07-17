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
    "

    def initialize(user = nil, pass = nil)
      @user = user
      @pass = pass
      skip_resource('user and pass are required for MSSQL tests') if @user.nil? or @pass.nil?
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"').gsub(/\$/, '\\$').gsub(/\@/, '`@')
      cmd = inspec.command("sqlcmd -U #{@user} -P #{@pass} -Q \"#{escaped_query}\"")

      cmd
    end

    def to_s
      'MSSQL'
    end
  end
end
