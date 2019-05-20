# copyright: 2015, Vulcano Security GmbH

require 'utils/object_traversal'
require 'utils/simpleconfig'
require 'utils/find_files'
require 'utils/file_reader'
require 'inspec/resources/postgres'

module Inspec::Resources
  class PostgresConf < Inspec.resource(1)
    name 'postgres_conf'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the postgres_conf InSpec audit resource to test the contents of the configuration file for PostgreSQL, typically located at /etc/postgresql/<version>/main/postgresql.conf or /var/lib/postgres/data/postgresql.conf, depending on the platform.'
    example <<~EXAMPLE
      describe postgres_conf do
        its('max_connections') { should eq '5' }
      end
    EXAMPLE

    include FindFiles
    include FileReader
    include ObjectTraverser

    def initialize(conf_path = nil)
      @conf_path = conf_path || inspec.postgres.conf_path
      if @conf_path.nil?
        return skip_resource 'PostgreSQL conf path is not set'
      end
      @conf_dir = File.expand_path(File.dirname(@conf_path))
      @files_contents = {}
      @content = nil
      @params = nil
      read_content
    end

    def content
      @content ||= read_content
    end

    def params(*opts)
      @params || read_content
      res = @params
      opts.each do |opt|
        res = res[opt] unless res.nil?
      end
      res
    end

    def value(key)
      extract_value(key, @params)
    end

    def method_missing(*keys)
      keys.shift if keys.is_a?(Array) && keys[0] == :[]
      param = value(keys)
      return nil if param.nil?
      # extract first value if we have only one value in array
      return param[0] if param.length == 1
      param
    end

    def to_s
      'PostgreSQL Configuration'
    end

    private

    def read_content
      @content = ''
      @params = {}

      to_read = [@conf_path]
      until to_read.empty?
        base_dir = File.dirname(to_read[0])
        raw_conf = read_file(to_read[0])
        @content += raw_conf

        opts = {
          assignment_regex: /^\s*([^=]*?)\s*=\s*[']?\s*(.*?)\s*[']?\s*$/,
        }
        params = SimpleConfig.new(raw_conf, opts).params
        @params.merge!(params)

        to_read = to_read.drop(1)
        # see if there is more config files to include

        to_read += include_files(params, base_dir).find_all do |fp|
          not @files_contents.key? fp
        end
      end
      @content
    end

    def include_files(params, base_dir)
      include_files = Array(params['include']) || []
      include_files += Array(params['include_if_exists']) || []
      include_files.map! do |f|
        Pathname.new(f).absolute? ? f : File.join(base_dir, f)
      end

      dirs = Array(params['include_dir']) || []
      dirs.each do |dir|
        dir = File.join(base_dir, dir) if dir[0] != '/'
        include_files += find_files(dir, depth: 1, type: 'file')
      end
      include_files
    end

    def read_file(path)
      @files_contents[path] ||= read_file_content(path)
    end
  end
end
