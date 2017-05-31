# encoding: utf-8
# author: Nolan Davidson
# author: Christoph Hartmann
# author: Dominik Richter

require 'hashie/mash'
require 'utils/database_helpers'
require 'htmlentities'

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

    attr_reader :user, :password, :host, :service

    def initialize(opts = {})
      @user = opts[:user]
      @password = opts[:password] || opts[:pass]
      if opts[:pass]
        warn '[DEPRECATED] use `password` option to supply password instead of `pass`'
      end

      @host = opts[:host] || 'localhost'
      @port = opts[:port] || '1521'
      @service = opts[:service]

      # we prefer sqlci although it is way slower than sqlplus, but it understands csv properly
      @sqlcl_bin = 'sql'
      @sqlplus_bin = opts[:sqlplus_bin] || 'sqlplus'

      return skip_resource "Can't run Oracle checks without authentication" if @user.nil? || @password.nil?
      return skip_resource 'You must provide at least an SID and/or a Service Name for the session' if @service.nil?
    end

    def query(q)
      escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"')
      # escape tables with $
      escaped_query = escaped_query.gsub('$', "\\$")

      p = nil
      # check if sqlcl is available and prefer that
      if inspec.command(@sqlcl_bin).exist?
        bin = @sqlcl_bin
        opts = "set sqlformat csv\nSET FEEDBACK OFF"
        p = :parse_csv_result
      elsif inspec.command(@sqlplus_bin).exist?
        bin = @sqlplus_bin
        opts = "SET MARKUP HTML ON\nSET FEEDBACK OFF"
        p = :parse_html_result
      end

      return skip_resource("Can't find suitable Oracle CLI") if p.nil?

      cmd = inspec.command("echo \"#{opts}\n#{escaped_query};\nEXIT\" | #{bin} -s #{@user}/#{@password}@#{@host}:#{@port}/#{@service}")
      out = cmd.stdout + "\n" + cmd.stderr
      if out.downcase =~ /^error/
        # TODO: we need to throw an exception here
        # change once https://github.com/chef/inspec/issues/1205 is in
        warn "Could not execute the sql query #{out}"
        DatabaseHelper::SQLQueryResult.new(cmd, Hashie::Mash.new({}))
      end

      DatabaseHelper::SQLQueryResult.new(cmd, send(p, cmd.stdout.gsub(/\r/,'')))
    end

    def to_s
      'Oracle Session'
    end

    private

    def parse_csv_result(stdout)
      require 'csv'
      table = CSV.parse(stdout, { headers: true })

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

    def parse_html_result(stdout)
      result = stdout
      # make oracle html valid html by removing the p tag, it does not include a closing tag
      result = result.gsub('<p>', '').gsub('</p>', '').gsub('<br>', '')

      require 'rexml/document'
      doc = REXML::Document.new result
      table = doc.elements['table']

      hash = {}
      if !table.nil?
        rows = table.elements.to_a
        headers = rows[0].elements.to_a('/th').map { |entry| entry.text.strip }
        rows.delete(0)

        # iterate over each row, first row is header
        hash = rows.map { |row|
          res = {}
          entries = row.elements.to_a('/td')

          headers.each_with_index { |header, index|
            # we need htmlentities since we do not have nokogiri
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
