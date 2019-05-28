
require 'inspec/utils/file_reader'
require 'inspec/resources/postgres'

module Inspec::Resources
  class PostgresIdentConf < Inspec.resource(1)
    name 'postgres_ident_conf'
    supports platform: 'unix'
    desc 'Use the postgres_ident_conf InSpec audit resource to test the client
          authentication data is controlled by a pg_ident.conf file.'
    example <<~EXAMPLE
      describe postgres_ident_conf.where { pg_username == 'acme_user' } do
        its('map_name') { should eq ['ssl-test'] }
      end
    EXAMPLE

    include FileReader

    attr_reader :params, :conf_file

    def initialize(ident_conf_path = nil)
      @conf_file = ident_conf_path || File.expand_path('pg_ident.conf', inspec.postgres.conf_dir)
      @content = nil
      @params = nil
      read_content
    end

    filter = FilterTable.create
    filter.register_column(:map_name,        field: 'map_name')
          .register_column(:system_username, field: 'system_username')
          .register_column(:pg_username,     field: 'pg_username')

    filter.install_filter_methods_on_resource(self, :params)

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
      read_file_content(conf_file, allow_empty: true).lines
    end
  end
end
