
require 'inspec/resources/postgres'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class PostgresHbaConf < Inspec.resource(1)
    name 'postgres_hba_conf'
    supports platform: 'unix'
    desc 'Use the `postgres_hba_conf` InSpec audit resource to test the client
          authentication data defined in the pg_hba.conf file.'
    example <<~EXAMPLE
      describe postgres_hba_conf.where { type == 'local' } do
        its('auth_method') { should eq ['peer'] }
      end
    EXAMPLE

    include FileReader

    attr_reader :conf_file, :params

    # @todo add checks to ensure that we have data in our file
    def initialize(hba_conf_path = nil)
      @conf_file = hba_conf_path || File.expand_path('pg_hba.conf', inspec.postgres.conf_dir)
      @content = ''
      @params = {}
      read_content
    end

    filter = FilterTable.create
    filter.register_column(:type,     field: 'type')
          .register_column(:database, field: 'database')
          .register_column(:user,     field: 'user')
          .register_column(:address,  field: 'address')
          .register_column(:auth_method, field: 'auth_method')
          .register_column(:auth_params, field: 'auth_params')

    filter.install_filter_methods_on_resource(self, :params)

    def to_s
      "Postgres Hba Config #{@conf_file}"
    end

    private

    def clean_conf_file(conf_file = @conf_file)
      data = read_file_content(conf_file).to_s.lines
      content = []
      data.each do |line|
        line.chomp!
        content << line unless line.match(/^\s*#/) || line.empty?
      end
      content
    end

    def read_content(config_file = @conf_file)
      # @todo use SimpleConfig here if we can
      # ^\s*(\S+)\s+(\S+)\s+(\S+)\s(?:(\d*.\d*.\d*.\d*\/\d*)|(::\/\d+))\s+(\S+)\s*(.*)?\s*$

      @content = clean_conf_file(config_file)
      @params = parse_conf(@content)
      @params.each do |line|
        if line['type'] == 'local'
          line['auth_method'] = line['address']
          line['address'] = ''
        end
      end
    end

    def parse_conf(content)
      content.map do |line|
        parse_line(line)
      end.compact
    end

    def parse_line(line)
      x = line.split(/\s+/)
      {
        'type' => x[0],
        'database' => x[1],
        'user' => x[2],
        'address' => x[3],
        'auth_method' => x[4],
        'auth_params' =>  ('' if x.length == 4) || x[5..-1].join(' '),
      }
    end
  end
end
