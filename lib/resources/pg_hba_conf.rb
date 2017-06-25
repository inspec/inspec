# encoding: utf-8
# copyright: 2017
# author: Rony Xavier,rx294@nyu.edu
# author: Aaron Lippold, lippold@gmail.com
# license: All rights reserved

require 'resources/postgres'

module Inspec::Resources
  class PGHbaConf < Inspec.resource(1)
    name 'pg_hba_conf'
    desc 'Use the `pg_hba_conf` InSpec audit resource to test the client
          authentication data defined in the pg_hba.conf file.'
    example "
      describe pg_hba_conf.where { type == 'local' } do
        its('auth_method') { should eq ['peer'] }
      end
    "

    attr_reader :conf_dir, :conf_file, :params

    # @todo add checks to ensure that we have data in our file
    def initialize(hba_conf_path = nil)
      @conf_dir = inspec.postgres.conf_dir
      @conf_file = hba_conf_path || File.expand_path('pg_hba.conf', inspec.postgres.conf_dir)
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
          .add(:type,     field: 'type')
          .add(:database, field: 'database')
          .add(:user,     field: 'user')
          .add(:address,  field: 'address')
          .add(:auth_method, field: 'auth_method')
          .add(:auth_params, field: 'auth_params')

    filter.connect(self, :params)

    def to_s
      "PG HBA Config #{@conf_file}"
    end

    private

    def clean_conf_file(conf_file = @conf_file)
      data = inspec.file(conf_file).content.to_s.lines
      content = []
      data.each do |line|
        if !line.chomp.match(/^\s*#/) && !line.chomp.empty?
          content << line
        end
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
      @params = {}
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
      x = line.split(' ')
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
