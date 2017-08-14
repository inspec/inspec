# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# author: Aaron Lippold

module Inspec::Resources
  class MysqlSession < Inspec.resource(1)
    name 'mysql_session'
    desc 'Use the mysql_session InSpec audit resource to test SQL commands run against a MySQL database.'
    example "
      sql = mysql_session('my_user','password','host')
      describe sql.query('show databases like \'test\';') do
        its('stdout') { should_not match(/test/) }
      end
    "

    def initialize(user = nil, pass = nil, host = 'localhost', port = nil, socket = nil)
      @user = user
      @pass = pass
      @host = host
      @port = port
      @socket = socket
      init_fallback if user.nil? or pass.nil?
      skip_resource("Can't run MySQL SQL checks without authentication") if @user.nil? or @pass.nil?
    end

    def query(q, db = '')
      # TODO: simple escape, must be handled by a library
      # that does this securely
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"').gsub(/\$/, '\\$')

      # run the query
      command = "mysql -u#{@user} -p#{@pass}"
      if !@socket.nil?
        command += " -S #{@socket}"
      else
        command += " -h #{@host}"
      end
      command += " --port #{@port}" unless @port.nil?
      command += " #{db} -s -e \"#{escaped_query}\""

      cmd = inspec.command(command)
      out = cmd.stdout + "\n" + cmd.stderr
      if out =~ /Can't connect to .* MySQL server/ || out.downcase =~ /^error/
        # skip this test if the server can't run the query
        warn("Can't connect to MySQL instance for SQL checks.")
      end

      # return the raw command output
      cmd
    end

    def to_s
      'MySQL Session'
    end

    private

    def init_fallback
      # support debian mysql administration login
      debian = inspec.command('test -f /etc/mysql/debian.cnf && cat /etc/mysql/debian.cnf').stdout
      return if debian.empty?

      user = debian.match(/^\s*user\s*=\s*([^ ]*)\s*$/)
      pass = debian.match(/^\s*password\s*=\s*([^ ]*)\s*$/)
      return if user.nil? or pass.nil?
      @user = user[1]
      @pass = pass[1]
    end
  end
end
