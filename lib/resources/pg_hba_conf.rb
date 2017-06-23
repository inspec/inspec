
# encoding: utf-8
# copyright: 2017
# author: Rony Xavier,rx294@nyu.edu
# license: All rights reserved

module Inspec::Resources
  class PGHbaConf < Inspec.resource(1)
    name 'pg_hba_conf'
    desc 'Use the apache_conf InSpec audit resource to test the client authentication data is controlled by a pg_hba.conf file. '
    example "
      describe pg_hba_conf.where { type == 'local' } do
        its('_method') { should eq ['peer']}
      end
    "

    def initialize(pg_hba_conf_path = nil)
      @pg_hba_conf_path = pg_hba_conf_path || '/var/lib/pgsql/9.5/data/pg_hba.conf'
      @files_contents = {}
      @content = nil
      @params = nil
      read_content
    end

    def content
      @content ||= read_content
    end

    attr_reader :params

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:type,     field: 'type')
          .add(:database, field: 'database')
          .add(:user,     field: 'user')
          .add(:address,  field: 'address')
          .add(:_method,  field: '_method')

    filter.connect(self, :params)

    def filter_comments(data)
      content = []
      data.each do |line|
        if !line.match(/^\s*#/)
          content << line
        end
      end
      content
    end

    def read_content
      @content = ''
      @params = {}
      @content = read_file(@pg_hba_conf_path)
      @content = filter_comments(@content)
      @params = parse_conf(@content)
      # special condtition for local type entry
      @params.each do |line|
        if line['type'] == 'local'
          line['_method'] = line['address']
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
      x = line.split(' ')
      {
        'type' => x[0],
        'database' => x[1],
        'user' => x[2],
        'address' => x[3],
        '_method' => x[4..-1].join(' '),
      }
    end

    def read_file(conf_path)
      @files_contents = inspec.command("sudo cat #{conf_path}").stdout.to_s.lines
    end

    def to_s
      "PG HBA Config #{@conf_path}"
    end
  end
end
