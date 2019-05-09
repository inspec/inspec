# copyright: 2015, Vulcano Security GmbH

require 'inspec/utils/simpleconfig'
require 'inspec/utils/find_files'
require 'inspec/utils/file_reader'
require 'inspec/utils/hash'
require 'inspec/resources/mysql'

module Inspec::Resources
  class MysqlConfEntry
    def initialize(path, params)
      @params = params
      @path = path
    end

    def method_missing(name, *_)
      k = name.to_s
      res = @params[k]
      return true if res.nil? && @params.key?(k)
      @params[k]
    end

    def to_s
      "MySQL Config entry [#{@path.join(' ')}]"
    end
  end

  class MysqlConf < Inspec.resource(1)
    name 'mysql_conf'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the mysql_conf InSpec audit resource to test the contents of the configuration file for MySQL, typically located at /etc/mysql/my.cnf or /etc/my.cnf.'
    example <<~EXAMPLE
      describe mysql_conf('path') do
        its('setting') { should eq 'value' }
      end

      # Test a parameter set within the [mysqld] section
      describe mysql_conf do
        its('mysqld.port') { should cmp 3306 }
      end

      # Test a parameter set within the [mariadb] section using array notation
      describe mysql_conf do
        its(['mariadb', 'max-connections']) { should_not be_nil }
      end
    EXAMPLE

    include FindFiles
    include FileReader

    def initialize(conf_path = nil)
      @conf_path = conf_path || inspec.mysql.conf_path
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
      MysqlConfEntry.new(opts, res)
    end

    def method_missing(name)
      @params || read_content
      @params[name.to_s]
    end

    def read_content
      @content = ''
      @params = {}

      to_read = [@conf_path]
      until to_read.empty?
        cur_file = to_read[0]
        raw_conf = read_file(cur_file)
        @content += raw_conf

        params = SimpleConfig.new(raw_conf).params
        @params = @params.deep_merge(params)

        to_read = to_read.drop(1)
        # see if there is more stuff to include

        dir = File.dirname(cur_file)
        to_read += include_files(dir, raw_conf).find_all do |fp|
          not @files_contents.key? fp
        end
      end
      #
      @content
    end

    def include_files(reldir, conf)
      files = conf.scan(/^!include\s+(.*)\s*/).flatten.compact.map { |x| abs_path(reldir, x) }
      dirs = conf.scan(/^!includedir\s+(.*)\s*/).flatten.compact.map { |x| abs_path(reldir, x) }
      dirs.map do |dir|
        # @TODO: non local glob
        files += find_files(dir, depth: 1, type: 'file')
      end
      files
    end

    def abs_path(dir, f)
      return f if f.start_with? '/'
      File.join(dir, f)
    end

    def read_file(path)
      @files_contents[path] ||= read_file_content(path)
    end

    def to_s
      'MySQL Configuration'
    end
  end
end
