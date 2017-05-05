# encoding: utf-8
# author: Nolan Davidson
# license: All rights reserved

module Inspec::Resources
  class OracledbSession < Inspec.resource(1)
    name 'oracledb_session'
    desc 'Use the oracledb_session InSpec resource to test commands against an Oracle database'
    example "
      sql = oracledb_session(user: 'my_user', pass: 'password')
      describe sql.query('SELECT NAME FROM v$database;') do
        its('stdout') { should_not match(/test/) }
      end
    "

    attr_reader :user, :pass, :host, :sid, :sqlplus_bin

    def initialize(opts = {})
      @user = opts[:user]
      @pass = opts[:pass]
      @host = opts[:host] || 'localhost'
      @sid = opts[:sid]
      @sqlplus_bin = opts[:sqlplus_bin] || 'sqlplus'
      return skip_resource("Can't run Oracle checks without authentication") if @user.nil? or @pass.nil?
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"')
      cmd = inspec.command("echo \"#{escaped_query}\" | #{@sqlplus_bin} -s #{@user}/#{@pass}@#{@host}/#{@sid}")
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
