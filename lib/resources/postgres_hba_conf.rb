# encoding: utf-8
# author: Rony Xavier,rx294@nyu.edu
# author: Aaron Lippold, lippold@gmail.com

require 'resources/postgres'

module Inspec::Resources
  class PostgresHbaConf < Inspec.resource(1)
    name 'postgres_hba_conf'
    desc 'Use the `postgres_hba_conf` InSpec audit resource to test the client
          authentication data defined in the pg_hba.conf file.'
    example "
      describe postgres_hba_conf.where { type == 'local' } do
        its('auth_method') { should eq ['peer'] }
      end
    "

    attr_reader :conf_file, :params

    # @todo add checks to ensure that we have data in our file
    def initialize(hba_conf_path = nil)
      return skip_resource 'The `postgres_hba_conf` resource is not supported on your OS.' unless inspec.os.linux?
      @conf_file = hba_conf_path || File.expand_path('pg_hba.conf', inspec.postgres.conf_dir)
      @content = ''
      @params = {}
      read_content
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:type,     field: 'type')
          .add(:database, field: 'database')
          .add(:user,     field: 'user')
          .add(:address,  field: 'address')
          .add(:auth_method, field: 'auth_method')
          .add(:auth_params, field: 'auth_params')

    filter.connect(self, :params)

    def to_s
      "Postgres Hba Config #{@conf_file}"
    end

    private

    def clean_conf_file(conf_file = @conf_file)
      data = inspec.file(conf_file).content.to_s.lines
      content = []
      data.each do |line|
        line.chomp!
        content << line unless line.match(/^\s*#/) || line.empty?
      end
      content
    end

    def read_content(config_file = @conf_file)
      file = inspec.file(config_file)

      if !file.file?
        return skip_resource "Can't find file \"#{@conf_file}\""
      end

      raw_conf = file.content

      if raw_conf.empty? && !file.empty?
        return skip_resource("Can't read the contents of \"#{@conf_file}\"")
      end

      # @todo use SimpleConfig here if we can
      # ^\s*(\S+)\s+(\S+)\s+(\S+)\s(?:(\d*.\d*.\d*.\d*\/\d*)|(::\/\d+))\s+(\S+)\s*(.*)?\s*$

      @content = clean_conf_file(@conf_file)
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
