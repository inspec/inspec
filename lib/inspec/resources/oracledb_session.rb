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
      sql = oracledb_session(user: 'my_user', pass: 'password')
      describe sql.query(\"SELECT UPPER(VALUE) AS VALUE FROM V$PARAMETER WHERE UPPER(NAME)='AUDIT_SYS_OPERATIONS'\").row(0).column('value') do
        its('value') { should eq 'TRUE' }
      end
    EXAMPLE

    attr_reader :bin, :db_role, :host, :password, :port, :service,
                :su_user, :user

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

      if inspec_cmd.exit_status != 0 || !inspec_cmd.stderr.empty? || out.downcase =~ /^error.*/
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

    # 3 commands
    # regular user password
    # using a db_role
    # su, using a db_role
    def command_builder(format_options, query)
      if @db_role.nil? || @su_user.nil?
        verified_query = verify_query(query)
      else
        escaped_query = query.gsub(/\\\\/, "\\").gsub(/"/, '\\"')
        escaped_query = escaped_query.gsub("$", '\\$') unless escaped_query.include? "\\$"
        verified_query = verify_query(escaped_query)
      end

      sql_prefix, sql_postfix, oracle_echo_str = "", "", ""
      if inspec.os.windows?
        sql_prefix = %{@'\n#{format_options}\n#{verified_query}\nEXIT\n'@ | }
      else
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

      if @db_role.nil?
        %{#{oracle_echo_str}#{sql_prefix}#{bin} #{user}/#{password}@#{host}:#{port}/#{@service}#{sql_postfix}}
      elsif @su_user.nil?
        %{#{oracle_echo_str}#{sql_prefix}#{bin} #{user}/#{password}@#{host}:#{port}/#{@service} as #{@db_role}#{sql_postfix}}
      else
        # oracle_query_string is echoed to be able to extract the query output clearly
        # su - su_user in certain versions of oracle returns a message
        # Example of msg with query output: The Oracle base remains unchanged with value /oracle\n\nVALUE\n3\n
        %{su - #{@su_user} -c "#{oracle_echo_str} env ORACLE_SID=#{@service} #{@bin} / as #{@db_role}#{sql_postfix}"}
      end
    end

    def verify_query(query)
      query += ";" unless query.strip.end_with?(";")
      query
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
  end
end
