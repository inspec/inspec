
require 'hashie/mash'
require 'inspec/utils/database_helpers'
require 'htmlentities'
require 'rexml/document'
require 'csv'

module Inspec::Resources
  # STABILITY: Experimental
  # This resource needs further testing and refinement
  #
  class OracledbSession < Inspec.resource(1)
    name 'oracledb_session'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the oracledb_session InSpec resource to test commands against an Oracle database'
    example <<~EXAMPLE
      sql = oracledb_session(user: 'my_user', pass: 'password')
      describe sql.query(\"SELECT UPPER(VALUE) AS VALUE FROM V$PARAMETER WHERE UPPER(NAME)='AUDIT_SYS_OPERATIONS'\").row(0).column('value') do
        its('value') { should eq 'TRUE' }
      end
    EXAMPLE

    attr_reader :user, :password, :host, :service, :as_os_user, :as_db_role
    # rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
    def initialize(opts = {})
      @user = opts[:user]
      @password = opts[:password] || opts[:pass]
      if opts[:pass]
        Inspec.deprecate(:oracledb_session_pass_option, 'The oracledb_session `pass` option is deprecated. Please use `password`.')
      end

      @host = opts[:host] || 'localhost'
      @port = opts[:port] || '1521'
      @service = opts[:service]

      # connection as sysdba stuff
      return skip_resource "Option 'as_os_user' not available in Windows" if inspec.os.windows? && opts[:as_os_user]
      @su_user = opts[:as_os_user]
      @db_role = opts[:as_db_role]

      # we prefer sqlci although it is way slower than sqlplus, but it understands csv properly
      @sqlcl_bin = 'sql' unless opts.key?(:sqlplus_bin) # don't use it if user specified sqlplus_bin option
      @sqlplus_bin = opts[:sqlplus_bin] || 'sqlplus'

      return fail_resource "Can't run Oracle checks without authentication" if @su_user.nil? && (@user.nil? || @password.nil?)
      return fail_resource 'You must provide a service name for the session' if @service.nil?
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"')
      # escape tables with $
      escaped_query = escaped_query.gsub('$', '\\$')

      p = nil
      # use sqlplus if sqlcl is not available
      if @sqlcl_bin and inspec.command(@sqlcl_bin).exist?
        bin = @sqlcl_bin
        opts = "set sqlformat csv\nSET FEEDBACK OFF"
        p = :parse_csv_result
      else
        bin = @sqlplus_bin
        opts = "SET MARKUP HTML ON\nSET PAGESIZE 32000\nSET FEEDBACK OFF"
        p = :parse_html_result
      end

      query = verify_query(escaped_query)
      query += ';' unless query.end_with?(';')
      if @db_role.nil?
        command = %{#{bin} "#{@user}"/"#{@password}"@#{@host}:#{@port}/#{@service} <<EOC\n#{opts}\n#{query}\nEXIT\nEOC}
      elsif @su_user.nil?
        command = %{#{bin} "#{@user}"/"#{@password}"@#{@host}:#{@port}/#{@service} as #{@db_role} <<EOC\n#{opts}\n#{query}\nEXIT\nEOC}
      else
        command = %{su - #{@su_user} -c "env ORACLE_SID=#{@service} #{bin} / as #{@db_role} <<EOC\n#{opts}\n#{query}\nEXIT\nEOC"}
      end
      cmd = inspec.command(command)

      out = cmd.stdout + "\n" + cmd.stderr
      if out.downcase =~ /^error/
        # TODO: we need to throw an exception here
        # change once https://github.com/chef/inspec/issues/1205 is in
        warn "Could not execute the sql query #{out}"
        DatabaseHelper::SQLQueryResult.new(cmd, Hashie::Mash.new({}))
      end
      DatabaseHelper::SQLQueryResult.new(cmd, send(p, cmd.stdout))
    end

    def to_s
      'Oracle Session'
    end

    private

    def verify_query(query)
      # ensure we have a ; at the end
      query + ';' if !query.strip.end_with?(';')
      query
    end

    def parse_csv_result(stdout)
      output = stdout.delete(/\r/)
      table = CSV.parse(output, { headers: true })

      # convert to hash
      headers = table.headers

      results = table.map { |row|
        res = {}
        headers.each { |header|
          res[header.downcase] = row[header]
        }
        Hashie::Mash.new(res)
      }
      results
    end

    def parse_html_result(stdout) # rubocop:disable Metrics/AbcSize
      result = stdout
      # make oracle html valid html by removing the p tag, it does not include a closing tag
      result = result.gsub('<p>', '').gsub('</p>', '').gsub('<br>', '')
      doc = REXML::Document.new result
      table = doc.elements['table']
      hash = []
      if !table.nil?
        rows = table.elements.to_a
        headers = rows[0].elements.to_a('th').map { |entry| entry.text.strip }
        rows.delete_at(0)

        # iterate over each row, first row is header
        hash = []
        if !rows.nil? && !rows.empty?
          hash = rows.map { |row|
            res = {}
            entries = row.elements.to_a('td')
            # ignore if we have empty entries, oracle is adding th rows in between
            return nil if entries.empty?
            headers.each_with_index { |header, index|
              # we need htmlentities since we do not have nokogiri
              coder = HTMLEntities.new
              val = coder.decode(entries[index].text).strip
              res[header.downcase] = val
            }
            Hashie::Mash.new(res)
          }.compact
        end
      end
      hash
    end
  end
end
