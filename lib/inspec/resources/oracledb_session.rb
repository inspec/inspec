require "inspec/resources/command"
require "inspec/utils/database_helpers"
require "hashie/mash"
require "csv" unless defined?(CSV)

module Inspec::Resources
  # STABILITY: Experimental
  # This resource needs further testing and refinement
  #
  class OracledbSession < Inspec.resource(1)
    name "oracledb_session"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the oracledb_session InSpec resource to test commands against an Oracle database"
    example <<~EXAMPLE
      # Basic connection with host and service
      sql = oracledb_session(user: 'my_user', password: 'password', host: 'localhost', service: 'XEPDB1')
      describe sql.query(\"SELECT UPPER(VALUE) AS VALUE FROM V$PARAMETER WHERE UPPER(NAME)='AUDIT_SYS_OPERATIONS'\").row(0).column('value') do
        its('value') { should eq 'TRUE' }
      end

      # Using TNS alias (preferred for TCPS/SSL connections)
      sql = oracledb_session(
        user: 'my_user',
        password: 'password',
        tns_alias: 'MYDB_TCPS',
        env: {
          'TNS_ADMIN' => '/path/to/tnsnames',
          'LD_LIBRARY_PATH' => '/opt/oracle/instantclient:$PATH'
        }
      )
      
    EXAMPLE
    attr_reader :bin, :db_role, :host, :password, :port, :service,
                :su_user, :user, :tns_alias, :env_vars

    def initialize(opts = {})
      @user = opts[:user]
      @password = opts[:password] || opts[:pass]
      if opts[:pass]
        Inspec.deprecate(:oracledb_session_pass_option, "The oracledb_session `pass` option is deprecated. Please use `password`.")
      end

      @bin = "sqlplus"
      @host = opts[:host] || "localhost"
      @port = opts[:port] || "1521"
      @service = opts[:service]
      @su_user = opts[:as_os_user]
      @db_role = opts[:as_db_role]
      @sqlcl_bin = opts[:sqlcl_bin] || nil
      @sqlplus_bin = opts[:sqlplus_bin] || "sqlplus"
      
      # New options for TNS alias and environment variables (CHEF-28019)
      # TNS alias: use TNS name from tnsnames.ora (preferred for TCPS/SSL)
      # env: hash of environment variables to set for the command (e.g., TNS_ADMIN, LD_LIBRARY_PATH)
      @tns_alias = opts[:tns_alias] || opts["tns_alias"]
      @env_vars = opts[:env] || opts["env"] || {}
      
      skip_resource "Option 'as_os_user' not available in Windows" if inspec.os.windows? && su_user
      fail_resource "Can't run Oracle checks without authentication" unless su_user || (user || password)
    end

    def query(sql)
      raise Inspec::Exceptions::ResourceSkipped, "#{resource_exception_message}" if resource_skipped?
      raise Inspec::Exceptions::ResourceFailed, "#{resource_exception_message}" if resource_failed?

      if @sqlcl_bin && inspec.command(@sqlcl_bin).exist?
        @bin = @sqlcl_bin
        format_options = "set sqlformat csv\nSET FEEDBACK OFF"
      else
        @bin = "#{@sqlplus_bin} -S"
        format_options = "SET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF"
      end

      command = command_builder(format_options, sql)
      inspec_cmd = inspec.command(command)
      out = inspec_cmd.stdout + "\n" + inspec_cmd.stderr

      if inspec_cmd.exit_status != 0 || out.downcase =~ /^error.*/
        raise Inspec::Exceptions::ResourceFailed, "Oracle query with errors: #{out}"
      else
        begin
          unless inspec_cmd.stdout.empty?
            DatabaseHelper::SQLQueryResult.new(inspec_cmd, parse_csv_result(inspec_cmd.stdout))
          else
            inspec_cmd.stdout
          end
        rescue Exception => ex
          raise Inspec::Exceptions::ResourceFailed, "Oracle query with exception: #{ex}"
        end
      end
    end

    def to_s
      "Oracle Session"
    end

    def resource_id
      if @user
        "#{@host}-#{@port}-#{@user}"
      elsif @su_user
        "#{@host}-#{@port}-#{@su_user}"
      else
        ""
      end
    end

    private

    # Build command with support for TNS alias, environment variables, and db_role
    def command_builder(format_options, query)
      if @db_role.nil? || @su_user.nil?
        verified_query = verify_query(query)
      else
        escaped_query = escape_query(query)
        verified_query = verify_query(escaped_query)
      end

      # Build the connect string (TNS alias or host:port/service)
      connect_string = build_connect_string

      sql_prefix, sql_postfix, oracle_echo_str = "", "", ""
      if inspec.os.windows?
        sql_prefix = %{@'\n#{format_options}\n#{verified_query}\nEXIT\n'@ | }
      else
        # For TNS alias support, use /nolog then connect inside heredoc
        sql_postfix = %{ <<'EOC'\n#{format_options}\n#{verified_query}\nEXIT\nEOC}
        # oracle_query_string is echoed to be able to extract the query output clearly
        oracle_echo_str = %{echo 'oracle_query_string';}
      end

      # Resetting sql_postfix if system is using AIX OS and C shell installation for oracle
      if inspec.os.aix?
        command_to_fetch_shell = @su_user ? %{su - #{@su_user} -c "env | grep SHELL"} : %{env | grep SHELL}
        shell_is_csh = inspec.command(command_to_fetch_shell).stdout&.include? "/csh"
        sql_postfix = %{ <<'EOC'\n#{format_options}\n#{verified_query}\nEXIT\n'EOC'} if shell_is_csh
      end

      # Build environment variable prefix
      env_prefix = build_env_prefix

      # Build the sqlplus command
      if @su_user.nil?
        # For TNS alias, use -s /nolog then connect to allow proper TNS resolution
        if @tns_alias && !@tns_alias.to_s.empty?
          heredoc_content = "connect #{connect_string}\n#{format_options}\n#{verified_query}\nEXIT"
          cmd = %{#{oracle_echo_str}#{sql_prefix}#{bin} -s /nolog <<'INSPECSQL'\n#{heredoc_content}\nINSPECSQL}
        else
          # Traditional direct connection for host:port/service
          cmd = %{#{oracle_echo_str}#{sql_prefix}#{bin} #{connect_string}#{sql_postfix}}
        end
        
        full_cmd = env_prefix.empty? ? cmd : "#{env_prefix} #{cmd}"
      else
        # su - su_user in certain versions of oracle returns a message
        # Example of msg with query output: The Oracle base remains unchanged with value /oracle\n\nVALUE\n3\n
        heredoc_content = "connect #{connect_string}\n#{format_options}\n#{verified_query}\nEXIT"
        cmd = %{su - #{@su_user} -c "#{oracle_echo_str} env ORACLE_SID=#{@service} #{env_prefix} #{@bin} -s /nolog <<'INSPECSQL'\n#{heredoc_content}\nINSPECSQL"}
        full_cmd = cmd
      end

      full_cmd
    end

    def verify_query(query)
      query += ";" unless query.strip.end_with?(";")
      query
    end

    def escape_query(query)
      escaped_query = query.gsub(/\\\\/, "\\").gsub(/"/, '\\"')
      escaped_query = escaped_query.gsub("$", '\\$') unless escaped_query.include? "\\$"
      escaped_query
    end

    def parse_csv_result(stdout)
      output = stdout.split("oracle_query_string")[-1]
      # comma_query_sub replaces the csv delimiter "," in the output.
      # Handles CSV parsing of data like this (DROP,3) etc

      output = output.sub(/\r/, "").strip.gsub(",", "comma_query_sub")
      converter = ->(header) { header.downcase }
      CSV.parse(output, headers: true, header_converters: converter).map do |row|
        next if row.entries.flatten.empty?

        revised_row = row.entries.flatten.map { |entry| entry&.gsub("comma_query_sub", ",") }
        Hashie::Mash.new([revised_row].to_h)
      end
    end

    # Build the Oracle connect string
    # Supports TNS alias (preferred for TCPS) or host:port/service format
    def build_connect_string
      if @tns_alias && !@tns_alias.to_s.empty?
        # TNS alias format: user/password@tns_alias
        connect_str = "#{@user}/#{@password}@#{@tns_alias}"
        # Add db_role if specified
        connect_str += " as #{@db_role}" if @db_role && !@su_user
        connect_str
      elsif @host && @service
        # Traditional format: user/password@host:port/service
        connect_str = "#{@user}/#{@password}@#{@host}:#{@port}/#{@service}"
        # Add db_role if specified
        connect_str += " as #{@db_role}" if @db_role && !@su_user
        connect_str
      else
        # Minimal format: user/password (for local connections)
        connect_str = "#{@user}/#{@password}"
        connect_str += " as #{@db_role}" if @db_role && !@su_user
        connect_str
      end
    end

    # Build environment variable prefix for command
    # Expands $PATH placeholders and properly quotes values for shell
    def build_env_prefix
      return "" if @env_vars.nil? || @env_vars.empty?

      # Transform keys to strings and expand $PATH references
      env_for_prefix = @env_vars.transform_keys(&:to_s).transform_values do |v|
        vs = v.to_s
        # Expand $PATH or ${PATH} with current environment PATH
        if vs.include?('$PATH') || vs.include?('${PATH}')
          current_path = ENV['PATH'].to_s
          vs = vs.gsub('${PATH}', current_path).gsub('$PATH', current_path)
        end
        vs
      end

      # Build env prefix with proper shell quoting
      env_for_prefix.map { |k, v| "#{k}=#{shell_quote(v)}" }.join(' ')
    end

    # Quote a value for use in a POSIX shell assignment
    # Single quotes with internal single-quotes escaped
    def shell_quote(val)
      "'" + val.to_s.gsub("'", "'\"'\"'") + "'"
    end
  end
end
