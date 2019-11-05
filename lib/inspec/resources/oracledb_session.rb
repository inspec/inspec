require "inspec/resources/command"
require "inspec/utils/database_helpers"
require "htmlentities"
require "rexml/document"
require "hashie/mash"
require "csv"

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
      fail_resource "Can't run Oracle checks without authentication" unless su_user && (user || password)
      fail_resource "You must provide a service name for the session" unless service
    end

    def query(sql)
      if @sqlcl_bin && inspec.command(@sqlcl_bin).exist?
        @bin = @sqlcl_bin
        format_options = "set sqlformat csv\nSET FEEDBACK OFF"
        parser = :parse_csv_result
      else
        @bin = "#{@sqlplus_bin} -S"
        format_options = "SET MARKUP HTML ON\nSET PAGESIZE 32000\nSET FEEDBACK OFF"
        parser = :parse_html_result
      end

      command = command_builder(format_options, sql)
      inspec_cmd = inspec.command(command)

      DatabaseHelper::SQLQueryResult.new(inspec_cmd, send(parser,
                                                          inspec_cmd.stdout))
    end

    def to_s
      "Oracle Session"
    end

    private

    # 3 commands
    # regular user password
    # using a db_role
    # su, using a db_role
    def command_builder(format_options, query)
      verified_query = verify_query(query)
      sql_prefix, sql_postfix = "", ""
      if inspec.os.windows?
        sql_prefix = %{@'\n#{format_options}\n#{verified_query}\nEXIT\n'@ | }
      else
        sql_postfix = %{ <<'EOC'\n#{format_options}\n#{verified_query}\nEXIT\nEOC}
      end

      if @db_role.nil?
        %{#{sql_prefix}#{bin} "#{user}"/"#{password}"@#{host}:#{port}/#{@service}#{sql_postfix}}
      elsif @su_user.nil?
        %{#{sql_prefix}#{bin} "#{user}"/"#{password}"@#{host}:#{port}/#{@service} as #{@db_role}#{sql_postfix}}
      else
        %{su - #{@su_user} -c "env ORACLE_SID=#{@service} #{bin} / as #{@db_role}#{sql_postfix}}
      end
    end

    def verify_query(query)
      query += ";" unless query.strip.end_with?(";")
      query
    end

    def parse_csv_result(stdout)
      output = stdout.delete(/\r/)
      table = CSV.parse(output, { headers: true })

      # convert to hash
      headers = table.headers

      results = table.map do |row|
        res = {}
        headers.each do |header|
          res[header.downcase] = row[header]
        end
        Hashie::Mash.new(res)
      end
      results
    end

    def parse_html_result(stdout)
      result = stdout
      # make oracle html valid html by removing the p tag, it does not include a closing tag
      result = result.gsub("<p>", "").gsub("</p>", "").gsub("<br>", "")
      doc = REXML::Document.new result
      table = doc.elements["table"]
      hash = []
      unless table.nil?
        rows = table.elements.to_a
        headers = rows[0].elements.to_a("th").map { |entry| entry.text.strip }
        rows.delete_at(0)

        # iterate over each row, first row is header
        hash = []
        if !rows.nil? && !rows.empty?
          hash = rows.map do |row|
            res = {}
            entries = row.elements.to_a("td")
            # ignore if we have empty entries, oracle is adding th rows in between
            return nil if entries.empty?

            headers.each_with_index do |header, index|
              # we need htmlentities since we do not have nokogiri
              coder = HTMLEntities.new
              val = coder.decode(entries[index].text).strip
              res[header.downcase] = val
            end
            Hashie::Mash.new(res)
          end.compact
        end
      end
      hash
    end
  end
end
