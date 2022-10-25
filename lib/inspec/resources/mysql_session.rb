# copyright: 2015, Vulcano Security GmbH

require "inspec/resources/command"
require "shellwords" unless defined?(Shellwords)

module Inspec::Resources
  class Lines
    attr_reader :output, :stdout, :stderr, :exit_status

    def initialize(raw, desc, exit_status)
      @output = raw
      @desc = desc
      @exit_status = exit_status
      # backwards compatibility
      @stdout = raw
      @stderr = raw
    end

    def lines
      output.split("\n")
    end

    def to_s
      @desc
    end
  end

  class MysqlSession < Inspec.resource(1)
    name "mysql_session"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the mysql_session InSpec audit resource to test SQL commands run against a MySQL database."
    example <<~EXAMPLE
      sql = mysql_session('my_user','password','host')
      describe sql.query('show databases like \'test\';') do
        its('output') { should_not match(/test/) }
      end
    EXAMPLE

    def initialize(user = nil, pass = nil, host = "localhost", port = nil, socket = nil)
      @user = user
      @pass = pass
      @host = host
      @port = port
      @socket = socket
      @db = nil
      init_fallback if user.nil? || pass.nil?
      raise Inspec::Exceptions::ResourceFailed, "Can't run MySQL SQL checks without authentication." if @user.nil? || @pass.nil?

      test_connection
    end

    def query(q, db = "")
      raise Inspec::Exceptions::ResourceFailed, "#{resource_exception_message}" if resource_failed?

      @db = db
      mysql_cmd = create_mysql_cmd(q, @db)

      cmd = if !@pass.nil?
              inspec.command(mysql_cmd, redact_regex: /(mysql -u\w+ -p).+(\s-(h|S).*)/)
            else
              inspec.command(mysql_cmd)
            end
      out = cmd.stdout + "\n" + cmd.stderr
      if cmd.exit_status != 0 || out =~ /Can't connect to .* MySQL server/ || out.downcase =~ /^error:.*/
        raise Inspec::Exceptions::ResourceFailed, "MySQL query with errors: #{out}"
      else
        Lines.new(cmd.stdout.strip, "MySQL query: #{q}", cmd.exit_status)
      end
    end

    def resource_id
      "mysql_session:User:#{@user}:Host:#{@host}:Database:#{@db}"
    end

    def to_s
      "MySQL Session"
    end

    private

    # Querying on the database to make sure conneciton can be established. If not this will set the resource exception
    # message which we raise before querying on the database using mysql_session object.
    def test_connection
      query("select now()")
    end

    def escape_string(query)
      Shellwords.escape(query)
    end

    def create_mysql_cmd(q, db = "")
      # TODO: simple escape, must be handled by a library
      # that does this securely
      escaped_query = q.gsub(/\\/, "\\\\").gsub(/"/, '\\"').gsub(/\$/, '\\$')

      # construct the query
      command = "mysql"
      command += " -u#{escape_string(@user)}" unless @user.nil?
      command += " -p#{escape_string(@pass)}" unless @pass.nil?

      if !@socket.nil?
        command += " -S #{@socket}"
      else
        command += " -h #{@host}"
      end
      command += " --port #{@port}" unless @port.nil?
      command += " #{db}" unless db.empty?
      command += %{ -s -e "#{escaped_query}"}
      command
    end

    def init_fallback
      # support debian mysql administration login
      return if inspec.platform.in_family?("windows")

      debian = inspec.command("test -f /etc/mysql/debian.cnf && cat /etc/mysql/debian.cnf").stdout
      return if debian.empty?

      user = debian.match(/^\s*user\s*=\s*([^ ]*)\s*$/)
      pass = debian.match(/^\s*password\s*=\s*([^ ]*)\s*$/)
      return if user.nil? || pass.nil?

      @user = user[1]
      @pass = pass[1]
    end
  end
end
