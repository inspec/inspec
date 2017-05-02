# encoding: utf-8
# author: Nolan Davidson
# license: All rights reserved

module Inspec::Resources
  class OracleSession < Inspec.resource(1)
    name 'oracle_session'
    desc 'Use the oracle_session InSpec resource to test commands against an Oracle database'
    example "
      sql = oracle_session('my_user','password')
      describe sql.query('SELECT NAME FROM v$database;') do
        its('stdout') { should_not match(/test/) }
      end
    "

    def initialize(user = nil, pass = nil, service = nil)
      @user = user
      @pass = pass
      @service = service
      return skip_resource("Can't run Oracle checks without authentication") if user.nil? or pass.nil?
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"').gsub(/\$/, '\\$')

      cmd = inspec.command("echo \"#{escaped_query}\" | sqlplus -s #{@user}/#{@pass}@localhost/#{@service}")
      out = cmd.stdout + "\n" + cmd.stderr
      if out.downcase =~ /^error/
        skip_resource("Can't connect to Oracle instance for SQL checks.")
      end

      cmd
    end

    def to_s
      'Oracle Session'
    end
  end
end
