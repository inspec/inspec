# encoding: utf-8
# author: Nolan Davidson

module Inspec::Resources

  class OracleSQLColumn
    def initialize(row, name)
      @row = row
      @name = name
    end

    def value
      @row[@name.downcase]
    end

    def to_s
      'Oracle SQL Column'
    end
  end

  class OracleSQLRow
    def initialize(query, row)
      @query = query
      @row = row
    end

    def column(column)
      OracleSQLColumn.new(@row, column)
    end

    def to_s
      'Oracle SQL Row'
    end
  end

  class OracleSQLQueryResult
    def initialize(cmd, results)
      @cmd = cmd
      @results = results
    end

    def empty?
      @results.empty?
    end

    def stdout
      @cmd.stdout
    end

    def stderr
      @cmd.stderr
    end

    def row(id)
      OracleSQLRow.new(self, @results[id])
    end

    def inspect
      to_s
    end

    def to_s
      'Oracle SQL ResultSet'
    end
  end

  class OracledbSession < Inspec.resource(1)
    name 'oracledb_session'
    desc 'Use the oracledb_session InSpec resource to test commands against an Oracle database'
    example "
      sql = oracledb_session(user: 'my_user', pass: 'password')
      describe sql.query('SELECT NAME FROM v$database;') do
        its('stdout') { should_not match(/test/) }
      end
    "

    attr_reader :user, :pass, :host, :service, :sqlplus_bin

    def initialize(opts = {})
      @user = opts[:user]
      @pass = opts[:pass]
      @host = opts[:host] || 'localhost'
      @port = opts[:port] || '1521'
      @service = opts[:service]
      @sqlplus_bin = opts[:sqlplus_bin] || 'sqlplus'
      return skip_resource("Can't run Oracle checks without authentication") if @user.nil? or @pass.nil?
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"')
      # escape tables with $
      escaped_query = escaped_query.gsub('$', "\\$")
      cmd = inspec.command("echo \"SET MARKUP HTML ON\nSET FEEDBACK OFF\n#{escaped_query};\nEXIT\" | #{@sqlplus_bin} -s #{@user}/#{@pass}@#{@host}:#{@port}/#{@service}")

      out = cmd.stdout + "\n" + cmd.stderr
      if out.downcase =~ /^error/
        return skip_resource("Can't connect to Oracle instance for SQL checks.")
      end

      OracleSQLQueryResult.new(cmd, parse_result(cmd))
    end

    def to_s
      'Oracle Session'
    end

    private

    def parse_result(cmd)
      result = cmd.stdout
      # make oracle html valid html by removing the p tag, it does not include a closing tag
      result = result.gsub("<p>","").gsub("</p>","").gsub("<br>","")

      require "rexml/document"
      doc = REXML::Document.new result
      table = doc.elements["table"]

      hash = {}
      if !table.nil?
        rows = table.elements.to_a
        headers = rows[0].elements.to_a( "//th" ).map { |entry| entry.text.strip }
        rows.delete(0)

        # iterate over each row, first row is header
        hash = rows.map { |row|
          res = {}
          entries = row.elements.to_a( "//td" )

          headers.each_with_index { |header, index|
            # TODO: once nokogiri is back, we can remove html entities
            require 'htmlentities'
            coder = HTMLEntities.new
            val = coder.decode(entries[index].text).strip
            res[header.downcase] = val
          }

          Hashie::Mash.new(res)
        }
      end
      hash
    end
  end
end
