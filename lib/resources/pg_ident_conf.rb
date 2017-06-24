# encoding: utf-8
# copyright: 2017
# author: Rony Xavier,  rx294@nyu.edu
# author: Aaron Lippold, lippold@gmail.com
# license: All rights reserved

require 'resources/postgres'

module Inspec::Resources
  class PGIdentConf < Inspec.resource(1)
    name 'pg_ident_conf'
    desc 'Use the pg_ident_conf InSpec audit resource to test the client
          authentication data is controlled by a pg_ident.conf file.'
    example "
      describe pg_ident_conf.where { pg_username == 'stig_user' } do
        its('map_name') { should eq ['ssl-test'] }
      end
    "

    attr_reader :params, :conf_dir, :conf_file

    def initialize(ident_conf_path = nil)
      @conf_dir = inspec.postgres.conf_dir
      @conf_file = ident_conf_path || File.expand_path('pg_ident.conf', inspec.postgres.conf_dir)
      @files_contents = {}
      @content = nil
      @params = nil
      read_content
    end

    def content
      @content ||= read_content
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:map_name,        field: 'map_name')
          .add(:system_username, field: 'system_username')
          .add(:pg_username,     field: 'pg_username')

    filter.connect(self, :params)

    def to_s
      "PG Ident Config #{@conf_file}"
    end

    private

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
      raw_file = read_file(@conf_file)
      @content = filter_comments(raw_file)
      @params = parse_conf(@content)
    end

    def parse_conf(content)
      content.map do |line|
        parse_line(line)
      end.compact
    end

    def parse_line(line)
      x = line.split(' ')
      {
        'map_name' => x[0],
        'system_username' => x[1],
        'pg_username' => x[2],
      }
    end

    def read_file(conf_file = @conf_file)
      @files_contents = inspec.file(conf_file).content.lines
    end
  end
end
