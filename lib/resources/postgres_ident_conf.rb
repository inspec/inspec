# encoding: utf-8
# author: Rony Xavier,  rx294@nyu.edu
# author: Aaron Lippold, lippold@gmail.com

require 'resources/postgres'

module Inspec::Resources
  class PostgresIdentConf < Inspec.resource(1)
    name 'postgres_ident_conf'
    desc 'Use the postgres_ident_conf InSpec audit resource to test the client
          authentication data is controlled by a pg_ident.conf file.'
    example "
      describe postgres_ident_conf.where { pg_username == 'acme_user' } do
        its('map_name') { should eq ['ssl-test'] }
      end
    "

    attr_reader :params, :conf_file

    def initialize(ident_conf_path = nil)
      return skip_resource 'The `postgres_ident_conf` resource is not supported on your OS.' unless inspec.os.linux?
      @conf_file = ident_conf_path || File.expand_path('pg_ident.conf', inspec.postgres.conf_dir)
      @content = nil
      @params = nil
      read_content
      return skip_resource '`pg_ident_conf` is not yet supported on your OS' if inspec.os.windows?
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:map_name,        field: 'map_name')
          .add(:system_username, field: 'system_username')
          .add(:pg_username,     field: 'pg_username')

    filter.connect(self, :params)

    def to_s
      "PostgreSQL Ident Config #{@conf_file}"
    end

    private

    def filter_comments(data)
      content = []
      data.each do |line|
        line.chomp!
        content << line unless line.match(/^\s*#/) || line.empty?
      end
      content
    end

    def read_content
      @content = ''
      @params = {}
      @content = filter_comments(read_file(@conf_file))
      @params = parse_conf(@content)
    end

    def parse_conf(content)
      content.map do |line|
        parse_line(line)
      end.compact
    end

    def parse_line(line)
      x = line.split(/\s+/)
      {
        'map_name' => x[0],
        'system_username' => x[1],
        'pg_username' => x[2],
      }
    end

    def read_file(conf_file = @conf_file)
      inspec.file(conf_file).content.lines
    end
  end
end
