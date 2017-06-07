# encoding: utf-8
# author: Nolan Davidson
# author: Aaron Lippold
# author: Adam Leff
# license: All rights reserved

require 'shellwords'

module Inspec::Resources
  class OracledbSession < Inspec.resource(1)
    name 'oracledb_session'
    desc 'Use the oracledb_session InSpec resource to test commands against an Oracle database'
    example "
      describe oracledb_session(user: 'my_user',
                                password: 'password',
                                host: '192.168.0.10',
                                service_name: 'TESTDB',
                                query: 'SELECT NAME FROM v$database;') do
        it { should be_successful }
        its('output') { should_not match /test/ }
      end

      Required values:
       - user
       - pass
       - sid or service_name
       - query

      Optional values:
       - host (default: localhost)
       - port (default: 1526)
    "

    attr_reader :user, :password, :host, :sid, :sqlplus_bin, :service_name, :port

    def initialize(opts = {})
      @user = opts[:user]
      @host = opts[:host] || 'localhost'
      @port = opts[:port] || '1526'
      @sid = opts[:sid]
      @query = opts[:query]
      @service_name = opts[:service_name]
      @sqlplus_bin = opts[:sqlplus_bin] || 'sqlplus'

      # legacy option was "pass" but we prefer "password" for clarity
      if opts[:pass]
        warn '[DEPRECATED] use `password` option to supply password instead of `pass`'
        @password = opts[:pass]
      else
        @password = opts[:password]
      end

      return skip_resource 'The `oracledb_session` resource does not support Windows yet' if inspec.os.windows?
      return skip_resource 'Username and password are required' if @user.nil? || @password.nil?
      return skip_resource 'You must provide at least an SID and/or a Service Name for the session' if @sid.nil? && @service_name.nil?
    end

    def output
      run_query
      @output
    end

    def errors
      run_query
      @errors
    end

    def successful?
      run_query
      @errors.nil? || @errors.empty?
    end

    def query(q)
      warn '[DEPRECATED] pass query in as an option when creating oracledb_session resource'
      @query = q
      run_query
      self
    end

    def run_query
      return if @query_already_run

      db_conn_string = db_conn
      # escaped_query = @query.gsub(/\\/, '\\\\').gsub(/"/, '\\"')
      escaped_query = Shellwords.escape(@query)
      cmd = inspec.command("echo -ne \"set heading off\nset echo off\n#{escaped_query}\" | #{@sqlplus_bin} -s #{db_conn_string}")
      @output = cmd.stdout
      @errors = cmd.stderr
      @query_already_run = true
    end

    def stdout
      warn '[DEPRECATED] use the `output` method to get the output of the oracle query'
      @output
    end

    def stderr
      warn '[DEPRECATED] use the `errors` method to get the errors from the oracle query'
      @errors
    end

    def db_conn
      if @sid
        "#{@user}/#{@password}@#{@host}:#{@port}/#{@sid}"
      else
        "#{@user}/#{@password}@/#{@service_name}"
      end
    end

    def to_s
      'Oracle Session'
    end
  end
end
